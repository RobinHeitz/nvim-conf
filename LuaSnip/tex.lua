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
local rep = require("luasnip.extras").replocal

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

	s(
		{ trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command." },
		fmta("\\textit{<>}", {
			d(1, get_visual),
		})
	),

	-- Combining text and insert nodes to create basic LaTeX commands
	s({ trig = "tt", dscr = "Expands 'tt' into '\texttt{}'" }, fmta("\\texttt{<>}", { i(1) })),

	s({ trig = "ff", dscr = "Expands 'ff' into '\frac{}{}'" }, fmta("\\frac{<>}{<>}", { i(1), i(2) })),

	s(
		{ trig = "eq", dscr = "A LaTeX equation environment" },
		fmta( -- The snippet code actually looks like the equation environment it produces.
			[[
            \begin{equation}
                <>
            \end{equation}
          ]],
			{ i(1) }
		)
	),

	s(
		{ trig = "env", dscr = "A LaTeX environment" },
		fmta( -- The snippet code actually looks like the equation environment it produces.
			[[
            \begin{<>}
                <>
            \end{<>}
          ]],
			-- { i(1), i(2), rep(1) }
			{ i(1), i(2), i(3) }
		)
	),
}
