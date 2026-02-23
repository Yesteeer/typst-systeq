#let assert-mode(mode, annot) = {
  assert(
    type(mode) == str and mode in ("normal", "add", "sub"),
    message: "mode should be one of \"normal\", \"add\" or \"sub\""
  )
  assert(
    type(annot) == array or annot == none, 
    message: "annotations should be given as an array"
  )
  assert(
    type(annot) == array or annot == none, 
    message: "annotations should be given as an array"
  )
}

#let assert-annot-style(annot-offset, annot-color, annot-size) = {
  assert(
    type(annot-offset) == length or type(annot-offset) == dictionary,
    message: "annotation offset should be of type \"length\" or \"dictionary\""
  )
  assert(
    type(annot-color) == color or type(annot-color) == gradient or type(annot-color) == tiling or annot-color == auto,
    message: "annotation color should be of type \"color\" \"gradient\" or  \"tiling\""
  )
  assert(
    type(annot-size) == length or annot-size == auto,
    message: "annotation text size should be of type \"length\" "
  )
}


#let resolve-offset(annot-offset) = {
  if type(annot-offset) == dictionary {
    return (left: 1em, right: .2em) + annot-offset
  }
  else {
    return (left: annot-offset, right: annot-offset)
  }
}

#let resolve-bar(annot-bar, annot-color, sys-annot-bar) = {
  if type(annot-bar) == dictionary {
    let combined = (paint: annot-color, thickness: .8pt, dash: "solid") + annot-bar
    if sys-annot-bar != auto {
      if type(sys-annot-bar) == dictionary {
        return combined + sys-annot-bar
      } else {
        // override 
        return sys-annot-bar
      }
    }
    return combined
  }
  else{
    if sys-annot-bar != auto {
      return sys-annot-bar
    } else {
      return  annot-bar
    }
  }
}

#let resolve-size(annot-size, sys-annot-size) = {
  if sys-annot-size != auto {
    return sys-annot-size
  } else {
    annot-size
  }
}

#let resolve-color(annot-color, sys-annot-color) = {
  if sys-annot-color != auto {
    return sys-annot-color
  } else {
    annot-color
  }
}

#let resolve-display(display, sys-display) = {
  if sys-display != auto {
    return  sys-display
  } else {
    display
  }
}