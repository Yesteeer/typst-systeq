#import "../lib.typ": *

#set page(height: auto, margin: 1cm)

$ 
#render-systeq(
  annot-color: red.darken(20%),
  annot-size: 10pt,
  row-gutter: 2.9em,
  align: left + horizon,
  systeq($2x + 3y - z = 24$, $4x - 2y + 3z = 6$, $6x - y + 2z = 22$, annot: ($+ thin 3 dot L_3$,$- 2 dot L_3$)),
  systeq($20x "" "" + 5z = 90$, $-8x "" "" - z = -38$, $6x - y + 2z = 22$, annot: ($div 5$,)),
  systeq($4x "" "" + z = 18$, $-8x "" "" - z = -38$, $6x - y + 2z = 22$, annot: ($+ thin L_2$,)),
  systeq($-4x "" "" "" ""  = -20$, $-8x "" "" - z = -38$, $6x - y + 2z = 22$, annot: ($div (-4)$,)),
  systeq($x "" "" "" ""  = 5$, $-8x "" "" - z = -38$, $6x - y + 2z = 22$, annot: ("",$x = 5$, $x = 5$)),
  systeq($x "" "" "" ""  = 5$, $-40 "" "" - z = -38$, $30 - y + 2z = 22$, annot: ("",$+ thin 38 - z$)),
  systeq($x "" "" "" ""  = 5$, $"" "" "" "" z = -2$, $30 - y + 2z = 22$, annot: ("","",$z = -2$)),
  systeq($x "" "" "" ""  = 5$, $"" "" "" "" z = -2$, $30 - y - 4 = 22$, annot: ("","",$ + thin y - 22$)),
  systeq($x = 5$, $z = -2$, $y = 4$),
  systeq($x = 5$, $z = -2$, $y = 4$),
) 
$
