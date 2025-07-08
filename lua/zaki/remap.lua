vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

-- Use <leader>y to copy to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>Y', '"+Y', { noremap = true, silent = true })

-- Use <leader>p to paste from system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>P', '"+P', { noremap = true, silent = true })

-- CTRL+T to vsplit current buffer in a new tab
vim.keymap.set('n', '<C-t>', function()
    vim.cmd('vsplit')
end, { noremap = true, silent = true })

-- x to close the current tab (only in normal mode)
-- WARNING: If you bind 'x' alone, it will override Vim's 'x' (delete char)
-- Better: use <leader>x or another key
vim.keymap.set('n', '<leader>x', ':tabclose<CR>', { noremap = true, silent = true })
