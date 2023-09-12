local cmp = require("cmp")

cmp.setup({
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        -- Add tab support
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping.abort(),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
    },
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources(
    {
        { name = 'cmp_git' },
    },
    {
        { name = 'buffer' },
    }
    )
})

cmp.setup.cmdline(':', {
    sources = cmp.config.sources(
    {
        { name = 'path' },
    },
    {
        { name = 'cmdline' },
    }
    )
})

