vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local use = require('packer').use
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {
        "williamboman/nvim-lsp-installer",
        {
            "neovim/nvim-lspconfig",
            config = function()
                require("nvim-lsp-installer").setup {}
                local lspconfig = require("lspconfig")
            end
        }
    }
    use 'ayu-theme/ayu-vim'
    use 'kyazdani42/nvim-web-devicons'
    use {
         'nvim-lualine/lualine.nvim',
         requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use { 
	'nvim-treesitter/nvim-treesitter', 
	run = ':TSUpdate' 
    }
    use { 
	'SmiteshP/nvim-gps',
	disable = true
    }
    use {
	'nvim-telescope/telescope.nvim',
	requires = 'nvim-lua/plenary.nvim' 
    }
    use 'plasticboy/vim-markdown'
    use {
	'windwp/nvim-autopairs',
	config = function()
	    require('nvim-autopairs').setup{}
	end
    }
    use {
	'lukas-reineke/indent-blankline.nvim',
	config = function()
	    require("indent_blankline").setup {
                show_current_context = true,
                show_current_context_start = true,
            }
	end
    }
    use 'sbdchd/neoformat'
    use({ 
	"iamcco/markdown-preview.nvim",
	run = "cd app && yarn install",
	setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
	ft = { "markdown" },
    })
    use {
	'lewis6991/gitsigns.nvim',
	config = function()
	    require('gitsigns').setup()
	end
    }
end)
