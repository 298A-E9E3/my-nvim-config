return {
    {'neovim/nvim-lspconfig', module=true},
    {'hrsh7th/cmp-nvim-lsp', module=true},
    {'hrsh7th/cmp-buffer', module=true},
    {'hrsh7th/cmp-path', module=true},
    {'hrsh7th/cmp-cmdline', module=true},
    {'hrsh7th/cmp-calc', module=true},


    {
        'hrsh7th/nvim-cmp',
        priority = 51,
        requirements = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-calc',

        },
        config = function()
            local cmp = require'cmp'

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                        vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

                        -- For `mini.snippets` users:
                        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
                        -- insert({ body = args.body }) -- Insert at cursor
                        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
                        -- require("cmp.config").set_onetime({ sources = {} })
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'ale' },
                    { name = 'calc' },
                    { name = 'lazydev', group_index = 0 }
                    -- { name = 'vsnip' }, -- For vsnip users.
                    -- { name = 'luasnip' }, -- For luasnip users.
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                    -- { name = 'snippy' }, -- For snippy users.
                }, {
                    { name = 'buffer' },
                })
            })

            -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
            -- Set configuration for specific filetype.
            --[[ cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'git' },
                }, {
                    { name = 'buffer' },
                })
            })
            require("cmp_git").setup() ]]--

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                }),
                matching = { disallow_symbol_nonprefix_matching = false }
            })
            -- Set up lspconfig.
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
            vim.treesitter.language.register('html', { 'jinja2', 'j2' })
            vim.lsp.config('html', {
                capabilities = capabilities,
                filetypes = {"html", "jinja2"},
            })

            vim.lsp.enable('html')

            vim.lsp.config('vtsls', {
                capabilities = capabilities,
                filetypes = {"html", "jinja2"},
            })

            vim.lsp.enable('vtsls')

            vim.lsp.config('lua_ls', {
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if
                            path ~= vim.fn.stdpath('config')
                            and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                            then
                                return
                            end
                        end

                        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                            runtime = {
                                -- Tell the language server which version of Lua you're using (most
                                -- likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT',
                                -- Tell the language server how to find Lua modules same way as Neovim
                                -- (see `:h lua-module-load`)
                                path = {
                                    'lua/?.lua',
                                    'lua/?/init.lua',
                                },

                            },
                            -- Make the server aware of Neovim runtime files
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    vim.env.VIMRUNTIME,
                                    -- For LSP Settings Type Annotations: https://github.com/neovim/nvim-lspconfig#lsp-settings-type-annotations
                                    vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
                                },
                                -- Or pull in all of 'runtimepath'.
                                -- NOTE: this is a lot slower and will cause issues when working on
                                -- your own configuration.
                                -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                                -- library = vim.api.nvim_get_runtime_file('', true),
                            },
                        })
                    end,
                    settings = {
                        Lua = {},
                    },
                })

                -- vim.lsp.config('lua_ls', {
                    --     capabilities = capabilities,
                    -- })

                    vim.lsp.enable('lua_ls')

                end
            },
            {
                'dense-analysis/ale',
                enabled = true,
                config = function()
                    -- Configuration goes here.
                    local g = vim.g

                    g.ale_ruby_rubocop_auto_correct_all = 1

                    g.ale_linters = {
                        --ruby = {'rubocop=', 'ruby'},
                        -- lua = {'lua_language_server'},
                        python = {'ty'},
                        -- javascript = {'quick_lint_js'}

                    }

                    g.ale_completion_enabled = 1

                end
            },
            {
                "folke/lazydev.nvim",
                enabled = false,
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
            {
                "mason-org/mason.nvim",
                opts = {
                    registries = {
                        "github:mason-org/mason-registry"
                    }
                }

            },
            {
                "mason-org/mason-lspconfig.nvim",
                opts = {
                    ensure_installed = {
                        "html",
                        "vtsls",
                        -- ty is not included because it needs compilation on ARM devices
                    },
                },
            },

            

        }
