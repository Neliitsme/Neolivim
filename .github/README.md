# Neolivim

![A picture showing the look of the config](/.github/media/terminal-screenshot.png)

My custom config for [neovim](https://github.com/neovim/neovim), inspired by [NvChad](https://github.com/NvChad/NvChad).

At this moment it's relatively barebones, but already has some useful plugins installed like [Telescope](https://github.com/nvim-telescope/telescope.nvim), [nvim-cmp](https://github.com/hrsh7th/nvim-cmp), [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer), [LuaSnip](https://github.com/L3MON4D3/LuaSnip) (with [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)) and some others. (Check out [plugins.lua file](/lua/plugins/plugins.lua) to see more)

## What is the goal of this project?

Nothing major, just storing my config for myself and for anyone brave enough to try it out as well. The file structure should provide to be relatively simple to understand, so feel free to use this config and hack it as you see fit.

I will be updating this repo as I add new plugins and configs, I'm still learning so it'll be happening pretty often.

If there'll be any noticeable activity around this repo, I might create a "stable" and "dev" branches, but that's probably in the future.

## Prerequisites
- [neovim](https://github.com/neovim/neovim) (the newer the better i suppose)
- You should really check each other plugin's prerequisites, I'm not gonna update mine for the time being 

## Installation
- Clone this repository into your nvim folder
- Use `:PackerSync`
