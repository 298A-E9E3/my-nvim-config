require("config.lazy")
require("config.keymap")
require("config.lsp")
-- nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- basedpyright
vim.lsp.enable("basedpyright")

-- nvim-tree
-- optionally enable 24-bit colour
vim.opt.termguicolors = true
-- empty setup using defaults
--require("nvim-tree").setup()

-- vscode
vim.o.background = 'dark'
-- require('vscode').load()

-- load the theme without affecting devicon colors.
vim.cmd.colorscheme "tokyonight"


-- Set tab size
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")

-- Define custom filetypes
vim.filetype.add({
    extension = {
        jinja2 = "jinja2",
        j2 = "jinja2",
    }
})

-- Open CHADtree on startup if nvim wasn't opened with a file
local fileArg = next(vim.fn.argv())
if fileArg == nil or vim.uv.fs_stat(fileArg) then
    vim.cmd("Neotree")
end

--require("config.coc")



