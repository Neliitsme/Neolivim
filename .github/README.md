# Neolivim

![A picture showing the look of the config](/.github/media/terminal-screenshot.png)

My custom config for [neovim](https://github.com/neovim/neovim), inspired by
[NvChad](https://github.com/NvChad/NvChad).

At this moment it's relatively barebones, but already has some useful plugins
installed like [Telescope](https://github.com/nvim-telescope/telescope.nvim),
[nvim-cmp](https://github.com/hrsh7th/nvim-cmp),
[mason](https://github.com/williamboman/mason.nvim),
[LuaSnip](https://github.com/L3MON4D3/LuaSnip) (with
[friendly-snippets](https://github.com/rafamadriz/friendly-snippets)) and some
others. (Check out [plugins' init.lua file](/lua/plugins/init.lua) to see more)

## What is the goal of this project?

Nothing major, just storing the config for myself and for anyone brave enough to
try it out as well. The file structure should provide to be relatively simple to
understand, so feel free to use this config and hack it as you see fit.

Aside from that, I would say that this repo is my way of recognizing my
procrastinating self and trying to battle it by doing something, that, in a way,
keeps my skills in check and could be somewhat useful.

## Prerequisites

- [neovim](https://github.com/neovim/neovim) (the newer the better i suppose)
- You should really check each other plugin's prerequisites, I'm not gonna
  update mine for the time being

## Installation

- Clone this repository into your nvim folder
- Use `:PackerSync`
