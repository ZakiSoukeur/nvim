vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.g.lightline = {
    active = {
        left = {
            { 'mode',     'paste' },
            { 'readonly', 'filename', 'modified',  'gitbranch' },
        },
        right = {
            { 'lineinfo' },
            { 'percent' },
            { 'fileformat', 'fileencoding', 'filetype' },
        }
    },
    component_function = {
        gitbranch = 'FugitiveHead'
    }
}
