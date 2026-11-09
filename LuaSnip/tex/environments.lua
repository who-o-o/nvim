local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep
local line_begin = require('luasnip.extras.expand_conditions').line_begin

local in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
local not_in_mathzone = function()
  return not in_mathzone()
end

return {
  s(
    { trig = 'beg', snippetType = 'autosnippet', condition = line_begin },
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
      <>
    ]],
      { i(1), i(2), rep(1), i(0) }
    )
  ),

  s(
    { trig = '@eq', snippetType = 'autosnippet', condition = line_begin },
    fmta(
      [[
      \begin{equation*}
          <>
      \end{equation*}
      <>
    ]],
      { i(1), i(0) }
    )
  ),

  s(
    { trig = '@al', snippetType = 'autosnippet', condition = line_begin },
    fmta(
      [[
      \begin{align*}
          <>
      \end{align*}
      <>
    ]],
      { i(1), i(0) }
    )
  ),

  s(
    { trig = '@pm', snippetType = 'autosnippet', condition = in_mathzone },
    fmta(
      [[
      \begin{pmatrix}
          <>
      \end{pmatrix}
      <>
    ]],
      { i(1), i(0) }
    )
  ),

  s(
    { trig = '@vm', snippetType = 'autosnippet', condition = in_mathzone },
    fmta(
      [[
      \begin{vmatrix}
          <>
      \end{vmatrix}
      <>
    ]],
      { i(1), i(0) }
    )
  ),

  -- backslash versions win over the plain ones
  s({ trig = '`', snippetType = 'autosnippet', priority = 2000 }, fmta('\\(<>\\)<>', { i(1), i(0) })),
}
