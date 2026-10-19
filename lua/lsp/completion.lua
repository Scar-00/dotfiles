-- Neovim 0.12 completion: buffer words plus LSP when a server attaches.
vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'popup' }
vim.opt.complete = { '.', 'w', 'b' }
vim.opt.autocomplete = true
vim.opt.autocompletedelay = 100
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('CompletionExclusions', { clear = true }),
    pattern = 'TelescopePrompt',
    callback = function(event)
        vim.bo[event.buf].autocomplete = false
    end,
})
vim.opt.pumborder = 'rounded'
vim.opt.wildmenu = true
vim.opt.wildoptions:append('pum')
vim.opt.wildmode = 'noselect:full,full'

vim.api.nvim_create_autocmd('CmdlineChanged', {
    group = vim.api.nvim_create_augroup('CmdlineCompletion', { clear = true }),
    pattern = ':',
    callback = function()
        vim.fn.wildtrigger()
    end,
})

vim.keymap.set('c', '<Tab>', function()
    if vim.fn.wildmenumode() == 1 then
        return vim.fn.cmdcomplete_info().selected == -1 and '<C-n><C-y>' or '<C-y>'
    end
    -- Ctrl-Z triggers native completion from mappings.
    return '<C-z>'
end, { expr = true })

for key, direction in pairs({ ['<Down>'] = '<C-n>', ['<Up>'] = '<C-p>', ['<S-Tab>'] = '<C-p>' }) do
    vim.keymap.set('c', key, function()
        return vim.fn.wildmenumode() == 1 and direction or key
    end, { expr = true })
end

local function has_words_before()
    local col = vim.fn.col('.') - 1
    return col > 0 and vim.api.nvim_get_current_line():sub(col, col):match('%s') == nil
end

local opts = { expr = true, silent = true }
vim.keymap.set({ 'i', 's' }, '<Tab>', function()
    if vim.fn.pumvisible() == 1 then
        -- Tab accepts the first item even when nothing is selected yet.
        return vim.fn.complete_info({ 'selected' }).selected == -1 and '<C-n><C-y>' or '<C-y>'
    end
    if vim.snippet.active({ direction = 1 }) then
        return '<Cmd>lua vim.snippet.jump(1)<CR>'
    end
    return has_words_before() and '<C-n>' or '<Tab>'
end, opts)
vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
    if vim.fn.pumvisible() == 1 then
        return '<C-p>'
    end
    if vim.snippet.active({ direction = -1 }) then
        return '<Cmd>lua vim.snippet.jump(-1)<CR>'
    end
    return '<S-Tab>'
end, opts)
vim.keymap.set('i', '<CR>', function()
    if vim.fn.pumvisible() == 1 then
        return vim.fn.complete_info({ 'selected' }).selected >= 0 and '<C-y>'
            or '<C-e>' .. require('nvim-autopairs').autopairs_cr()
    end
    return require('nvim-autopairs').autopairs_cr()
end, opts)
vim.keymap.set('i', '<C-Space>', '<C-n>', { silent = true })
-- File paths use native <C-x><C-f>; : command completion uses Tab/Shift-Tab.
