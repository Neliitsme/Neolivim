-- Telesctope
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { noremap = true })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { noremap = true })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { noremap = true })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { noremap = true })
vim.keymap.set('n', '<leader>fk', require('telescope.builtin').keymaps, { noremap = true })
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles, { noremap = true })

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
vim.api.nvim_set_keymap('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>xw', '<cmd>Trouble workspace_diagnostics<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>xd', '<cmd>Trouble document_diagnostics<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>xl', '<cmd>Trouble loclist<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>xq', '<cmd>Trouble quickfix<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', 'gR', '<cmd>Trouble lsp_references<cr>', { silent = true, noremap = true })

-- bufferline
vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- NvimTree
vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { noremap = true })
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', { noremap = true })

-- Todo-comments
vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<CR>', { noremap = true })

-- Toggleterm

vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm direction=float<CR>', { noremap = true })
vim.keymap.set('t', '<C-t>', '<C-\\><C-n><CMD>ToggleTerm<CR>', { noremap = true })

vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, { noremap = true, silent = true })
