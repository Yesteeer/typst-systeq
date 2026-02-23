#import "../lib.typ":  *

#set page(height: auto, margin: 1cm)

#render-systeq(
  annot-color: blue.darken(10%),
  annot-size: .9em,
  annot-spacing: (left: 2em, right: 0em),
  annot-bar: (dash: "dashed"),
  systeq($5x - 4y = 8$, $2x + 5y = 1$, annot: ($dot (-2)$, $dot 5$)),
  systeq($-10x + 8y = -16$, $10x + 25y = 5$),
  systeq($2x + 5y = 1$, $"" "" 33y = -11$, annot: ("",$div 33$), annot-bar: purple),
  systeq($2x + 5y = 1$, $"" "" y = -1/3$),
)
