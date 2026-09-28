return {
    --{"neovim/nvim-lspconfig"},
    --{"nvim-tree/nvim-tree.lua"},
    --{"nvim-tree/nvim-web-devicons"},
    {"Mofiqul/vscode.nvim"},
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "ms-jpq/chadtree",
        branch = "chad",
        build = "python3 -m chadtree deps"
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
                jinja2 = {'djlint'}
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
    }
    --{"mfussenegger/nvim-jdtls"},

}
