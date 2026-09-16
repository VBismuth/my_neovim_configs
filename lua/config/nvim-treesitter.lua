local treesitter = require('nvim-treesitter')
local config = {
    auto_install = true,
    fold = false,
    ensure_installed = { 'python', 'lua', 'vim'}
}

local is_in = function(t, val)
    for _, v in ipairs(t) do
        if val == v then return true end
    end
    return false
end

-- ensure_installed
for _, v in ipairs(config.ensure_installed) do
    if not is_in(treesitter.get_installed(), v) then
        treesitter.install(v)
    end
end

-- autorun
vim.api.nvim_create_autocmd('FileType', {
    pattern = treesitter.get_available(),
    callback = function()
        local ft = vim.bo.filetype

        -- install missing
        if config.auto_install and not is_in(treesitter.get_installed(), ft) and
            is_in(treesitter.get_available(), ft) then
            treesitter.install(ft)
        end
        -- syntax highlighting, provided by Neovim
        if is_in(treesitter.get_installed(), ft) then
            vim.treesitter.start()
        end
        -- folds, provided by Neovim
        if config.fold then
            vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            vim.wo.foldmethod = 'expr'
        end
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

--- OLD
-- require('nvim-treesitter.configs').setup({
--     -- A list of parser names, or "all" (the listed parsers MUST always be installed)
--     ensure_installed = { 'python', 'lua', },
--     -- Install parsers synchronously (only applied to `ensure_installed`)
--     sync_install = false,
-- 
--     -- Automatically install missing parsers when entering buffer
--     -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
--     auto_install = true,
-- 
--     -- List of parsers to ignore installing (or "all")
--     ignore_install = { "javascript" },
-- 
--     -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
--     install_dir = vim.fn.stdpath('data') .. '/site',
-- 
--     ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
--     -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
-- 
--     highlight = {
--       enable = true,
-- 
--       -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
--       -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
--       -- the name of the parser)
--       -- list of language that will be disabled
--       -- disable = { "c", "rust" },
--       -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
--       disable = function(lang, buf)
--           local max_filesize = 100 * 1024 -- 100 KB
--           local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
--           if ok and stats and stats.size > max_filesize then
--               return true
--           end
--       end,
-- 
--       -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--       -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--       -- Using this option may slow down your editor, and you may see some duplicate highlights.
--       -- Instead of true it can also be a list of languages
--       additional_vim_regex_highlighting = false,
--     },
-- })
