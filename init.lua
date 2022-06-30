-- Use <Space> as leader and remove mapping from it
vim.cmd([[
    let mapleader=" "
    nnoremap <SPACE> <Nop>
]])

-- Default variables
vim.cmd([[
    set shiftwidth=4
    set number relativenumber
    set nohlsearch
]])

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

-- Packer and plugins
require('plugins')
require('lualine').setup {
    options = { theme = 'ayu_mirage' }
}
require('telescope').setup {
    defaults = {}
}

-- After-packer plugin setup
--- Keymappings
---- Telesctope
vim.cmd([[
    nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
    nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
    nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
    nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
]])
