-- Snippets for vimtex

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

  -- Trigger greek chars
  s({ trig = ";a", snippetType = "autosnippet" }, { t("\\alpha") }),
  s({ trig = ";b", snippetType = "autosnippet" }, { t("\\beta") }),
  s({ trig = ";g", snippetType = "autosnippet" }, { t("\\gamma") }),
  s({ trig = ";G", snippetType = "autosnippet" }, { t("\\Gamma") }),
  s({ trig = ";phi", snippetType = "autosnippet" }, { t("\\phi") }),
  s({ trig = ";Phi", snippetType = "autosnippet" }, { t("\\Phi") }),

  s(
    { trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command." },
    fmta("\\textit{<>}", {
      d(1, get_visual),
    })
  ),

  -- Maths
  s({ trig = "mt" }, { t("\\times") }), -- This is the cross for R x N
  s({ trig = "mv", dscr = "Writing vector (bold)" }, fmta("\\mathbf{<>}", { i(1) })),
  s({ trig = "ms", dscr = "Writing Symbols like R or N" }, fmta("\\mathbb{<>}", { i(1) })),

  -- Units
  s({ trig = "ui", dscr = "unit itensity in w/meter^2" }, fmta("\\SI{<>}{\\watt\\per\\meter\\squared}", { i(1) })),
  s({ trig = "ud", dscr = "unit distance in meter" }, fmta("\\SI{<>}{\\meter}", { i(1) })),
  s({ trig = "uv", dscr = "unit velocity in meter/s" }, fmta("\\SI{<>}{\\meter\\per\\second}", { i(1) })),
  s(
    { trig = "ua", dscr = "unit acceleration in meter/sec^2" },
    fmta("\\SI{<>}{\\meter\\per\\second\\squared}", { i(1) })
  ),

  -- combining text and insert nodes to create basic latex commands
  s({ trig = "tt", dscr = "expands 'tt' into '\texttt{}'" }, fmta("\\texttt{<>}", { i(1) })),
  s({ trig = "bf", dscr = "expands 'tt' into '\textbf{}'" }, fmta("\\textbf{<>}", { i(1) })),

  s({ trig = "ff", dscr = "expands 'ff' into '\frac{}{}'" }, fmta("\\frac{<>}{<>}", { i(1), i(2) })),

  s(
    { trig = "eq", dscr = "a latex equation environment" },
    fmta( -- the snippet code actually looks like the equation environment it produces.
      [[
            \begin{equation}
                <>
            \end{equation}
          ]],
      { i(1) }
    )
  ),

  s(
    { trig = "env", dscr = "a latex environment", snippetType = "autosnippet" },
    fmta( -- the snippet code actually looks like the equation environment it produces.
      [[
            \begin{<>}
                <>
            \end{<>}
          ]],
      { i(1), i(2), rep(1) }
    )
  ),
}
