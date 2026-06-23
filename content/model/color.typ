#let BUPT-VI-color = (
  /// 真正的 PANTONE 661 C 是 cmyk(100%, 64%, 0%, 42%) 或 rgb #003594
  /// 官方 VI 给出的是 cmyk(100%, 60%, 0%, 0%) 或 rgb #1b45a2
  /// 官方 VI 的文字给出的和深入人心的是 #003399
  tint: color.spot("PANTONE 661 C", rgb("#003399")),
  China: (
    tint: rgb("#C82910"),
    light: rgb("#FFDE00"),
  ),
  post: (
    tint: rgb("#006548"),
    light: rgb("#B8D637"),
  ),
  information: (
    tint: rgb("#2C5090"),
    light: rgb("#59BCE0"),
  ),
)

#let 沙河-color = (background: teal.lighten(85%), foreground: teal.darken(25%))
#let 海南-color = (background: green.lighten(85%), foreground: green.darken(25%))
#let 本部-color = (background: red.lighten(85%), foreground: red.darken(25%))
#let invalid-color = (background: white, foreground: white)

#let unknown-color = yellow.darken(25%)
#let wip-color = gray
#let secondary-color = luma(75%)

#let male-color = eastern.darken(15%)
#let female-color = fuchsia.darken(15%)
#let mixed-color = color.mix(male-color, female-color)

#let good-color = green.darken(25%)
#let bad-color = red.darken(25%)
#let neutral-color = blue

#let placement-color = olive.darken(25%)
#let level-color = orange.darken(25%)
