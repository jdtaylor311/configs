return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = { "markdown" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "Personal",
				path = "~/vaults/Personal",
			},
			{
				name = "Work",
				path = "~/vaults/Work",
			},
		},
		notes_subdir = "notes",
		daily_notes = {
			folder = "notes/dailies",
			date_format = "%Y-%m-%d",
		},
        completion = {
            nvim_cmp = true,
            min_chars = 2,
        },
	},
}
