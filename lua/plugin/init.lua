local gh = function(repo)
    return 'https://github.com/' .. repo
end

vim.pack.add({
    gh('neovim/nvim-lspconfig'),
    gh('nvim-lualine/lualine.nvim'),
    gh('nvim-tree/nvim-web-devicons'),
    gh('ntpeters/vim-better-whitespace'),
    gh('windwp/nvim-autopairs'),
    gh('nvim-lua/plenary.nvim'),
    gh('nvim-telescope/telescope.nvim'),
    gh('nvim-treesitter/nvim-treesitter'),
    gh('j-hui/fidget.nvim'),
    gh('mason-org/mason.nvim'),
    gh('ej-shafran/compile-mode.nvim'),
    gh('ring0-rootkit/gruber-darker.nvim')
}, { confirm = false })
