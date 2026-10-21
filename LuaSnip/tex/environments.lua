local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep
local in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
local line_begin = require('luasnip.extras.expand_conditions').line_begin

return {

  s(
    { trig = 'be', snippetType = 'autosnippet', condition = line_begin },
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1),
      }
    )
  ),

  s(
    { trig = '@eq', snippetType = 'autosnippet', condition = line_begin },
    fmta(
      [[
       \begin{equation*}
           <>
       \end{equation*}
     ]],
      { i(1) }
    )
  ),
  s(
    { trig = '@al', snippetType = 'autosnippet', condition = line_begin },
    fmta(
      [[
       \begin{align*}
           <>
       \end{align*}
     ]],
      { i(1) }
    )
  ),

  s(
    { trig = '@pm', snippetType = 'autosnippet', condition = in_mathzone },
    fmta(
      [[
       \begin{pmatrix}
           <>
       \end{pmatrix }
     ]],
      { i(1) }
    )
  ),
  s(
    { trig = '@vm', snippetType = 'autosnippet', condition = in_mathzone },
    fmta(
      [[
       \begin{vmatrix}
           <>
       \end{vmatrix}
     ]],
      { i(1) }
    )
  ),
}
