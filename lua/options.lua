--  Netrw disabling for nvim-tree plugin
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- System
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'
vim.opt.termguicolors = true  -- enable 24 bit colour

-- Keyboard layout
vim.opt.keymap = 'russian-jcuken'  -- раскладка йцукен 
vim.opt.iminsert = 0  -- first is english for insert
vim.opt.imsearch = 0  -- first is english for search


-- Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- UI
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = false
vim.opt.showmode = false
vim.opt.colorcolumn = "110"

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Diagnostic
vim.diagnostic.config({virtual_lines = true})
