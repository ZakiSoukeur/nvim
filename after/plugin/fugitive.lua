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
            { 'blame',   'fileformat', 'fileencoding', 'filetype' },
        }
    },
    component_function = {
        gitbranch = 'FugitiveHead',
        filename = 'v:lua.LightlineFilename',
        blame = 'v:lua.LightlineBlame'
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

function _G.LightlineBlame()
    -- Get current line number
    local line = vim.fn.line('.')

    -- Run git blame for the current file + line
    local blame = vim.fn.systemlist({
        'git', 'blame', '--line-porcelain', '-L',
        string.format('%d,%d', line, line), vim.fn.expand('%')
    })

    if not blame or #blame == 0 then return '' end

    local author, author_time = '', ''

    for _, l in ipairs(blame) do
        if l:match('^author ') then
            author = l:sub(8)
        elseif l:match('^author-time ') then
            author_time = l:sub(13)
        end
    end
    if author == 'Not Committed Yet' or author == '' then
        return ''
    end

    return author .. ' ' .. author_time
end
