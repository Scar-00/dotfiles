local fm = require 'fluoromachine'

fm.setup {
    glow = false,
    theme = 'fluoromachine',
    brightness = 0.5,
    transparent = "full"
}



--vim.cmd.colorscheme('tokyonight-storm')
vim.cmd.colorscheme('fluoromachine')
--vim.cmd.colorscheme('rose-pine')

--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { })
vim.api.nvim_set_hl(0, "FloatBorder", { link= "Normal" })
