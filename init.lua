require('plugin')

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

vim.filetype.add({
    extention = {
        ly = 'lygos'
    },
})

require('lsp_signature').setup(lsp_signature_cfg)

require('vim')

require('neovide')

require('lualine').setup()

vim.g.compile_mode = {
    input_word_completion = true,
    focus_compilation_buffer = true,
}

-- nvim-treesitter
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.lygos = {
    install_info = {
        url = "C:\\dev\\lygos\\treesitter-lygos", -- local path or git repo
        files = {"src/parser.c"},
    },
    filetype = "lygos", -- if filetype does not agrees with parser name
}

require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "cpp" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

require('nvim-autopairs').setup {}

