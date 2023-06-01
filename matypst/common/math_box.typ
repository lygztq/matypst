#import "color.typ": kMathColors

#let important_rect = rect.with(inset: 8pt, radius: 4pt, stroke: 1pt, width: 90%)

#let strong_and_emph(contents) = strong(emph(contents))

#let color_box(color, title, contents) = {
  set align(center)
  important_rect(
    fill: color,
    {
      set align(left)
      box(title) + [\ ] + box(contents)
    },
  )
}

#let math_box(color, title, contents) = {
  set align(center)
  color_box(color, title, block(fill: white, inset: 8pt, radius: 4pt, width: 100%, contents))
}

#let axiom(contents, title: none) = {
  math_box(kMathColors.red, [#strong_and_emph("Axiom") (#title)], contents)
}

#let theorem_counter = counter("theoerm")

#let theorem(contents, title: none) = {
  locate(
    loc => {
      theorem_counter.step()
      let heading_cnt = ""
      if counter(heading).at(loc).at(0) != 0 {
        heading_cnt += counter(heading).display() + "."
      }
      math_box(kMathColors.blue, [#strong_and_emph("Theorem " + heading_cnt + theorem_counter.display()) (#title)], contents)
    }
  )
}