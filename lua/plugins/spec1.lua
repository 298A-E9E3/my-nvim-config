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
        -- config = true,
    },
    {

        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        "windwp/nvim-ts-autotag",
        opts = {
            opts = {
                -- Defaults
                enable_close = true, -- Auto close tags
                enable_rename = true, -- Auto rename pairs of tags
                enable_close_on_slash = false -- Auto close on trailing </
            },
        }
    }
    --{"mfussenegger/nvim-jdtls"},

}
