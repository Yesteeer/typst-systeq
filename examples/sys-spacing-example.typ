#import "../lib.typ": *

#render-systeq(
  sys-col-gap: .8em,
  sys-row-gap: .8em,
  systeq($5x - 4y = 8$, $2x + 5y = 1$),
  systeq($-10x + 8y = -16$, $10x + 25y = 5$),
  systeq($2x + 5y = 1$, $"" "" 33y = -11$),
  systeq($2x + 5y = 1$, $"" "" y = -1/3$),
)