-- Using lazy.nvim package manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- LSP manager
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    -- Vscode-like pictograms
    { "onsails/lspkind.nvim", event = { "VimEnter" } },
    -- Auto-copletion engine
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            'lspkind.nvim',
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
            "saadparwaiz1/cmp_luasnip", -- for luasnip users
        },
        config = function()
            require('config.nvim-cmp')
        end,
    },
    -- Code snippet engine
    {
        "L3MON4D3/LuaSnip", version = "v2.*",
        config = function ()
            require('config.luasnip-nvim')
        end,
    },
    -- Colorscheme
    { "catppuccin/nvim", name = 'catppuccin', priority = 1000 },
    -- Status bar in the bottom
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('config.lualine-nvim')
        end,
    },
    -- File search tool
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-tree/nvim-tree.lua',
        config = function ()
            require('config.nvim-tree')
        end,
    },

    -- Plugin to render markdown files in neovim
    {
        'OXY2DEV/markview.nvim',
        lazy = false
    },
    -- Plugin to follow markdows links with ENTER
    {
        'jghauser/follow-md-links.nvim',
    },

    -- Tree-sitter - a tool to highlight structures
    {
        'nvim-treesitter/nvim-treesitter',
        lazy=false,
        build=':TSUpdate',
        config = function()
            require('config.nvim-treesitter')
        end,
    },
    -- Roslyn LSP plugin (C# support)
    {
    "seblyng/roslyn.nvim",
    ft = "cs",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
        -- your configuration comes here; leave empty for default settings
        },
    },
})
