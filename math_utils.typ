#let important_rect = rect.with(inset: 8pt, radius: 4pt, stroke: 1pt, width: 90%)
#let strong_and_emph(contents) = strong(emph(contents))
#let color_box(color, title, contents) = {
  set align(center)
  important_rect(
    fill: color,
    {
      set align(left)
      box(strong_and_emph(title)) + box(contents)
    },
  )
}

#let light_red = red.lighten(50%)

#color_box(light_red, [Axiom], box(block(fill: white, inset: 8pt, radius: 4pt, lorem(30))))