local lsp = require('lsp-zero').preset({})
lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat()
    -- Format on save (fallback to null-ls if pylsp disables formatting)
end)
lsp.ensure_installed({
    'gopls',
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
