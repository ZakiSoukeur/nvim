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
-- CTRL+T to split the current window vertically
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.keymap.set('n', '<C-t>', ':vsplit<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<C-x>', ':close<CR>', { noremap = true, silent = true })
    end
})
