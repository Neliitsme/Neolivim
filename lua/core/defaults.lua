-- Use <Space> as leader and remove mapping from it
vim.cmd([[
    let mapleader=" "
    nnoremap <SPACE> <Nop>
]])

-- Default variables
vim.cmd([[
    set shiftwidth=2
    set number relativenumber
    set nohlsearch
]])

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
vim.cmd([[
    set clipboard=unnamedplus
]])
