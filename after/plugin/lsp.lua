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


lsp.setup()
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
-- local luasnip = require("luasnip")
lspconfig.ts_ls.setup({})
lspconfig.tailwindcss.setup({})

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
local luasnip = require("luasnip")

vim.keymap.set({ "i" }, "<C-K>", function() luasnip.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() luasnip.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() luasnip.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end, { silent = true })
require("luasnip.loaders.from_vscode").lazy_load()
local cmp = require("cmp")
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
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- enable LuaSnip in cmp
        { name = 'buffer' },
        { name = 'path' },
    }),

    -- ... Your other configuration ...
})
require("colorizer").setup()
