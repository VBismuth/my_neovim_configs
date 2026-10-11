require("oil").setup()
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "frappe",
        dark = "macchiato",
    },
})
require'nvim-web-devicons'.setup {
 -- your personal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  v = {
    icon = "",
    color = "#5d87bf",
    cterm_color = "32",
    name = 'vlang'
  }
 }
}
require('lualine').setup {
--    options = {
--        icons_enabled = true,
--        theme = 'auto',
--        component_separators = { left = '', right = ''},
--        section_separators = { left = '', right = ''},
--        disabled_filetypes = {
--            statusline = {},
--            winbar = {},
--        },
--        ignore_focus = {},
--        always_divide_middle = true,
--        always_show_tabline = true,
--        globalstatus = false,
--        refresh = {
--            statusline = 100,
--            tabline = 100,
--            winbar = 100,
--        }
--    },
--
---- Lualine has sections as shown below.
---- +-------------------------------------------------+
---- | A | B | C                             X | Y | Z |
---- +-------------------------------------------------+
--    sections = {
--        lualine_a = {'mode'},
--        lualine_b = {'branch', 'diff', 'diagnostics'},
--        lualine_c = {'filename'},
--        lualine_x = {'encoding', 'fileformat', 'filetype'},
--        lualine_y = {'progress'},
--        lualine_z = {'location'}
--    },
--        inactive_sections = {
--        lualine_a = {},
--        lualine_b = {},
--        lualine_c = {'filename'},
--        lualine_x = {'location'},
--        lualine_y = {},
--        lualine_z = {}
--    },
--        tabline = {},
--        winbar = {},
--        inactive_winbar = {},
--        extensions = {}
}

require 'mini.completion'.setup()
require 'mini.snippets'.setup()
require 'mini.icons'.setup()
MiniIcons.tweak_lsp_kind()
