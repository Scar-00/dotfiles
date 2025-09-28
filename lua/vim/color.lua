local fm = require 'fluoromachine'

fm.setup {
    glow = false,
    theme = 'fluoromachine',
    brightness = 0.5,
    transparent = "full"
}

require('rose-pine').setup({
    styles = {
        bold = false,
        italic = false,
        transparency = true,
    },
})

--vim.cmd.colorscheme('tokyonight-night')
--vim.cmd.colorscheme('fluoromachine')
vim.cmd.colorscheme('rose-pine')

--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", border = 'rounded', })
--vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", link= "Normal", border = 'rounded', })
