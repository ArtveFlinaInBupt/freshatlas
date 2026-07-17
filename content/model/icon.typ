#let subway-icon = box(move(dy: .05em, image("/asset/beijing-subway.svg", height: .85em))) // 不考虑标注京港 / 京投公司，防止给读者额外理解负担
#let cr-icon = box(move(dy: .05em, image("/asset/china-railways.svg", height: .85em)))
#let cah-icon = box(move(dy: .05em, image("/asset/capital-airport-holding.svg", height: .88em)))

#let icon-spacing = h(.15em, weak: true)

#let cr(body) = icon-spacing + cr-icon + icon-spacing + body
#let cah(body) = icon-spacing + cah-icon + icon-spacing + body
#let subway(body) = icon-spacing + subway-icon + icon-spacing + body
