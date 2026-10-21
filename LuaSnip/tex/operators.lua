local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta
local in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
  s({ trig = 'ff', snippetType = 'autosnippet', condition = in_mathzone }, fmta('\\frac{<>}{<>}', { i(1), i(2) })),
  s({ trig = '@2', snippetType = 'autosnippet', condition = in_mathzone }, fmta('\\sqrt{<>}', { i(1) })),
  s({ trig = '@n2', snippetType = 'autosnippet', condition = in_mathzone }, fmta('\\sqrt[<>]{<>}', { i(1), i(2) })),
  s({ trig = 'bin', snippetType = 'autosnippet', condition = in_mathzone }, fmta('\\binom{<>}{<>}', { i(1), i(2) })),
  s({ trig = '_', snippetType = 'autosnippet', condition = in_mathzone }, fmta('_{<>}', { i(1) })),
  s({ trig = '^', snippetType = 'autosnippet', condition = in_mathzone }, fmta('^{<>}', { i(1) })),

  s({ trig = 'sum', snippetType = 'autosnippet', condition = in_mathzone }, fmta('\\sum_{<>}^{<>}', { i(1), i(2) })),
  s({ trig = 'prod', snippetType = 'autosnippet', condition = in_mathzone }, fmta('\\prod_{<>}^{<>}', { i(1), i(2) })),
  s({ trig = 'lim', snippetType = 'autosnippet', condition = in_mathzone }, fmta('\\lim_{<> \\to <>}', { i(1), i(2) })),
  s({ trig = 'der', snippetType = 'autosnippet', condition = in_mathzone }, fmta('\\frac{d <>}{d <>} ', { i(1), i(2) })),
  s({ trig = 'nder', snippetType = 'autosnippet', condition = in_mathzone }, fmta('\\frac{d^<>}{d<>^<>} ', { i(1), i(2), i(3) })),
  s({ trig = 'Or', snippetType = 'autosnippet', condition = in_mathzone }, fmta('\\bigcup_{<>}^{<>}', { i(1), i(2) })),
  s({ trig = 'And', snippetType = 'autosnippet', condition = in_mathzone }, fmta('\\bigcap_{<>}^{<>}', { i(1), i(2) })),

  s({ trig = 'int', snippetType = 'autosnippet', condition = in_mathzone }, fmta('\\int_{<>}^{<>}', { i(1), i(2) })),
  s({ trig = 'iint', snippetType = 'autosnippet', condition = in_mathzone }, { t '\\iint_{(S)}' }),
  s({ trig = 'iiint', snippetType = 'autosnippet', condition = in_mathzone }, { t '\\iiint_{(V)}' }),
  s({ trig = 'oiint', snippetType = 'autosnippet', condition = in_mathzone }, { t '\\varoiint_{(S)}' }),
  s({ trig = 'oiiint', snippetType = 'autosnippet', condition = in_mathzone }, { t '\\oiiint_{(V)}' }),

  s({ trig = 'floor', snippetType = 'autosnippet', condition = in_mathzone }, fmta([[\left\lfloor <> \right\rfloor ]], { i(1) })),
  s({ trig = 'ceil', snippetType = 'autosnippet', condition = in_mathzone }, fmta([[\left\lceil <> \right\rceil ]], { i(1) })),
  s({ trig = 'angle', snippetType = 'autosnippet', condition = in_mathzone }, fmta([[\langle <> \rangle ]], { i(1) })),
  s({ trig = 'vv', snippetType = 'autosnippet', condition = in_mathzone }, fmta('\\vec{<>}', { i(1) })),
  s({ trig = 'ov', snippetType = 'autosnippet', condition = in_mathzone }, fmta('\\overline{<>}', { i(1) })),
  s({ trig = 'uv', snippetType = 'autosnippet', condition = in_mathzone }, fmta('\\underline{<>}', { i(1) })),
}
