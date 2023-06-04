#import "matypst/matypst.typ": math_note_template, axiom, theorem

#show : doc => math_note_template(doc, title: "An example math note")

#lorem(100)

#axiom(title: "The 0-th axiom")[
  #lorem(20)
]

#lorem(20)

= Section One

#lorem(80)

#axiom(title: "The first axiom")[
  #lorem(20)
]

#lorem(80)

#theorem(title: "The first theorem")[
  #lorem(40)
  $ Q = rho A v + C $
  #lorem(20)
]

#lorem(20)
