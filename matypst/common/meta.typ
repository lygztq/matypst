#let auto_page_heading(title: none) = {
  locate(
    loc => {
      let elems = query(
        selector(heading).before(loc),
        loc,
      )
      let academy = smallcaps[
        #title
      ]
      if elems == () {
        align(right, academy)
      } else {
        let body = elems.last().body
        academy + h(1fr) + emph(body)
      }
    }
  )
}
