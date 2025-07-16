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

function _G.LightlineBlame()
    local line = vim.fn.line('.')
    local file = vim.fn.expand('%')
    local blame = vim.fn.systemlist({ 'git', 'blame', '--line-porcelain', '-L', line .. ',' .. line, file })

    if not blame or #blame == 0 then return '' end

    local author, timestamp_str = '', ''
    for _, l in ipairs(blame) do
        if vim.startswith(l, 'author ') then
            author = l:sub(8)
        elseif vim.startswith(l, 'author-time ') then
            timestamp_str = l:sub(13)
        end
    end

    if author == '' or author == 'Not Committed Yet' then
        return ''
    end

    local function time_ago(ts)
        local now = os.time()
        local diff = now - ts
        if diff < 60 then
            return diff .. 's ago'
        elseif diff < 3600 then
            return math.floor(diff / 60) .. 'm ago'
        elseif diff < 86400 then
            return math.floor(diff / 3600) .. 'h ago'
        elseif diff < 2629743 then -- ~1 month
            return math.floor(diff / 86400) .. 'd ago'
        elseif diff < 31556926 then -- ~1 year
            return math.floor(diff / 2629743) .. 'mo ago'
        else
            return math.floor(diff / 31556926) .. 'y ago'
        end
    end

    local ts = tonumber(timestamp_str)
    local relative = ts and time_ago(ts) or timestamp_str

    return string.format('%s, %s', author, relative)
end
