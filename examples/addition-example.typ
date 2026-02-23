#import "../lib.typ": *

#render-systeq(
  align: top,
  systeq($5x - 4y = 8$, $2x + 5y = 1$, annot: ($dot (-2)$, $dot 5$)),
  systeq($-10x + 8y = -16$, $10x + 25y = 5$, $"" "" 33y = -11$, mode: "add", annot-color: blue)
)