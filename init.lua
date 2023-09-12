require('plugin')

vim.cmd([[
	so ~/.config/nvim/legacy.vim
]])

require('lsp')
--require('nvimcmp')

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

require('lualine').setup()

require('nvim-treesitter.configs').setup {
    ensure_installed = {"c", "cpp"},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

-- nvim-treesitter
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.lygos = {
  install_info = {
    url = "https://github.com/Scar-00/tree-sitter-lygos", -- local path or git repo
    files = {"src/parser.c"},
    -- optional entries:
    --branch = "main", -- default branch in case of git repo if different from master
    --generate_requires_npm = true, -- if stand-alone parser without npm dependencies
    --requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
--  filetype = "ly", -- if filetype does not agrees with parser name
}

require('nvim-autopairs').setup {}

