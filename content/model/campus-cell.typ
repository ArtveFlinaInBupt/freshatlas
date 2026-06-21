#import "/template/util.typ": *
#import "@preview/fancy-tiling:1.0.0": diagonal-stripes

#let specified-cell(color, body, ..args) = tcell(
  fill: color.background,
  ..args.named(),
  text(fill: color.foreground)[#body],
)

#let 沙河-colour = (background: teal.lighten(85%), foreground: teal.darken(25%))
#let 海南-colour = (background: green.lighten(85%), foreground: green.darken(25%))
#let 本部-colour = (background: red.lighten(85%), foreground: red.darken(25%))
#let invalid-colour = (background: white, foreground: white)

#let 沙河-styled = text.with(fill: 沙河-colour.foreground)
#let 海南-styled = text.with(fill: 海南-colour.foreground)
#let 本部-styled = text.with(fill: 本部-colour.foreground)

#let 沙河-cell(body: [沙], ..args) = specified-cell(沙河-colour, body, ..args)
#let 海南-cell(body: [海南], ..args) = specified-cell(海南-colour, body, ..args)
#let 本部-cell(body: [本], ..args) = specified-cell(本部-colour, body, ..args)
#let undetermined-cell(body: []) = tcell(
  fill: diagonal-stripes(thickness-ratio: 50%, stripe-color: gray),
  box(fill: white, outset: .25em, radius: .25em, text(fill: gray, body)),
)
#let invalid-cell(body: [], ..args) = specified-cell(invalid-colour, body, ..args)
