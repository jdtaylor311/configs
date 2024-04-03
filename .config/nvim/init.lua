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
require("jdtaylor311")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
