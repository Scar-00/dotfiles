local gh = function(repo)
    return 'https://github.com/' .. repo
end

vim.pack.add({
    gh('neovim/nvim-lspconfig'),
    gh('ray-x/lsp_signature.nvim'),
    gh('hrsh7th/cmp-nvim-lsp'),
    gh('hrsh7th/cmp-buffer'),
    gh('hrsh7th/cmp-path'),
    gh('hrsh7th/cmp-cmdline'),
    gh('hrsh7th/nvim-cmp'),
    gh('hrsh7th/vim-vsnip'),
    gh('zefei/vim-colortuner'),
    gh('rust-lang/rust.vim'),
    gh('mfussenegger/nvim-dap'),
    gh('rcarriga/nvim-dap-ui'),
    gh('nvim-lualine/lualine.nvim'),
    gh('nvim-tree/nvim-web-devicons'),
    gh('ntpeters/vim-better-whitespace'),
    gh('windwp/nvim-autopairs'),
    gh('easymotion/vim-easymotion'),
    gh('tpope/vim-fugitive'),
    gh('nvim-lua/plenary.nvim'),
    gh('nvim-telescope/telescope.nvim'),
    gh('morhetz/gruvbox'),
    gh('nvim-treesitter/nvim-treesitter'),
    gh('sbdchd/neoformat'),
    gh('folke/tokyonight.nvim'),
    gh('maxmx03/fluoromachine.nvim'),
    { src = gh('rose-pine/neovim'), name = 'rose-pine' },
    gh('kdheepak/lazygit.nvim'),
    gh('j-hui/fidget.nvim'),
    gh('mason-org/mason.nvim'),
    gh('sphamba/smear-cursor.nvim'),
    gh('ej-shafran/compile-mode.nvim'),
    gh('ring0-rootkit/gruber-darker.nvim')
}, { confirm = false })
