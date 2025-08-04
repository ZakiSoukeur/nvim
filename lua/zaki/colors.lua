-- -- Catppuccin setup
require("catppuccin").setup({
    flavour = "frappe",
    transparent_background = true,
})
--
vim.cmd.colorscheme("catppuccin")

-- Optional transparent highlights
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- numbers colors
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#898890' }) -- Example: light grey
