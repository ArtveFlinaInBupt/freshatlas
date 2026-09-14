#import "@preview/fontawesome:0.6.2" as fa

#import "color.typ": badge

#let subway-icon = box(move(dy: .05em, image("/asset/beijing-subway.svg", height: .85em))) // 不考虑标注京港 / 京投公司，防止给读者额外理解负担
#let cr-icon = box(move(dy: .05em, image("/asset/china-railways.svg", height: .85em)))
#let cah-icon = box(move(dy: .05em, image("/asset/capital-airport-holding.svg", height: .88em)))

#let icon-spacing = h(.15em, weak: true)

#let terminal(color, body) = box(
  outset: (bottom: .15em),
  stroke: (bottom: (paint: color, thickness: .1em)),
  body,
)

#let cr(body) = icon-spacing + cr-icon + icon-spacing + body
#let cah(body) = icon-spacing + cah-icon + icon-spacing + body
#let subway(body, terminal-color: none, exit: none) = {
  icon-spacing
  {
    show: if terminal-color != none {
      terminal.with(terminal-color)
    } else {
      box
    }
    subway-icon
    icon-spacing
    body
  }
  if exit != none [（#exit 出口）]
}

#let get-taxi() = badge(
  background: rgb(0, 128, 51),
  foreground: rgb(255, 199, 44),
)[#fa.fa-taxi(solid: true) 网约车]
