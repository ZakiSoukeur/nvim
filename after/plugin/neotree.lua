vim.api.nvim_set_hl(0, "NeoTreeMatchHighlight", { fg = "#FFD700", bold = true })
vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#44475a" }) -- change to your theme's highlight bg

vim.keymap.set("n", "<leader>e", "<Cmd>Neotree reveal<CR>")
require("neo-tree").setup({
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
    filesystem = {
        filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false, --
        },
        cwd_target = {
            sidebar = "tab", -- or "window" if using split layout
            current = "window",
        },
        follow_current_file = {
            enabled = true, -- ✅ reopen last file on session restore
            leave_dirs_open = true,
        },
        hijack_netrw_behavior = "open_default", -- safe override
        use_libuv_file_watcher = true,
    },
    git_status = {
        window = {
            position = "float",
            mappings = {
                ["A"] = "git_add_all",
                ["gu"] = "git_unstage_file",
                ["gU"] = "git_undo_last_commit",
                ["ga"] = "git_add_file",
                ["gr"] = "git_revert_file",
                ["gc"] = "git_commit",
                ["gp"] = "git_push",
                ["gg"] = "git_commit_and_push",
                ["o"] = {
                    "show_help",
                    nowait = false,
                    config = { title = "Order by", prefix_key = "o" },
                },
                ["oc"] = { "order_by_created", nowait = false },
                ["od"] = { "order_by_diagnostics", nowait = false },
                ["om"] = { "order_by_modified", nowait = false },
                ["on"] = { "order_by_name", nowait = false },
                ["os"] = { "order_by_size", nowait = false },
                ["ot"] = { "order_by_type", nowait = false },
            },
        },
    }
})
