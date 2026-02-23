#import "../lib.typ": *

#set page(height: auto, margin: 1cm)

#render-systeq(
  sys-align: left,
  systeq($5x - 4y = 8$, $2x + 5y = 1$),
  systeq($-10x + 8y = -16$, $10x + 25y = 5$),
  systeq($2x + 5y = 1$, $"" "" 33y = -11$),
  systeq($2x + 5y = 1$, $"" "" y = -1/3$),
)
