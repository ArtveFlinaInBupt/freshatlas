#import "util.typ": github-logo
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

#let show-body(..args, body) = {
  let config = args.named()
  let spinoff = config.at("spinoff", default: false)

  set document(author: ("fa_555 <fa_555@foxmail.com>",), date: datetime.today())

  set text(font: font.serif, fallback: false)
  set par(leading: .5em, spacing: .75em, justify: true)

  show heading: align.with(center)
  show heading.where(level: 1): it => it + v(.5em)

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
    footer: text(
      gray,
      grid(
        columns: (auto, 1fr, auto),
        align: (x, y) => (left, center, right).at(x) + horizon,
        [最后更新：#datetime.today().display("[year] 年 [month] 月 [day] 日")],
        [],
        [
          提供信息或贡献内容请到
          #if not spinoff [#link("https://github.com/ArtveFlinaInBupt/dormitory")[#github-logo `ArtveFlinaInBupt/dormitory`] 或]
          #link("mailto:fa_555@foxmail.com", `fa_555`)
        ],
      ),
    ),
  )

  show: show-watermark.with(enable: not "release" in sys.inputs and not spinoff)

  body
}
