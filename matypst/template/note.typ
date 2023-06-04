#import "../common/meta.typ": auto_page_heading
#let math_note_template(doc, title: none) = {
  set page(
    paper: "a4",
    header: align(right)[#auto_page_heading(title: title)],
    numbering: "1",
  )

  align(center)[#text(24pt, weight: "bold", title)]
  set text(14pt)
  set par(justify: true)
  set heading(numbering: "1.")
  [#doc]
}
