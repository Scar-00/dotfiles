require('plugin')

vim.filetype.add({
    extension = {
        mdx = 'markdown.mdx',
    },
})

require('vim')
require('lsp')

require('mason').setup()
require('fidget').setup {}

require('neovide')

require('lualine').setup()

vim.g.compile_mode = {
    input_word_completion = true,
    focus_compilation_buffer = true,
}

require('nvim-treesitter').setup()
require('lygos').setup({ parser_path = 'C:/dev/learning/lygos/tree-sitter-lygos' })

require('nvim-autopairs').setup { map_cr = false }
