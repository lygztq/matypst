#import "../common/meta.typ": auto_page_heading
#let math_note_template(doc, title: none) = {
  set page(
    paper: "a4",
    header: align(right)[#auto_page_heading(title: title)],
    numbering: "1",
  )

  align(center)[#text(17pt, title)]
  set text(font: "Inria Serif")
  [#doc]
}
