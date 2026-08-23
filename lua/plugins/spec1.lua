return {
	{"neovim/nvim-lspconfig"},
	{"nvim-tree/nvim-tree.lua"},
	{"nvim-tree/nvim-web-devicons"},
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
	}
}
