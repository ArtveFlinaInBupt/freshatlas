#import "util.typ": disclaimer, github-logo
#import "model.typ": *

#let show-watermark(enable: true, body) = {
  let watermark-text = [预览]
  set page(foreground: if enable {
    rotate(-30deg, rect(width: 200%, height: 200%, fill: tiling(
      size: (120pt, 80pt),
      place(dy: 10pt, text(font: font.serif, size: 1.5em, fill: luma(216), watermark-text)),
    )))
  })

  body
}

// Copied from 大邮数学集, with modifications.
#let styled-outline(body) = {
  import outline.entry

  set outline(indent: 1.5em)
  set entry(fill: none)
  show entry.where(level: 1): set entry(fill: line(length: 100%, stroke: (
    thickness: .5pt,
    paint: luma(216),
  )))
  show entry: it => {
    let get-indent(level) = h(if type(outline.indent) == relative {
      level * outline.indent
    } else {
      panic("Unsupported outline indent type (such as `auto`).")
    })
    let body-transform(level, body) = text(fill: black, body)
    let page-transform(level, body) = text(fill: black, body)

    let indent = get-indent(it.level - 1)
    let body = {
      body-transform(it.level - 1, it.body())
      box(width: 1fr, pad(x: .25em, it.fill))
    }
    let page = page-transform(it.level - 1, it.page())

    link(it.element.location(), grid(
      columns: (auto, 1fr, auto),
      align: (auto, auto, bottom),
      indent, body, text(number-width: "tabular", page),
    ))
  }

  body
}


#let show-body(..args, body) = {
  let config = args.named()
  let text-size = config.at("size", default: 10pt)
  let spinoff = config.at("spinoff", default: false)
  let tint = config.at("tint", default: black)

  set document(author: ("fa_555 <fa_555@foxmail.com>",), date: datetime.today())

  set text(size: text-size, lang: "zh", region: "cn", font: font.serif, fallback: false)
  set par(leading: .5em, spacing: .75em, justify: true)

  show heading: set block(below: .75em)
  show heading: align.with(center)
  show heading.where(level: 1): it => {
    {
      set text(size: text-size, weight: "regular")
      show: place
      show: align.with(horizon)
      let phi = (1 + calc.sqrt(5)) / 2
      stack(
        dir: ltr,
        spacing: .5em / phi,
        box(fill: tint, height: 1em, width: 1em / phi),
        counter(page).display(),
      )
    }
    it
    text(size: text-size, weight: "regular", disclaimer)
  }

  set grid.hline(stroke: stroke)
  set grid.vline(stroke: stroke)

  set table.hline(stroke: stroke)
  set table.vline(stroke: stroke)
  set table(stroke: stroke, align: center + horizon)

  show math.equation: set text(font: font.math + font.serif, fallback: false)
  show math.equation.where(block: false): it => math.display(it)

  show raw: set text(font: font.mono + font.sans, fallback: false)

  set list(
    indent: 1em,
    marker: ([•], [◦], [⁃]).map(it => {
      box(width: 1em, align(center, it))
      h(-.5em)
    }),
    spacing: .75em,
  )

  show link: set text(fill: colors.link)

  set page(
    height: auto,
    width: auto,
    margin: 4em,
    footer: text(fill: gray, grid(
      columns: (auto, 1fr, auto),
      align: (x, y) => (left, center, right).at(x) + horizon,
      [最后更新：#datetime.today().display("[year] 年 [month] 月 [day] 日")],
      none,
      {
        [提供信息或贡献内容请到 ]
        (
          if not spinoff {
            link("https://github.com/ArtveFlinaInBupt/freshatlas")[
              #github-logo `ArtveFlinaInBupt/freshatlas`
            ]
          },
          link("mailto:fa_555@foxmail.com")[`fa_555`],
        )
          .filter(it => it != none)
          .join(", ", last: "或")
      },
    )),
  )

  show: show-watermark.with(enable: not "release" in sys.inputs and not spinoff)

  body
}
