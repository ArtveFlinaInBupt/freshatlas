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

#let spacing = (
  line-leading-tight: .25em,
  line-leading: .5em,
  par-spacing: .5em,
  indent: (all: true, amount: 2em),
)

#let colors = (link: blue)

#let stroke = (paint: luma(50%), thickness: .75pt)
