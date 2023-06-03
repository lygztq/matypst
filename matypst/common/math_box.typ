#import "color.typ": kMathColors

#let important_rect = rect.with(inset: 0.75em, radius: 0.5em, stroke: 0.1em, width: 90%)

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

#let color_box_with_content_block(color, title, contents) = {
  set align(center)
  color_box(color, title, block(fill: white, inset: 0.75em, radius: 0.5em, width: 100%, contents))
}

#let box_inner_heading_state_name(title) = {
  title + "/heading_state"
}

#let make_box(color, box_type) = {
  let inner_heading_state = state(box_inner_heading_state_name(box_type), 0)
  let box_counter = counter(box_type)
  let box_fn(contents, title: none) = {
    locate(
      loc => {
        let cur_heading = counter(heading).at(loc).at(0)
        if inner_heading_state.at(loc) != cur_heading {
          box_counter.update(0)
          inner_heading_state.update(cur_heading)
        }

        box_counter.step()
        let heading_display = ""
        if cur_heading != 0 {
          heading_display += str(cur_heading) + "."
        }
        color_box_with_content_block(
          color,
          [#strong_and_emph(box_type + " " + heading_display + box_counter.display()) #title],
          contents
        )
      }
    )
  }
  box_fn
}

#let axiom = make_box(kMathColors.red, "Axiom")
#let theorem = make_box(kMathColors.blue, "Theorem")
#let definition = make_box(kMathColors.orange, "Definition")
#let lemma = make_box(kMathColors.teal, "Lemma")
#let example = make_box(kMathColors.gray, "Example")
#let proposition = make_box(kMathColors.yellow, "Proposition")
#let remark = make_box(kMathColors.pink, "Remark")
