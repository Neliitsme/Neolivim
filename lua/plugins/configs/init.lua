-- nvim-cpm setup
vim.cmd([[
    set completeopt=menu,menuone,noselect
]])

local lspkind = require('lspkind')
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            elseif cmp.visible() then
                if not cmp.get_selected_entry() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                    cmp.confirm()
                else
                    cmp.confirm()
                end
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
        }),
    },
})
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    }),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    }),
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gtd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

-- setup LSPs
-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Automatically setup all installed server with default config
local lspconfig = require('lspconfig')
local mason_installed_servers = require('mason-lspconfig').get_installed_servers()

for _, server in ipairs(mason_installed_servers) do
    lspconfig[server].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
    })
end

-- custom LSP configs
lspconfig['sumneko_lua'].setup({
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})

-- add diagnostics signs to the gutter
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require('telescope').setup({
    defaults = {
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
            width = 0.75,
            preview_cutoff = 120,
            horizontal = {
                prompt_position = 'top',
                preview_width = function(_, cols, _)
                    if cols < 120 then
                        return math.floor(cols * 0.5)
                    end
                    return math.floor(cols * 0.6)
                end,
                mirror = false,
            },
            vertical = { mirror = false },
        },
    },
    pickers = {
        buffers = {
            mappings = {
                i = {
                    ['<C-d>'] = 'delete_buffer',
                },
            },
        },
    },
})

require('telescope').load_extension('file_browser')
-- LspSaga setup
vim.keymap.set('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', opts)

vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set('v', '<leader>ca', '<cmd><C-U>Lspsaga range_code_action<CR>', opts)

vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gs', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opts)

vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', { silent = true })
vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { silent = true })
vim.keymap.set('n', '<leader>cd', '<cmd>Lspsaga show_cursor_diagnostics<CR>', { silent = true })

-- Disable default markdown folding
vim.g.vim_markdown_folding_disabled = 1

-- VimTex setup
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_view_skim_activate = 1
vim.g.vimtex_quickfix_mode = 0

-- vim.cmd([[
--     let g:vimtex_compiler_method = 'latexmk'
--     let g:vimtex_view_method = 'skim'
--     let g:vimtex_view_skim_sync = 1
--     let g:vimtex_view_skim_activate = 1
-- ]])
