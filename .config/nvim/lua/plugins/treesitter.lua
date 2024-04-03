return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
        event = "BufRead",
		config = function()
			require("nvim-treesitter.configs").setup({
				-- A list of parser names, or "all"
				ensure_installed = {
					"vimdoc",
					"lua",
					"rust",
					"jsdoc",
					"bash",
                    "markdown",
                    "markdown_inline",
				},
				auto_install = true,
				indent = { enable = true },
				highlight = { enable = true },
			})
		end,
	},
	{
		"folke/twilight.nvim",
		opts = {},
	},
	{
		"folke/zen-mode.nvim",
		opts = {},
		config = function()
			require("zen-mode").setup({
				vim.keymap.set("n", "<Leader>z", ":ZenMode<CR>"),
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
}
