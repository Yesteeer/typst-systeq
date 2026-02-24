#import "../lib.typ": *

#set page(numbering: "1")
#set par(justify: true)

#show raw.where(block: false): set raw(lang: "typc")
#show raw.where(block: true): it => rect(
  fill: luma(220),
  radius: 5pt,
  inset: (x: 5pt, y: 10pt),
  width: 100%,
  it
)

#show title: it => {
  align(center)[#it]
  v(1em)
}
#show heading.where(level: 1): it => {
  it 
  v(.5em)
}

#let output(it) = rect(
  radius: 5pt,
  inset: (x: 10pt, y: 15pt),
  width: 100%,
  it
)

#title("systeq - manual")

= Syntax

We can render a simple system (like `math.cases`) which is `inline` by default.
```typst
  This is a simple 2x2 linear system: 
  #render-systeq(systeq($5x - 4y = 8$, $2x + 5y = 1$))
```
#output[
  This is a simple 2x2 linear system: 
  #render-systeq(systeq($5x - 4y = 8$, $2x + 5y = 1$))
]

Simply put it between \$ ... \$ to make it into a `block`:
```typst
  This is a simple 2x2 linear system: 
  $ #render-systeq(systeq($5x - 4y = 8$, $2x + 5y = 1$)) $
```
#output[
  This is a simple 2x2 linear system: 
  $ #render-systeq(systeq($5x - 4y = 8$, $2x + 5y = 1$)) $  
]

The function `sys` represents a system, which needs to be rendered via `render-sys`. Multiple systems can be rendered at once and will be rendered in a `grid` with default symbol `sep-symbol: $<==>$` and default column number `columns: 4` (counting separators).

```typst
  #render-systeq(
      systeq($5x - 4y = 8$, $2x + 5y = 1$),
      systeq($-10x + 8y = -16$, $10x + 25y = 5$),
      systeq($2x + 5y = 1$, $"" "" 33y = -11$),
      systeq($2x + 5y = 1$, $"" "" y = -1/3$),
  )
```
#output(
  render-systeq(
    systeq($5x - 4y = 8$, $2x + 5y = 1$),
    systeq($-10x + 8y = -16$, $10x + 25y = 5$),
    systeq($2x + 5y = 1$, $"" "" 33y = -11$),
    systeq($2x + 5y = 1$, $"" "" y = -1/3$),
  )
)

Usual alignment operator `&` cannot be used in `sys`. You should use spaces to create the alignment points instead and empty strings `""` to get empty placeholders.

#pagebreak()

= Alignments

Alignments can be customized at different levels. First we can change the alignment inside the grid (default: `align: horizon`).
```typst
  #render-systeq(
    align: center + horizon,
    systeq($5x - 4y = 8$, $2x + 5y = 1$),
    systeq($-10x + 8y = -16$, $10x + 25y = 5$),
    systeq($2x + 5y = 1$, $"" "" 33y = -11$),
    systeq($2x + 5y = 1$, $"" "" y = -1/3$),
  )
```
#output(
  render-systeq(
    align: center + horizon,
    systeq($5x - 4y = 8$, $2x + 5y = 1$),
    systeq($-10x + 8y = -16$, $10x + 25y = 5$),
    systeq($2x + 5y = 1$, $"" "" 33y = -11$),
    systeq($2x + 5y = 1$, $"" "" y = -1/3$),
  )
)

You can also change the alignment inside the systems (default: `align: right`).
```typst
  #render-systeq(
    sys-align: left,
    systeq($5x - 4y = 8$, $2x + 5y = 1$),
    systeq($-10x + 8y = -16$, $10x + 25y = 5$),
    systeq($2x + 5y = 1$, $"" "" 33y = -11$),
    systeq($2x + 5y = 1$, $"" "" y = -1/3$),
  )
```
#output(
  render-systeq(
    sys-align: left,
    systeq($5x - 4y = 8$, $2x + 5y = 1$),
    systeq($-10x + 8y = -16$, $10x + 25y = 5$),
    systeq($2x + 5y = 1$, $"" "" 33y = -11$),
    systeq($2x + 5y = 1$, $"" "" y = -1/3$),
  )
)

#pagebreak()

= Spacing

You can customize the grid gutters with defaults `column-gutter: 2em` and `row-gutter: 2em`.
```typst
  #render-systeq(
    column-gutter: 4em,
    systeq($5x - 4y = 8$, $2x + 5y = 1$),
    systeq($-10x + 8y = -16$, $10x + 25y = 5$),
    systeq($2x + 5y = 1$, $"" "" 33y = -11$),
    systeq($2x + 5y = 1$, $"" "" y = -1/3$),
  )
```
#output(
  render-systeq(
    column-gutter: 4em,
    systeq($5x - 4y = 8$, $2x + 5y = 1$),
    systeq($-10x + 8y = -16$, $10x + 25y = 5$),
    systeq($2x + 5y = 1$, $"" "" 33y = -11$),
    systeq($2x + 5y = 1$, $"" "" y = -1/3$),
  )
)

You can customize the spacing inside the system with defaults `sys-col-gap: .4em` and `sys-row-gap: .4em`.
```typst
  #render-systeq(
    sys-col-gap: 1em,
    systeq($5x - 4y = 8$, $2x + 5y = 1$),
    systeq($-10x + 8y = -16$, $10x + 25y = 5$),
    systeq($2x + 5y = 1$, $"" "" 33y = -11$),
    systeq($2x + 5y = 1$, $"" "" y = -1/3$),
  )
```
#output(
  render-systeq(
    sys-col-gap: .8em,
    sys-row-gap: .8em,
    systeq($5x - 4y = 8$, $2x + 5y = 1$),
    systeq($-10x + 8y = -16$, $10x + 25y = 5$),
    systeq($2x + 5y = 1$, $"" "" 33y = -11$),
    systeq($2x + 5y = 1$, $"" "" y = -1/3$),
  )
)

#pagebreak()

= Annotations

You can annotate each equation of a system using the `annot` parameter of `sys`.
```typst
  #render-systeq(
    systeq($5x - 4y = 8$, $2x + 5y = 1$, annot: ($dot (-2)$, $dot 5$)),
    systeq($-10x + 8y = -16$, $10x + 25y = 5$),
    systeq($2x + 5y = 1$, $"" "" 33y = -11$, annot: ("",$div 33$)),
    systeq($2x + 5y = 1$, $"" "" y = -1/3$),
  )
```
#output(
  render-systeq(
    systeq($5x - 4y = 8$, $2x + 5y = 1$, annot: ($dot (-2)$, $dot 5$)),
    systeq($-10x + 8y = -16$, $10x + 25y = 5$),
    systeq($2x + 5y = 1$, $"" "" 33y = -11$, annot: ("",$div 33$)),
    systeq($2x + 5y = 1$, $"" "" y = -1/3$),
  )
)

The annotation color, size, offset and bar stroke can be changed with following defaults `annot-color: red`, `annot-size: 1em`, `annot-spacing: (left: 1em, right: .2em)` and `annot-bar: (paint: annot-color, thickness: .8pt, dash: "solid")`. The latter accepts any stroke as argument and the `annot-bar` is removed when set to `none`. Each of these parameters can be passed to `render-sys` to be applied to every underlying system and can individually be overridden by passing them to `sys`.
```typst
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
```
#output(
  render-systeq(
    annot-color: blue.darken(10%),
    annot-size: .9em,
    annot-spacing: (left: 2em, right: 0em),
    annot-bar: (dash: "dashed"),
    systeq($5x - 4y = 8$, $2x + 5y = 1$, annot: ($dot (-2)$, $dot 5$)),
    systeq($-10x + 8y = -16$, $10x + 25y = 5$),
    systeq($2x + 5y = 1$, $"" "" 33y = -11$, annot: ("",$div 33$), annot-bar: purple),
    systeq($2x + 5y = 1$, $"" "" y = -1/3$),
  )
)

#pagebreak()

= Addition and substractions modes

One last feature of the _systeq_ package is to display addition or substraction operations between equations of one system. This can be used by changing the systems `mode` with default `mode: "normal"` to `mode: "add"` or `mode: "sub"`. This uses the last `sys` entry as result of the addition / substraction and adds a $+$ or $-$ sign on the bottom left. In this case, it is not possible to annotate the system and the `annot-bar` style is applied to the horizontal bar. The result and sign colors and size are inherited from `annot-color` and `annot-size`.
```typst
  #render-systeq(
    align: top,
    systeq($5x - 4y = 8$, $2x + 5y = 1$, annot: ($dot (-2)$, $dot 5$)),
    systeq($-10x + 8y = -16$, $10x + 25y = 5$, $"" "" 33y = -11$, mode: "add", annot-color: blue)
  )
```
#output(
  render-systeq(
    align: top,
    systeq($5x - 4y = 8$, $2x + 5y = 1$, annot: ($dot (-2)$, $dot 5$)),
    systeq($-10x + 8y = -16$, $10x + 25y = 5$, $"" "" 33y = -11$, mode: "add", annot-color: blue)
  )
)

= Display

In `"normal"` mode, you can choose whether your math content is sized with display or not. This makes sense for example when fraction arise in your equations. For `"add"` and `"sub"` mode there is no display option. The default for normal mode is `display: true`. This parameter can be passed to `render-sys` or `sys`, the latter overriding the former.
```typst
  #render-systeq(
    display: true, // default
    systeq($"" "" y = x + 1$, $(x + 1) / 3 - y / 6 = 1$),
    systeq($"" "" y = x + 1$, $(x + 1) / 3 - (x+1) / 6 = 1$, display: false)
  ) \
  #render-systeq(
    display: false,
    systeq($"" "" y = x + 1$, $(x + 1) / 3 - y / 6 = 1$),
    systeq($"" "" y = x + 1$, $(x + 1) / 3 - (x+1) / 6 = 1$)
  )
```
#output(
  [
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
  ]
)


#pagebreak()

= Further examples

== ignore system alignment

```typst
  #render-systeq(
    sys-align: left,
    systeq($5x-4y=8$, $2x=1$),
    systeq($10x+8y=-16$, $x=1/2$),
  )
```
#output[
  #render-systeq(
    sys-align: left,
    systeq($5x-4y=8$, $2x=1$),
    systeq($10x+8y=-16$, $x=1/2$),
  )
]

== change number of system per line

```typst
  #render-systeq(
    sys-align: left,
    columns: 8,
    column-gutter: 1.5em,
    systeq($5x-4y=8$, $2x=4$),
    systeq($10x+italic(8dot 2)=-16$, $x=2$),
    systeq($10x=0$, $x=2$),
    systeq($x=0$, $x=2$),
  )
```
#output[
  #render-systeq(
    sys-align: left,
    columns: 8,
    column-gutter: 1.5em,
    systeq($5x-4y=8$, $2x=4$),
    systeq($10x+italic(8dot 2)=-16$, $x=2$),
    systeq($10x=0$, $x=2$),
    systeq($x=0$, $x=2$),
  )
]

== change separator

```typst
  #render-systeq(
    sys-align: left,
    columns: 6,
    sep-symbol: $==>$,
    systeq($5x-4y=8$, $sqrt(y-5)=4$),
    systeq($5x-4y=8$, $y-5=4$),
    systeq($5x-4y=8$, $y=9$),
  )
```
#output[
  #render-systeq(
    sys-align: left,
    columns: 6,
    sep-symbol: $==>$,
    systeq($5x-4y=8$, $sqrt(y-5)=4$),
    systeq($5x-4y=8$, $y-5=4$),
    systeq($5x-4y=8$, $y=9$),
  )
]

#pagebreak()

== 3x3 system

#set text(size: .9em)
```typst
  $ #render-systeq(
    annot-color: red.darken(20%),
    annot-size: 10pt,
    row-gutter: 2.9em,
    align: left + horizon,
    systeq($2x + 3y - z = 24$, $4x - 2y + 3z = 6$, $6x - y + 2z = 22$, 
      annot: ($+ thin 3 dot L_3$,$- 2 dot L_3$)
    ),
    systeq($20x "" "" + 5z = 90$, $-8x "" "" - z = -38$, $6x - y + 2z = 22$, 
      annot: ($div 5$,)
    ),
    systeq($4x "" "" + z = 18$, $-8x "" "" - z = -38$, $6x - y + 2z = 22$, 
      annot: ($+ thin L_2$,)
    ),
    systeq($-4x "" "" "" ""  = -20$, $-8x "" "" - z = -38$, $6x - y + 2z = 22$, 
      annot: ($div (-4)$,)
    ),
    systeq($x "" "" "" ""  = 5$, $-8x "" "" - z = -38$, $6x - y + 2z = 22$, 
      annot: ("",$x = 5$, $x = 5$)
    ),
    systeq($x "" "" "" ""  = 5$, $-40 "" "" - z = -38$, $30 - y + 2z = 22$, 
      annot: ("",$+ thin 38 - z$)
    ),
    systeq($x "" "" "" ""  = 5$, $"" "" "" "" z = -2$, $30 - y + 2z = 22$, 
      annot: ("","",$z = -2$)
    ),
    systeq($x "" "" "" ""  = 5$, $"" "" "" "" z = -2$, $30 - y - 4 = 22$, 
      annot: ("","",$ + thin y - 22$)
    ),
    systeq($x = 5$, $z = -2$, $y = 4$),
  ) $
```
#output(
  $ #render-systeq(
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
  ) $
)
