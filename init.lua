require('options')
require('keymaps')
require('plugins')
require('config.nvim-web-devicons')
require('colorscheme')
require('lsp')

function MySetup()
    vim.cmd("split new | setlocal nonumber | setlocal winfixheight | call termopen(&shell)")
    vim.cmd("resize -8")
    vim.cmd("NvimTreeOpen | setlocal nonumber | setlocal winfixwidth")
    vim.cmd("vertical resize -6")
end

vim.api.nvim_create_user_command('MySetup', MySetup, {})
