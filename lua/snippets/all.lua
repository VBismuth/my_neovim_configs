-- ls.snippets for all files
local ls = require('luasnip')
local t = ls.text_node
local i = ls.insert_node

return {
    ls.snippet({trig="'", snippetType='autosnippet'},
        {t("'"), i(1), t("'")}),
    ls.snippet({trig='"', snippetType='autosnippet'},
        {t('"'), i(1), t('"')}),
    ls.snippet({trig='[', snippetType='autosnippet', wordTrig=false},
        {t('['), i(1), t(']')}),
    ls.snippet({trig='(', snippetType='autosnippet', wordTrig=false},
        {t('('), i(1), t(')')}),
    ls.snippet({trig='_{', snippetType='autosnippet', wordTrig=true},
        {t({'{', '    '}), i(1), t({'', '}'})}),
}
