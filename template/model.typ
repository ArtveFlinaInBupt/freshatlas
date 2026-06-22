#let font = {
  let en = ((name: "STIX Two Text", covers: "latin-in-cjk"),)
  (
    en: en,
    serif: en + ("Source Han Serif SC",),
    sans: ("Source Han Sans SC",),
    mono: ((name: "Fira Code", covers: "latin-in-cjk"),),
    math: ("STIX Two Math",),
    axis-height: .258em,
  )
}

#let colors = (link: blue)

#let stroke = (paint: luma(50%), thickness: .75pt)

#let backlink(url, body) = {
  show: box.with(
    outset: (bottom: .25em),
    stroke: (bottom: (paint: colors.link, thickness: .5pt)),
  )

  link(url, {
    body
    sym.space.thin
    text(font: font.mono, weight: "light")[↗️]
  })
}
