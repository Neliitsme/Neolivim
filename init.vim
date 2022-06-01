" Use <Space> as leader and remove mapping from it
let mapleader=" "
nnoremap <SPACE> <Nop>
" Default variables
set shiftwidth=4
set number relativenumber
set nohlsearch

" Color theme setup
set termguicolors
let ayucolor="mirage"
colorscheme ayu

" Packer and plugins
lua << END
require('plugins')
require('lualine').setup {
    options = { theme = 'ayu_mirage' }
}
require('telescope').setup {
    defaults = {}
}
END

" After-packer plugin setup
"" Keymappings
""" Telesctope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

""" CoC
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
