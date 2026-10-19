require('plugin')

vim.filetype.add({
    extension = {
        mdx = 'markdown.mdx',
    },
})

vim.cmd([[
	so ~/.config/nvim/legacy.vim
]])

require('lsp')
--require('nvimcmp')

require("mason").setup()
require('fidget').setup{}
--require('smear_cursor').setup{}

lsp_signature_cfg = {
    hint_prefix = "",
    floating_window = true,
    bind = true,
    handler_opts = {
        border = "rounded"
    }
}

require('lsp_signature').setup(lsp_signature_cfg)

require('vim')

require('neovide')

require('lualine').setup()

vim.g.compile_mode = {
    input_word_completion = true,
    focus_compilation_buffer = true,
}

require('nvim-treesitter').setup()
require('lygos').setup({ parser_path = 'C:/dev/learning/lygos/tree-sitter-lygos' })

require('nvim-autopairs').setup {}
