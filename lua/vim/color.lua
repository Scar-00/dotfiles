local fm = require 'fluoromachine'

fm.setup {
    glow = false,
    theme = 'fluoromachine',
    brightness = 0.5,
    transparent = "full"
}

require('rose-pine').setup({
    enable = {
        terminal = true
    },
    styles = {
        bold = false,
        italic = false,
        transparency = true,
    },
})

--vim.cmd.colorscheme('tokyonight-night')
--vim.cmd.colorscheme('fluoromachine')
vim.cmd.colorscheme('rose-pine')

vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#e0def4", bg = "#403d52", bold = true })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#908caa", bg = "none" })
