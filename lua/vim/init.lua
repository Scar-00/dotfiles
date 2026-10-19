require('vim.remap')
require('vim.color')

vim.opt.updatetime = 100
vim.opt.autoread = true
vim.opt.number = true
vim.opt.visualbell = true
vim.opt.wrap = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.signcolumn = 'yes'
vim.opt.clipboard = 'unnamedplus'
vim.opt.winborder = 'rounded'

-- Keep :SetTab without overriding filetype indentation whenever a file is read.
vim.api.nvim_create_user_command('SetTab', function(args)
    local width = tonumber(args.args)
    if not width or width < 1 or width % 1 ~= 0 then
        error('SetTab expects a positive integer')
    end
    vim.opt_local.tabstop = width
    vim.opt_local.shiftwidth = width
    vim.opt_local.softtabstop = width
    vim.opt_local.expandtab = true
    vim.opt_local.autoindent = true
    vim.opt_local.smartindent = true
end, { nargs = 1, desc = 'Set indentation width for this buffer' })

local cargo_commands
local function complete_cargo(lead, line, cursor)
    local args = line:sub(1, cursor):match('^%s*%S+%s+(.*)$') or ''
    if args:find('%s') then
        return vim.fn.getcompletion(lead, 'file')
    end
    if not cargo_commands then
        cargo_commands = {}
        if vim.fn.executable('cargo') == 1 then
            local result = vim.system({ 'cargo', '--list' }, { text = true }):wait(2000)
            if result.code == 0 then
                for output in result.stdout:gmatch('[^\n]+') do
                    local command = output:match('^%s+([%w_-]+)')
                    if command then
                        table.insert(cargo_commands, command)
                    end
                end
            end
        end
    end
    return vim.tbl_filter(function(command)
        return vim.startswith(command, lead)
    end, cargo_commands)
end

vim.api.nvim_create_user_command('Cargo', function(args)
    vim.cmd('!cargo ' .. args.args)
end, { nargs = '*', complete = complete_cargo, desc = 'Run Cargo in the current working directory' })
