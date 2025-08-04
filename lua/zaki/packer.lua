vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use("nvim-treesitter/playground")
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-cmdline" },
            { "L3MON4D3/LuaSnip" },
            { "hrsh7th/cmp-path" },
            { 'hrsh7th/cmp-nvim-lsp' },         -- Required
            { 'rafamadriz/friendly-snippets' }, -- Pre-made VSCode snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
        }
    }
    use "ray-x/lsp_signature.nvim"
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = "frappe", -- or latte, frappe, macchiato
                -- transparent_background = true,
            })
        end,
    })

    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })
    use {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            }
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { { 'itchyny/vim-gitbranch' },
            { 'nvim-tree/nvim-web-devicons' }, opt = true } }
    use('mrloop/telescope-git-branch.nvim')
    use('nvimtools/none-ls.nvim')
    use('lewis6991/gitsigns.nvim')
    use('rbong/vim-flog')
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- Optional image support in preview window: See `# Preview Mode` for more information
            -- { "3rd/image.nvim", config = function() require('image').setup({}) end },
            -- OR use snacks.nvim's image module:
            -- "folke/snacks.nvim",
        }
    })
    use('ap/vim-css-color')
    use("catgoose/nvim-colorizer.lua")
    use { 'dsznajder/vscode-es7-javascript-react-snippets', run = 'yarn install --frozen-lockfile && yarn compile' }
    use "mg979/vim-visual-multi"
end)
