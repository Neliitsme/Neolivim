require('ayu').setup({
    mirage = true,
})
require('ayu').colorscheme()

-- Lualine color scheme
require('lualine').setup({
    options = { theme = 'ayu' },
})
