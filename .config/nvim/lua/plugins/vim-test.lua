return {
    'vim-test/vim-test',
    depends = {
        'preservim/vimux'
    },
    event = 'BufEnter',
    config = function()
       vim.keymap.set('n', '<leader>tt', ':TestNearest<CR>')
        vim.keymap.set('n', '<leader>tf', ':TestFile<CR>')
        vim.keymap.set('n', '<leader>ts', ':TestSuite<CR>')
        vim.keymap.set('n', '<leader>tl', ':TestLast<CR>')
        vim.keymap.set('n', '<leader>tv', ':TestVisit<CR>')
        vim.cmd("let test#strategy = 'vimux'")
    end,
}
