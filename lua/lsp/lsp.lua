local opts = { noremap = true, silent = true }
local capabilities = require('cmp_nvim_lsp').default_capabilities()
--nvim.api.nvim_set_keymap('n', "")

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    --add option to go up
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ge', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover({border = \'rounded\'})<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 's', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'i', ',s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',qf', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ee', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

    --vim.lsp.inlay_hint(bufnr, true)
end

local _border = "rounded"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)

vim.diagnostic.config{
  float={border=_border}
}

local servers = { 'clangd', 'rust_analyzer', "slint_lsp", "zls", "texlab", "lua_ls" }
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        }
    }
end

require('lspconfig').clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--background-index",
        "--pch-storage=memory",
        "--clang-tidy",
        "--suggest-missing-includes",
        "--all-scopes-completion",
        "--pretty",
        "--header-insertion=never",
        "-j=4",
        "--inlay-hints",
        "--header-insertion-decorators",
    },
    filetypes = { 'c', 'cpp' },
    init_option = { fallbackFlags = { '-std=c++a2' } }
}

require('lspconfig').slint_lsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { 'slint-lsp' },
    filetypes = { 'slint' },
}

require('lspconfig').rust_analyzer.setup {
    on_attach = on_attach,
    setting = {
        ['rust_analyzer'] = {
            cargo = {
                allFeatures = true,
            },
        },
    },
    flags = {
        debounce_text_changes = 150,
    }
}

require('lspconfig').zls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

--[[require('lspconfig').tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
}]]

require('lspconfig').texlab.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "tex" },
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "tex" },
    cmd = { "C:/dev/rust/texlab/target/release/texlab" }
}

require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities
    --filetypes = { "tex" },
    --cmd = { "C:/dev/rust/texlab/target/release/texlab" }
}

--require('lspconfig').lygos_lsp.setup {
--    on_attach = on_attach,
--    cmd = {
--        "~/Desktop/lygos-lsp/target/debug/lygos-lsp",
--    },
--    filetypes = { 'ly' },
--}
