-- Telesctope
vim.cmd([[
    nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
    nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
    nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
    nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
]])

-- LuaSnip
vim.cmd([[
    " press <Tab> to expand or jump in a snippet. These can also be mapped separately
    " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
    " -1 for jumping backwards.
    inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

    snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
    snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

    " For changing choices in choiceNodes (not strictly necessary for a basic setup).
    imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
    smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]])

-- Trouble
vim.api.nvim_set_keymap('n', '<leader>xx', '<cmd>Trouble<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>xw', '<cmd>Trouble workspace_diagnostics<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>xd', '<cmd>Trouble document_diagnostics<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>xl', '<cmd>Trouble loclist<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>xq', '<cmd>Trouble quickfix<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', 'gR', '<cmd>Trouble lsp_references<cr>', { silent = true, noremap = true })

-- bufferline
vim.cmd([[
    " These commands will navigate through buffers in order regardless of which mode you are using
    " e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
    nnoremap <silent>]b :BufferLineCycleNext<CR>
    nnoremap <silent>[b :BufferLineCyclePrev<CR>

    " These commands will move the current buffer backwards or forwards in the bufferline
    nnoremap <silent><mymap> :BufferLineMoveNext<CR>
    nnoremap <silent><mymap> :BufferLineMovePrev<CR>

    " These commands will sort buffers by directory, language, or a custom criteria
    nnoremap <silent>be :BufferLineSortByExtension<CR>
    nnoremap <silent>bd :BufferLineSortByDirectory<CR>
    nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

    nnoremap <silent>bg :BufferLinePick<CR>
    nnoremap <silent>bc :BufferLinePickClose<CR>
]])

-- NvimTree
vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { noremap = true })
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', { noremap = true })
