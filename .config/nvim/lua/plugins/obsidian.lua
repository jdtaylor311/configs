return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = { "markdown" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
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
