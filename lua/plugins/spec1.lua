return {
    {
        'nvim-tree/nvim-web-devicons',
        opts = {
            override = {
                jinja2 = {
                    icon = "",
                    color = "#7E0C1B",
                    cterm_color = "52",
                    name = "Jinja2"
                }
            }

        }
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            -- "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false, -- neo-tree will lazily load itself
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            extensions = {"nvim-tree", "chadtree", "neo-tree"},
            options = {
                theme = 'tokyonight'
            }
        }
    },
    {
        "ms-jpq/chadtree",
        branch = "chad",
        build = "python3 -m chadtree deps",
        enabled = false
    },
    {
        "jake-stewart/multicursor.nvim",
        branch = "1.0",
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
            },
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate'
    },
    {
        "hiphish/rainbow-delimiters.nvim",
        config = function ()
            local g = vim.g
            g.rainbow_delimiters = {
                highlight = {
                    'RainbowDelimiterYellow',
                    'RainbowDelimiterRed',
                    'RainbowDelimiterBlue',
                },
            }
        end

    },
    {"mfussenegger/nvim-dap"},
    {"rcarriga/nvim-dap-ui"},
    {"neoclide/coc.nvim", branch = 'release', enabled =false},
    {
        'dense-analysis/ale',
        config = function()
            -- Configuration goes here.
            local g = vim.g

            g.ale_ruby_rubocop_auto_correct_all = 1

            g.ale_linters = {
                --ruby = {'rubocop=', 'ruby'},
                lua = {'lua_language_server'},
                python = {'ty'},
                -- javascript = {'quick_lint_js'}

            }

            g.ale_completion_enabled = 1

        end
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
        lazy = false,
        ft = {"markdown", "md"}
    },
    {
        "numToStr/Comment.nvim"
    },
    {"michaeljsmith/vim-indent-object"},
    {
        "AndrewRadev/inline_edit.vim",
        lazy = true,
        cmd = { "InlineEdit" },
        keys = {
            { "<leader>cI", "<cmd>InlineEdit<cr>", desc = "Inline Edit (JS inside <script> html)" },
        },
        config = true,
    },
    --{"mfussenegger/nvim-jdtls"},

}
