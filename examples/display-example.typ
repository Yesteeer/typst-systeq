#import "../lib.typ": *

#render-systeq(
  display: true, // default
  systeq($x + 1 = y$, $(x + 1) / 3 - y / 6 = 1$),
  systeq($x + 1 = y$, $(x + 1) / 3 - (x+1) / 6 = 1$, display: false)
) \
#render-systeq(
  display: false,
  systeq($x + 1 = y$, $(x + 1) / 3 - y / 6 = 1$),
  systeq($x + 1 = y$, $(x + 1) / 3 - (x+1) / 6 = 1$)
)