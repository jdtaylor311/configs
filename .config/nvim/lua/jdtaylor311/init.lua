require("jdtaylor311.remap")
require("jdtaylor311.set")
local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufWritePre" }, {
    pattern = "*",
    command = [[%s/\s\+$//e]]
})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.filetype.add {
    extension = {
        zsh = "sh",
        sh = "sh"
    },
    filename = {
        [".zshrc"] = "sh",
        [".zshenv"] = "sh"
    }
}
