require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    registries = {
            "github:mason-org/mason-registry",
            "github:Crashdummyy/mason-registry",
        },
})

require('mason-lspconfig').setup({
    -- A list of language servers to automatically install, if they aren't already
    ensure_installed = { 'pylsp', 'lua_ls'},
    automatic_enable = false,
})

-- Set different settings for different languages' LSP
-- LSP list: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- How to use setup({}): https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D
--     - the settings table is sent to the LSP
--     - on_attach: a lua callback function to run after LSP attaches to a given buffer
-- Updated from require('lspconfig') due to updates, see :help lsp-config
local lspconfig = vim.lsp.config

-- Customized on_attach function
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true}) end, opts)
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true}) end, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- _ is a client
local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', {buf = bufnr})

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

-- Configure each language
-- How to add LSP for a specific language?
-- 1. use `:Mason` to install corresponding LSP
-- 2. add configuration below
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
lspconfig("lua_ls", {
    filetypes = { 'lua' },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
        runtime = {
            -- Tell the language server which version of Lua to use
            version = "LuaJIT",
            path = vim.split(package.path, ";"),
        },
        diagnostics = {
            -- Get the language server to recognize "vim" global
            globals = {"vim"},
        },
        workspace = {
            -- Make the server aware of neovim runtimes and plugins
            library = { vim.env.VIMRUNTIME },
            checkThirdParty = false,
        },
        telemetry = { enable = false, },
        },
    },
})
vim.lsp.enable('lua_ls')

lspconfig("pylsp", {
	on_attach = on_attach,
    settings = {
        pylsp = {
        plugins = {
                -- formatter options
                black = { enabled = false },
                autopep8 = { enabled = true },
                yapf = { enabled = false },
                -- Linter options
                pylint = { enabled = true, executable = "pylint" },
                pyflakes = { enabled = false },
                flake8 = { enabled = false,
                           extendIgnore = "E203",
                           exclude = ".git,__pycache__,docs/source/conf.py,old,build,dist",
                           maxComplexity = 10 },
                pycodestyle = { enabled = true,
                                ignore = { "E221" } },
                -- Type ckecker
                pylsp_mypy = { enabled = true },
                -- Auto-completion options
                jedi_completion = { fuzzy = true },
                -- Import sorting
                pyls_isort = { enabled = true },
        },
        },
    },
    flags = {
        debounce_text_changes = 200,
    },
    capabilities = capabilities,
})
vim.lsp.enable('pylsp')

lspconfig("gdscript", {
    capabilities = capabilities,
    on_attach = on_attach,
})
vim.lsp.enable('gdscript')

local rust_analyzer = "/usr/lib/rustup/bin/rust-analyzer"
lspconfig("rust_analyzer", {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { rust_analyzer }
})
vim.lsp.enable('rust_analyzer')

-- vlang v-analyzer lsp
lspconfig("v_analyzer", {
    capabilities = capabilities,
    on_attach = on_attach,
})
vim.lsp.enable('v_analyzer')

-- roslyn c# lsp config for roslyn plugin
require('roslyn').setup({
    config = {
        capabilities = capabilities,
        on_attach = on_attach,
    },
})
