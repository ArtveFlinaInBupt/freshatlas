#import "@preview/fancy-tiling:1.0.0": diagonal-stripes

#import "/template/util.typ": *

#import "color.typ": invalid-color, 本部-color, 沙河-color, 海南-color

#let specified-cell(color, body, ..args) = tcell(
  fill: color.background,
  ..args.named(),
  text(fill: color.foreground)[#body],
)

#let 沙河-styled = text.with(fill: 沙河-color.foreground)
#let 海南-styled = text.with(fill: 海南-color.foreground)
#let 本部-styled = text.with(fill: 本部-color.foreground)

#let 沙河-cell(body: [沙], ..args) = specified-cell(沙河-color, body, ..args)
#let 海南-cell(body: [海南], ..args) = specified-cell(海南-color, body, ..args)
#let 本部-cell(body: [本], ..args) = specified-cell(本部-color, body, ..args)
#let undetermined-cell(body: []) = tcell(
  fill: diagonal-stripes(thickness-ratio: 50%, stripe-color: gray),
  box(fill: white, outset: .25em, radius: .25em, text(fill: gray, body)),
)
#let invalid-cell(body: [], ..args) = specified-cell(invalid-color, body, ..args)
