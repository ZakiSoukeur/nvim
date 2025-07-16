vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.termguicolors = true

vim.opt.updatetime = 50
vim.g.mapleader = " " -- spacebar as leader
vim.opt.diffopt:append("vertical")
vim.opt.swapfile = false
vim.o.background = "dark"
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorHold" }, {
    callback = function()
        vim.cmd("redrawstatus")
    end,
})
vim.o.sessionoptions = "buffers,curdir,tabpages,winsize"
