return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	-- build = "make install_jsregexp"
    config = function()
        vim.cmd([[
        " Expand or jump in insert mode
        imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 

        " Jump forward through tabstops in visual mode
        smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

        " Jump backward through snippet tabstops with Shift-Tab (for example)
        imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
        smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'


        " TODO: look at this
        " Cycle forward through choice nodes with Control-f (for example)
        " imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
        " smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
        ]])

        local ls = require("luasnip")

        ls.config.set_config({
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
            update_events = "TextChanged,TextChangedI",
        })

        -- require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/user/LuaSnip" })
        -- vim.keymap.set('n', '<Leader>L',
        -- '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/user/LuaSnip/"})<CR>')

    end
}
