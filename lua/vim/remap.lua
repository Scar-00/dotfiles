vim.opt.updatetime = 100
vim.g.autoraed = true
vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.ruler = true
vim.opt.visualbell = true
vim.opt.encoding = "utf-8"
vim.opt.wrap = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.mouse = "a"
--tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true

--vim.opt.shortmess = "c"
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
local opts = { noremap=true, silent=true }
--vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', opts)
--vim.api.nvim_set_keymap('n', '<C-g>', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', opts)
local builtin = require('telescope.builtin')
vim.keymap.set("n", '<C-f>', builtin.find_files, opts)
vim.keymap.set("n", '<C-g>', builtin.live_grep, opts)

vim.keymap.set("n", '<S-Up>', 'v<Up>')
vim.keymap.set("n", '<S-Down>', 'v<Down>')
vim.keymap.set("n", '<S-Left>', 'v<Left>')
vim.keymap.set("n", '<S-Right>', 'v<Right>')
vim.keymap.set('v', "<S-Down>", "<Down>")
vim.keymap.set('v', "<S-Left>", "<Left>")
vim.keymap.set('v', "<S-Right>", "<Right>")
vim.keymap.set("i", "<S-Up>", "<Esc>v<Up>")
vim.keymap.set("i", "<S-Down>", "<Esc>v<Down>")
vim.keymap.set("i", "<S-Left>", "<Esc>v<Left>")
vim.keymap.set("i", "<S-Right>", "<Esc>v<Right>")

vim.keymap.set("v", "<C-c>", "y<Esc>i")
vim.keymap.set("v", "<C-x>", "d<Esc>i")
--map <C-v> p
vim.keymap.set("i", "<C-v>", "<Esc>p")
vim.keymap.set("i", "<C-z>", "<Esc>ui")
vim.keymap.set("v", "<C-z>", "<Esc>ui")
