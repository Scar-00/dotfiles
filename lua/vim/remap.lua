local opts = { noremap=true, silent=true }
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
vim.keymap.set("i", "<C-v>", "<Esc>p")
vim.keymap.set("i", "<C-z>", "<Esc>ui")
vim.keymap.set("v", "<C-z>", "<Esc>ui")

vim.keymap.set('n', '<C-z>', '<Nop>')
