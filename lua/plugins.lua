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
    use {
	'nvim-neorg/neorg',
	config = function()
	    require('neorg').setup {
		load = {
		    ['core.defaults'] = {},
		    ['core.norg.dirman'] = {
			config = {}
		    },
		    ['core.norg.concealer'] = {},
		}
	    }
	end,
	requires = 'nvim-lua/plenary.nvim',
	disable = true
    }
    use 'plasticboy/vim-markdown'
    use {
	'neoclide/coc.nvim',
	branch = 'release',
	disable = true
    }
    use {
	'windwp/nvim-autopairs',
	config = function()
	    require('nvim-autopairs').setup{}
	end
    }
end)
