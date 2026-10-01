local enable_on = {
                "html",
                "htmldjango",
                "jinja2",
                "tsx",
                "jsx",
                "erb",
                "svelte",
                "vue",
                "blade",
                "php",
                "templ",
                "astro",
            }
return {
    {
        "Jezda1337/nvim-html-css",
        lazy = true,
        ft = enable_on,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            enable_on = enable_on,
            handlers = {
                definition = {
                    bind = "gd"
                },
                hover = {
                    bind = "K",
                    wrap = true,
                    border = "none",
                    position = "cursor",
                },
            },
            documentation = {
                auto_show = true,
            },
            peek = {
                enabled = true,
                border = "rounded",
                position = "center",
                width = 0.5,
                height = 0.5,
                focus = true,
                style = "minimal",
            },
            style_sheets = {
                "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
                "https://cdnjs.cloudflare.com/ajax/libs/bulma/1.0.3/css/bulma.min.css",
                "./index.css", -- `./` refers to the current working directory.
            },
        },
    }
}
