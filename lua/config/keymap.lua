-- Based off of (read: shamelessly stolen from) https://github.com/sshaaf/nvim/blob/main/lua/neovim4j/core/keymaps.lua
-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>h", "<Cmd>wincmd h<CR>", { desc = "Move cursor to left window" })
keymap.set("n", "<leader>j", "<Cmd>wincmd j<CR>", { desc = "Move cursor to bottom window" })
keymap.set("n", "<leader>k", "<Cmd>wincmd k<CR>", { desc = "Move cursor to top window" })
keymap.set("n", "<leader>l", "<Cmd>wincmd l<CR>", { desc = "Move cursor to right window" })

-- My personal binds

-- Open Neotree
keymap.set("n", "<leader>ft", "<cmd>Neotree<CR>", { desc = "Open Neotree" })
-- Select all
keymap.set("n", "<leader>sa", "ggVG", { desc = "Select entire file" })
-- Save buffer
keymap.set({"n", "i"}, "<C-s>", "<cmd>w<CR>", { desc = "Save Buffer"})



-- Enable Autocomplete
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		--vim.lsp.completion.enable(true, args.data.client_id, args.buf, { autotrigger = true })
		--keymap.set('i', '<C-Space>', function()
		--vim.lsp.completion.get()
		--end, { buffer = args.buf })

	end,
})
