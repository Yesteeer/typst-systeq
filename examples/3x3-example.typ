#import "../lib.typ": *

$ 
#render-systeq(
  annot-color: red.darken(20%),
  annot-size: 10pt,
  row-gutter: 2.9em,
  align: left + horizon,
  systeq($2x + 3y - z = 24$, $4x - 2y + 3z = 6$, $6x - y + 2z = 22$, annot: ($dot 2$,)),
  systeq($4x - 2y + 3z = 6$, $4x + 6y - 2z = 48$, $6x - y + 2z = 22$, $10x + 5y "" "" = 70$, mode: "add"),
  systeq($4x - 2y + 3z = 6$, $4x + 6y - 2z = 48$, $10x + 5y "" "" = 70$, annot: ($dot 2$, $dot 3$)),
  systeq($10x + 5y "" "" = 70$, $12x + 18y - 6z = 144$, $8x - 4y + 6z = 12$, $20x + 14y "" "" = 168$, mode: "add"),
  systeq($8x - 4y + 6z = 12$, $10x + 5y "" "" = 70$, $20x + 14y "" "" = 168$, annot: ("", $dot 2$)),
  systeq($8x - 4y + 6z = 12$, $20x + 10y "" "" = 140$, $20x + 14y "" "" = 168$, $"" - 4y "" "" = 28$, mode: "sub"),
  systeq($8x - 4y + 6z = 12$, $20x + 10y "" "" = 140$, $"" - 4y "" "" = 28$, 
    annot: ($div 2#h(1.5em)$, $div 10#h(1em)$, $div (-4)$)
  ),
  systeq($4x - 2y + 3z = 6$, $2x + y "" "" = 14$, $"" "" y "" "" = 4$, annot: ($y -> 4$, $y -> 4$)),
  systeq($4x - 8 + 3z = 6$, $2x + 4 "" "" = 14$, $"" "" y "" "" = 4$, 
    annot: ($+ thin 8 #h(3.5em)$,$-4 "and" div 2$)
  ),
  systeq($4x "" "" + 3z = 14$, $x "" "" "" "" = 5$, $"" "" y "" "" = 4$, annot: ($x -> 5$,)),
  systeq($3z = -6$, $x = 5$, $y = 4$),
  systeq($z = -2$, $x = 5$, $y = 4$),
) 
$