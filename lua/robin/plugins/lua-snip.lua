return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",

  config = function()
    -- LuaSnip (Plugin for snippets)
    -- Yes, we're just executing a bunch of Vimscript, but this is the officially
    -- endorsed method; see https://github.com/L3MON4D3/LuaSnip#keymaps
    vim.cmd([[

      " Use Tab to expand and jump through snippets
      imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
      smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

      " Use Shift-Tab to jump backwards through snippets
      imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
      smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'

      " Expand or jump in insert mode
      imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
      " Jump forward through tabstops in visual mode
      smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
      " Backward jump
      imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
      smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'

      " Cycle forward through choice nodes with Control-f (for example)
      imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
      smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'

      ]])

    -- Somewhere in your Neovim startup, e.g. init.lua
    require("luasnip").config.set_config({ -- Setting LuaSnip config
      -- Enable autotriggered snippets
      enable_autosnippets = true,

      -- needed for rep() in luasnps
      update_events = "TextChanged,TextChangedI",

      -- Use Tab (or some other key if you prefer) to trigger visual selection
      store_selection_keys = "<Tab>",
    })

    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip/" })
  end,
}
