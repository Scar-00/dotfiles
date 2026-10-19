local opts = { noremap = true, silent = true }

local on_attach = function(client, bufnr)
    if client:supports_method('textDocument/completion') then
        vim.lsp.completion.enable(true, client.id, bufnr)
        vim.bo[bufnr].complete = 'o,.,w,b'
    end

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, { buffer = bufnr }))
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { buffer = bufnr }))
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = 'rounded' }) end, vim.tbl_extend('force', opts, { buffer = bufnr }))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { buffer = bufnr }))
    vim.keymap.set('n', 's', function() vim.lsp.buf.signature_help({ border = 'rounded' }) end, vim.tbl_extend('force', opts, { buffer = bufnr }))
    vim.keymap.set('i', ',s', function() vim.lsp.buf.signature_help({ border = 'rounded' }) end, vim.tbl_extend('force', opts, { buffer = bufnr }))
    vim.keymap.set('n', ',wa', vim.lsp.buf.add_workspace_folder, vim.tbl_extend('force', opts, { buffer = bufnr }))
    vim.keymap.set('n', ',wr', vim.lsp.buf.remove_workspace_folder, vim.tbl_extend('force', opts, { buffer = bufnr }))
    vim.keymap.set('n', ',wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, vim.tbl_extend('force', opts, { buffer = bufnr }))
    vim.keymap.set('n', ',D', vim.lsp.buf.type_definition, vim.tbl_extend('force', opts, { buffer = bufnr }))
    vim.keymap.set('n', ',rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { buffer = bufnr }))
    vim.keymap.set('n', ',qf', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { buffer = bufnr }))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { buffer = bufnr }))
    vim.keymap.set('n', ',f', vim.lsp.buf.format, vim.tbl_extend('force', opts, { buffer = bufnr }))
    vim.keymap.set('n', 'ee', vim.diagnostic.open_float, vim.tbl_extend('force', opts, { buffer = bufnr }))

end

vim.diagnostic.config({ float = { border = 'rounded' } })

vim.lsp.config('*', {
    on_attach = on_attach,
})

vim.lsp.config('mdx_analyzer', {
    filetypes = { 'markdown.mdx' },
})

local pyonji_types = 'C:/dev/learning/pyonji/resources/default.lua'
local pyonji_dirs = {
    'C:/dev/learning/pyonji',
    vim.fs.normalize(vim.env.LOCALAPPDATA .. '/pyonji'),
}

local function pyonji_dir(path)
    path = vim.fs.normalize(path):lower()
    for _, dir in ipairs(pyonji_dirs) do
        if path == dir:lower() or vim.startswith(path, dir:lower() .. '/') then
            return dir
        end
    end
end

vim.lsp.config('lua_ls', {
    on_attach = on_attach,
    -- pyonji config dirs have no root markers, so give them an explicit root
    root_dir = function(bufnr, on_dir)
        local name = vim.api.nvim_buf_get_name(bufnr)
        on_dir(pyonji_dir(name) or vim.fs.root(bufnr, vim.lsp.config.lua_ls.root_markers))
    end,
    before_init = function(_, config)
        local pyonji = config.root_dir and pyonji_dir(config.root_dir)
        config.settings.Lua = vim.tbl_deep_extend('force', config.settings.Lua or {}, {
            runtime = pyonji and { version = 'Lua 5.4' } or {
                version = 'LuaJIT',
                path = { 'lua/?.lua', 'lua/?/init.lua' },
            },
            workspace = {
                checkThirdParty = false,
                library = { pyonji and pyonji_types or vim.env.VIMRUNTIME },
            },
        })
    end,
})

vim.lsp.enable({ 'clangd', 'rust_analyzer', 'slint_lsp', 'zls', 'texlab', 'lua_ls', 'ts_ls', 'csharp_ls', 'mdx_analyzer', 'tinymist' })
