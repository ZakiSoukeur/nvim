local lsp = require('lsp-zero').preset({
    manage_nvim_cmp = {
        set_extra_mappings = true,
    }
})
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
-- local luasnip = require("luasnip")
local cmp = require("cmp")

require("catppuccin").setup({
    transparent_background = true,
})

local none_ls = require("null-ls") -- still called "null-ls" in code
require('lspconfig').pylsp.setup({
    settings = {
        pylsp = {
            plugins = {
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                black = { enabled = false }, -- we’ll handle Black via null-ls
            }
        }
    }
})


none_ls.setup({
    sources = {
        none_ls.builtins.formatting.black.with({
            extra_args = { "--line-length", "120" },
        }),
    },
})
local luasnip = require('luasnip')
cmp.setup({

    -- ... Your other configuration ...

    mapping = {

        -- ... Your other mappings ...
        ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if luasnip.expandable() then
                    luasnip.expand()
                else
                    cmp.confirm({
                        select = true,
                    })
                end
            else
                fallback()
            end
        end),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),

        -- ... Your other mappings ...
    },

    -- ... Your other configuration ...
})
require("colorizer").setup()
