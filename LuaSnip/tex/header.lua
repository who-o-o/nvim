local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node

return {
  s({ trig = '\\init', snippetType = 'autosnippet' }, {
    t [[\documentclass{article}
          \usepackage{geometry}
          \usepackage{concmath}
          \usepackage[OT1]{fontenc}
          \usepackage{graphicx}
          \usepackage{amsfonts}
          \usepackage{amsmath,mathtools}
          \usepackage{calrsfs}
          \usepackage{color}
          \usepackage[dvipsnames]{xcolor}
          \usepackage[many]{tcolorbox}
          \usepackage{setspace}
          \usepackage{tkz-tab}    
          \usepackage{amssymb}          
          \usepackage{multicol}  
          \usepackage{esint}
          \geometry{margin=0.5in}
          \definecolor{green}{RGB}{52, 235, 168}
          \definecolor{violet}{RGB}{165, 83, 237}
          \definecolor{lemon}{RGB}{170, 237, 83}
          \definecolor{red}{RGB}{240, 125, 84}
          \definecolor{blue}{RGB}{105, 255, 242}
        ]],
  }),
}
