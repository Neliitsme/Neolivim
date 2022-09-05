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
vim.opt.autoindent = true

-- Copy to system clipboard
vim.opt.clipboard = 'unnamedplus'

vim.opt.termguicolors = true

vim.opt.fillchars = { eob = ' ' }
vim.opt.mouse = 'a'

vim.opt.swapfile = false
