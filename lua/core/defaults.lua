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

-- Color theme setup
vim.cmd([[
    set termguicolors
    let ayucolor="mirage"
    colorscheme ayu
]])

-- Copy to system clipboard
vim.cmd([[
    set clipboard=unnamedplus
]])
