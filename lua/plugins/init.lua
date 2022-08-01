vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local use = require('packer').use
local startup = require('packer').startup(function()
    use('wbthomason/packer.nvim')
    use({
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
    })
    use({
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup()
        end,
    })
    use('neovim/nvim-lspconfig')
    use('ayu-theme/ayu-vim')
    use('kyazdani42/nvim-web-devicons')
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    })
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                highlight = {
                    enable = true,
                },
            })
        end,
    })
    use({
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
    })
    use('preservim/vim-markdown')
    use({
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({})
        end,
    })
    use({
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('indent_blankline').setup({
                indentLine_enabled = 1,
                show_current_context = true,
                show_current_context_start = true,
            })
        end,
    })
    use({
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        setup = function()
            vim.g.mkdp_filetypes = { 'markdown' }
        end,
        ft = { 'markdown' },
    })
    use({
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then
                            return ']c'
                        end
                        vim.schedule(function()
                            gs.next_hunk()
                        end)
                        return '<Ignore>'
                    end, { expr = true })

                    map('n', '[c', function()
                        if vim.wo.diff then
                            return '[c'
                        end
                        vim.schedule(function()
                            gs.prev_hunk()
                        end)
                        return '<Ignore>'
                    end, { expr = true })

                    -- Actions
                    map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
                    map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
                    map('n', '<leader>hS', gs.stage_buffer)
                    map('n', '<leader>hu', gs.undo_stage_hunk)
                    map('n', '<leader>hR', gs.reset_buffer)
                    map('n', '<leader>hp', gs.preview_hunk)
                    map('n', '<leader>hb', function()
                        gs.blame_line({ full = true })
                    end)
                    map('n', '<leader>tb', gs.toggle_current_line_blame)
                    map('n', '<leader>hd', gs.diffthis)
                    map('n', '<leader>hD', function()
                        gs.diffthis('~')
                    end)
                    map('n', '<leader>td', gs.toggle_deleted)

                    -- Text object
                    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end,
            })
        end,
    })
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-cmdline')
    use('hrsh7th/nvim-cmp')
    use('onsails/lspkind.nvim')
    use('rafamadriz/friendly-snippets')
    use({
        'L3MON4D3/LuaSnip',
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
        end,
    })
    use('saadparwaiz1/cmp_luasnip')
    use({
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    })
    use({
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('trouble').setup()
        end,
    })
    use({
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('todo-comments').setup()
        end,
    })
    use({
        'akinsho/bufferline.nvim',
        tag = 'v2.*',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            vim.opt.termguicolors = true
            require('bufferline').setup({
                options = {
                    diagnostics = 'nvim_lsp',
                    diagnostics_indicator = function(count, level, diagnostics_dict, context)
                        local icon = level:match('error') and ' ' or ' '
                        return ' ' .. icon .. count
                    end,
                },
            })
        end,
    })
    use({
        'folke/which-key.nvim',
        config = function()
            require('which-key').setup({})
        end,
    })
    use({
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        tag = 'nightly',
        config = function()
            require('nvim-tree').setup({
                view = {
                    adaptive_size = true,
                },
            })
        end,
    })
    use({
        'Pocco81/AutoSave.nvim',
        config = function()
            require('autosave').setup({
                enabled = true,
            })
        end,
    })
    use({
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('null-ls').setup({
                sources = {
                    require('null-ls').builtins.formatting.deno_fmt,
                    require('null-ls').builtins.formatting.prettier,
                    require('null-ls').builtins.formatting.stylua,
                    require('null-ls').builtins.formatting.autopep8,
                },
            })
        end,
        requires = { 'nvim-lua/plenary.nvim' },
    })
    use({
        'nvim-neorg/neorg',
        config = function()
            require('neorg').setup({
                load = {
                    ['core.defaults'] = {},
                    ['core.norg.concealer'] = {},
                },
            })
        end,
        requires = 'nvim-lua/plenary.nvim',
    })
end)

-- load plugin configs
require('plugins.configs')

return startup
