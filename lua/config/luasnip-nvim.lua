local ls = require('luasnip')
ls.config.setup({
    enable_autosnippets = true,
})
require("luasnip.loaders.from_lua").lazy_load({paths="~/.config/nvim/lua/snippets"})
