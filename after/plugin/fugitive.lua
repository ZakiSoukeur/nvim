vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.g.lightline = {
    active = {
        left = {
            { 'mode',     'paste' },
            { 'readonly', 'filename', 'modified', 'gitbranch' },
        },
        right = {
            { 'lineinfo' },
            { 'percent' },
            { 'fileformat', 'fileencoding', 'filetype' },
        }
    },
    component_function = {
        gitbranch = 'FugitiveHead',
        filename = 'v:lua.LightlineFilename'
    }
}
function _G.LightlineFilename()
    local git_dir = vim.b.git_dir or ''
    local root = vim.fn.fnamemodify(git_dir, ':h')
    local path = vim.fn.expand('%:p')

    if path:sub(1, #root) == root then
        return path:sub(#root + 2) -- skip slash too
    end

    return vim.fn.expand('%')
end
