-- Snippets for golang

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

-- This is the `get_visual` function I've been talking about.
-- ----------------------------------------------------------------------------
-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
local get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end
-- ----------------------------------------------------------------------------

return {

  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  s({ trig = "hi" }, { t("Hello, world!") }),
  s({ trig = "foo" }, { t("Another snippet!") }),
  s({ trig = "lines" }, { t("Line 1", "line 2", "Line 3") }),

  s(
    { trig = "ee", desc = "if for err != nil" },
    fmta(
      [[
      if err != nil {
          log.Println(err.Error())
          <>
      }
      ]],
      { i(1) }
    )
  ),
}
