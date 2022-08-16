-- Use <Space> as leader and remove mapping from it
vim.g.mapleader = ' '
vim.keymap.set('n', '<SPACE>', '<Nop>', { noremap = true })

-- Default variables
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false

vim.opt.expandtab = true
vim.opt.smartindent = true

-- Color scheme setup
require('ayu').setup({
    mirage = true,
    overrides = function()
        if vim.o.background == 'dark' then
            return { NormalNC = { bg = '#0f151e', fg = '#808080' } }
        else
            return { NormalNC = { bg = '#f0f0f0', fg = '#808080' } }
        end
    end,
})
require('ayu').colorscheme()

-- Lualine color scheme
require('lualine').setup({
    options = { theme = 'ayu' },
})

-- Copy to system clipboard
vim.opt.clipboard = 'unnamedplus'
