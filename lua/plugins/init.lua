vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
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
    use({
        'glepnir/lspsaga.nvim',
        branch = 'main',
        config = function()
            require('lspsaga').init_lsp_saga()
        end,
    })
    use('Shatur/neovim-ayu')
    use('kyazdani42/nvim-web-devicons')
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    })
    use('windwp/nvim-ts-autotag')
    use('andymass/vim-matchup')
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                highlight = {
                    enable = true,
                },
                autotag = {
                    enable = true,
                },
                matchup = {
                    enable = true,
                },
            })
        end,
    })
    use({
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
    })
    use({ 'nvim-telescope/telescope-file-browser.nvim' })
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
            require('luasnip').setup({
                update_events = 'TextChanged,TextChangedI',
                region_check_events = 'CursorHold,InsertLeave',
            })

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
            require('bufferline').setup({
                options = {
                    diagnostics = 'nvim_lsp',
                    diagnostics_indicator = function(count, level)
                        local icon = level:match('error') and ' ' or ' '
                        return ' ' .. icon .. count
                    end,
                    separator_style = 'thin',
                    show_buffer_close_icons = false,
                    show_close_icon = false,

                    offsets = {
                        {
                            filetype = 'NvimTree',
                            highlight = 'Directory',
                            separator = true,
                        },
                    },
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
        'pocco81/auto-save.nvim',
        config = function()
            require('auto-save').setup({
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
                    require('null-ls').builtins.formatting.markdownlint,

                    require('null-ls').builtins.diagnostics.markdownlint,
                },
            })
        end,
        requires = { 'nvim-lua/plenary.nvim' },
    })
    use({
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    })
    use({
        'petertriho/nvim-scrollbar',
        config = function()
            require('scrollbar').setup()
        end,
    })
    use({
        'goolord/alpha-nvim',
        config = function()
            local dashboard = require('alpha.themes.dashboard')
            dashboard.section.header.val = {
                '                                                     ',
                '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
                '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
                '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
                '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
                '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
                '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
                '                                                     ',
            }

            dashboard.section.buttons.val = {
                dashboard.button('e', '  > New file', ':ene<CR>'),
                dashboard.button('SPC f f', '  > Find file', ':Telescope find_files<CR>'),
                dashboard.button('SPC f o', '  > Recent', ':Telescope oldfiles<CR>'),
                dashboard.button('SPC f g', '  > Find Word', ':Telescope live_grep<CR>'),
                dashboard.button('s', '  > Open neovim config', ':e $MYVIMRC | :cd %:p:h <CR>'),
                dashboard.button('u', '  > Update plugins', ':PackerSync<CR>'),
                dashboard.button('q', 'ﴘ  > Quit neovim', ':q!<CR>'),
            }
            require('alpha').setup(dashboard.opts)
        end,
    })
    use('ggandor/lightspeed.nvim')
    use({
        'RRethy/vim-illuminate',
        config = function()
            require('illuminate').configure({
                providers = {
                    'lsp',
                    'treesitter',
                    'regex',
                },
                delay = 100,
                filetypes_denylist = {
                    'packer',
                    'alpha',
                    'NvimTree',
                },
                under_cursor = false,
            })
        end,
    })
    use({
        'kylechui/nvim-surround',
        config = function()
            require('nvim-surround').setup()
        end,
    })
    use({
        'akinsho/toggleterm.nvim',
        tag = 'v2.*',
        config = function()
            require('toggleterm').setup()
        end,
    })
    use('lervag/vimtex')
end)

-- load plugin configs
require('plugins.configs')

return startup
