local function gh(id)
    return 'https://github.com/' .. id
end

-- local function cb(id)
--     return 'https://codeberg.org/' .. id
-- end

local plugins = {
    -- File browser
    gh('stevearc/oil.nvim'),
    -- Color scheme
    { src = gh('catppuccin/nvim'), name = 'catppuccin' },
    -- Offical LSP configurations
    gh('neovim/nvim-lspconfig'),
    -- Language servers and etc manager
    gh('mason-org/mason.nvim'),

    -- Dev icons support
    gh('nvim-tree/nvim-web-devicons'),
    -- Status line
    gh('nvim-lualine/lualine.nvim'),

    -- Nvim-Mini plugins
    -- LSP stuff: icons, snippets and complitions
    gh('nvim-mini/mini.icons'),
    gh('nvim-mini/mini.completion'),
    gh('nvim-mini/mini.snippets'),

}

vim.pack.add(plugins)

-- Setting up plugins
require('plugin-setup')
