#import table.cell as tcell
#import "model.typ": stroke

#let disclaimer = [不对任何信息提供正确性保证。编者并非全能神，信息从普遍共识、校内公开数据与师生口中整合得到，可能有错误。]

#let github-logo = box(baseline: .1em, image(width: 1em, "/asset/github-mark.svg"))

#let num = num => $#num$
#let unit = unit => $upright(#unit)$
#let qty = (num, unit) => $#num thin upright(#unit)$

#let subtable(..args) = tcell(
  inset: 0pt,
  table(
    align: left + horizon,
    stroke: (x, y) => if x != 0 { (left: stroke) } + if y != 0 { (top: stroke) },
    ..args
  ),
)

#let proper = {
  let thickness = .25em
  let paint = luma(85%)

  underline.with(
    offset: -thickness / 2 + .125em,
    background: true,
    evade: false,
    stroke: (thickness: thickness, paint: paint),
  )
}

#let footnote-numbered(n) = super(numbering("*", n))
#let fn = footnote-numbered
