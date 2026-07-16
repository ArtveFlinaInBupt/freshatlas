#import "@preview/rubby:0.10.2": get-ruby
#import "@preview/meander:0.4.3"

#import "model.typ": *

#import table.cell as tcell

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

// Copied from 大邮数学集, with modifications.
#let fancy(colors, body) = {
  let get-gradient(mapper) = gradient.linear(angle: 5deg, ..colors.map(mapper))

  let margin = .75em
  block(
    outset: (x: margin),
    inset: (y: margin),
    radius: (bottom-left: 0pt, top-right: 0pt, rest: .5em),
    fill: get-gradient(it => it.lighten(90%)),
    text(fill: get-gradient(it => it.darken(35%)), body),
  )
}

#let ruby(..args) = box(align(
  center,
  get-ruby(dy: -spacing.line-leading * .4, ..args.named())(..args.pos()),
))


#let backlink(url, body) = {
  show: box.with(
    outset: (bottom: .15em),
    stroke: (bottom: (paint: colors.link, thickness: .5pt)),
  )

  link(url, {
    body
    sym.space.thin
    text(font: font.mono, weight: "light")[↗️]
  })
}
