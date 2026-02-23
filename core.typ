#import "func.typ": assert-annot-style, assert-mode, resolve-offset, resolve-bar, resolve-color, resolve-size, resolve-display

#let build-system-normal(
  equation,
  display: true,
  annot-spacing: (left: 1em, right: .2em), // TODO: add this to "add" and "sub" mode
  annot-color: red,
  annot-size: 11pt,
  annot-bar: (thickness: .8pt, dash: "solid"),
  ..args
) = {
  assert-annot-style(annot-spacing, annot-color, annot-size)
  let annot-spacing = resolve-offset(annot-spacing)
  let annot-color = resolve-color(annot-color, equation.annot-color)
  let annot-size = resolve-size(annot-size, equation.annot-size)
  let n = equation.entries.map(it => {
    it.len()
  }).reduce((acc, x) => calc.max(acc, x))
  let resolved-entries = equation.entries.enumerate().map(((i, it)) => {
    if equation.annot != none {
      if it.len() == n {
        it.last() += h(annot-spacing.at("left", default: 1em))
      }
      let j = it.len()
      while j < n {
        it.push("")
        j += 1
      }
      it.push(text(fill: annot-color, size: annot-size)[#h(annot-spacing.at("right", default: .2em))#equation.annot.at(i, default: "")])
    }
    it
  })
    (
      entries: if resolve-display(display, equation.display) {
        resolved-entries.map(col => col.map(row => {
      math.display(row)}))
    } else {
      resolved-entries
    },
      annot: equation.annot,
      annot-color: annot-color,
      annot-bar: resolve-bar(annot-bar, annot-color, equation.annot-bar),
    )
  }
}

#let render-system-normal(entries) = {
  $display(
    mat(
      delim: #("{", none),
      ..entries.entries,
      augment: #if entries.annot-bar != none and entries.annot != none {(vline: entries.entries.map(it => {
        it.len()
      }).reduce((acc, x) => calc.max(acc, x) - 1), stroke: entries.annot-bar)
      } else {none}
    )
  )$
}

#let build-system-sum(
  equation,
  display: true,
  annot-color: red,
  annot-size: 11pt,
  annot-bar: (thickness: .8pt, dash: "solid"),
  ..args
) = {
  assert-annot-style(1em, annot-color, annot-size)
  let annot-color = resolve-color(annot-color, equation.annot-color)
  let annot-size = resolve-size(annot-size, equation.annot-size)
  let parsed-entries = range(0, equation.entries.map(it => {
      it.len()
    }).reduce((acc, x) => calc.max(acc, x))
  )
  let resolved-entries = parsed-entries.map(it => math.display(math.vec(
    delim: if it == 0 {("{", none)} else {none},
    ..equation.entries.slice(0, equation.entries.len() - 1).map(row => {
      row.at(it, default: ())
    }).map(arr => {
      if type(arr) == array {
        arr.fold([], (acc, x) => acc + x)
      } else {
        arr.children.fold([], (acc, x) => acc + x)
      }
    })
  )))
  let resolved-result = equation.entries.last().map(arr => {
    if type(arr) == array {
        arr.fold([], (acc, x) => acc + text(fill: annot-color, size: annot-size)[#x])
      } else {
        arr.children.fold([], (acc, x) => acc + text(fill: annot-color, size: annot-size)[#x])
      }
  })
  (
    entries: resolved-entries, 
    result: resolved-result,
    annot: equation.annot,
    annot-color: annot-color,
    annot-size: annot-size,
    annot-bar: resolve-bar(annot-bar, annot-color, equation.annot-color)
  )
}

#let render-system-sum(entries, mode) = {
  let sign = ("",)*(entries.entries.at(0).child.children.len() - 1) + (text(fill: entries.annot-color, size: entries.annot-size)[
      #if mode == "add" [$+$] else [$-$]
    ],)
  $display(mat(
    delim: #none,
    row-gap: #1em,
    display(vec(
      delim: #none,
      ..sign
    )),
    ..entries.entries;
    ,..entries.result;
    augment: #if entries.annot-bar != none {(hline: 1, stroke: entries.annot-bar)} else {none}
  ))$
}

#let render-system(
  ..args,
  mode: "normal",
) = {
  if mode == "normal" {
    let resolved-entries = build-system-normal(
      ..args.pos(), 
      ..args.named()
    )
    render-system-normal(resolved-entries)
  }
  else {
    let resolved-entries = build-system-sum(
      ..args.pos(), 
      ..args.named()
    )
    render-system-sum(resolved-entries, mode)
  }
}

#let resolve-args(args, sep-symbol) = {
  let args-with-sep = args.pos().map(it => {
    render-system(
      it, 
      mode: it.mode,
      ..args.named())
  })
  if sep-symbol != "" {
    let args-with-sep = args-with-sep.intersperse(sep-symbol)
    if args-with-sep.len() > 1 {
      args-with-sep.insert(0, [])
    }
    return args-with-sep
  }
  return args-with-sep
}

#let systeq(
  annot: none,
  mode: "normal",
  annot-size: auto,
  annot-color: auto,
  annot-bar: auto,
  display: auto,
  ..args, 
) = {
  assert-mode(mode, annot)
  let entries = args.pos().map(it => {
    if it.has("body") {
      if it.body.has("children") {
        it.body.children.split([ ]).map(arr => {
          arr.fold([], (acc, x) => acc + x)
        })
      } else {} // TODO: manage futher cases
    }
    else {
      it.children.split([ ]).map(arr => {
        arr.fold([], (acc, x) => acc + x)
      })
    }
  })
  (
    entries: entries, 
    annot: annot, 
    mode: mode,
    annot-size: annot-size,
    annot-color: annot-color,
    annot-bar: annot-bar,
    display: display,
  )
}

#let render-systeq(
  columns: 4,
  row-gutter: 2em,
  column-gutter: 2em,
  align: horizon,
  sys-align: right,
  sys-col-gap: .4em,
  sys-row-gap: .4em,
  sep-symbol: $<==>$,
  ..args,
) = {
  set math.mat(align: sys-align, column-gap: sys-col-gap, row-gap: sys-row-gap)
  set math.vec(align: sys-align, gap: sys-row-gap) // TODO: manage col-gap !
  let resolved-args = resolve-args(args, sep-symbol)
  if resolved-args.len() == 1 {
    resolved-args.at(0)
  } else {
    grid(
    columns: columns,
    row-gutter: row-gutter,
    column-gutter: column-gutter,
    align: align,
    ..resolved-args
  )
  }
}