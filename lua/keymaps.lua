local function map_n(key, action, args)
    vim.keymap.set('n', key, action, args)
end
local function map_i(key, action, args)
    vim.keymap.set('i', key, action, args)
end
local function map_v(key, action, args)
    vim.keymap.set('v', key, action, args)
end

-- define common options
local opts = {
    noremap = true,
    silent = true,
}

-----------------
-- Normal mode --
-----------------

-- Open oil file browser
map_n('-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- Better window navigation
map_n('<C-h>', '<C-w>h', opts)
map_n('<C-j>', '<C-w>j', opts)
map_n('<C-k>', '<C-w>k', opts)
map_n('<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
map_n('<C-Up>', ':resize -2<CR>', opts)
map_n('<C-Down>', ':resize +2<CR>', opts)
map_n('<C-Left>', ':vertical resize -2<CR>', opts)
map_n('<C-Right>', ':vertical resize +2<CR>', opts)

-- Back to the previous file
map_n('<BS>', ':edit #<CR>', opts)

-- LSP related keymaps
map_n('<space>e', vim.diagnostic.open_float, opts)
map_n('[d', function() vim.diagnostic.jump({ count = -1, float = true}) end, opts)
map_n(']d', function() vim.diagnostic.jump({ count = 1, float = true}) end, opts)
map_n('<space>q', vim.diagnostic.setloclist, opts)

-----------------
-- Insert mode --
-----------------

-- Better movement
map_i('<C-k>', '<Up>', opts)
map_i('<C-j>', '<Down>', opts)
map_i('<C-h>', '<Left>', opts)
map_i('<C-l>', '<Right>', opts)

-- Keyboard layout switch
map_i('<C-s>', '<C-^>', opts)

-- Autocomplete using tab
map_i('<TAB>', '<C-n>', opts)
map_i('<S-TAB>', '<C-p>', opts)

-----------------
-- Visual mode --
-----------------

map_v('<', '<gv', opts)
map_v('>', '>gv', opts)
