#import "/template/model.typ": *

// 参考北京市地方标准 DB11/T 657.2—2024《公共交通客运标志——第 2 部分：城市轨道交通》附录 B。
// 一方面 Typst 对 CMYK 的支持不佳；另一方面标准中给出的 CMYK 颜色值与实际疑似有较大偏差。因此，以下颜色均采用 RGB 模式近似表示。
#let Beijing-subway-data = (
  "10": (
    background: color.spot("PANTONE 313 C", rgb(0, 146, 188)), // cmyk(85%, 15%, 20%, 0%)
    name: "10",
  ),
  "12": (
    background: color.spot("PANTONE 154 C", rgb(155, 90, 26)), // cmyk(0%, 60%, 100%, 25%)
    name: "12",
  ),
  "13": (
    background: color.spot("PANTONE 7404 C", rgb(244, 218, 64)), // cmyk(5%, 5%, 90%, 0%)
    dark-foreground: true,
    name: "13",
  ),
  "19": (
    background: color.spot("PANTONE 251 C", rgb(221, 156, 223)), // cmyk(17%, 39%, 10%, 0%)
    dark-foreground: true,
    name: "19",
  ),
  "27": (
    background: color.spot("PANTONE 673 C", rgb(217, 134, 186)), // cmyk(10%, 60%, 0%, 0%)
    name: "昌平线",
  ),
).map(line => (
  ..line,
  cjk: line.name.contains("线"), // currently no need to match with regex
  foreground: if line.at("dark-foreground", default: false) {
    rgb(0, 51, 128) // cmyk(100%, 60%, 0%, 50%)
  } else {
    white
  },
))

#let get-subway(name) = {
  let item = Beijing-subway-data.at(str(name))
  box(
    fill: item.background.tint(100%),
    inset: (x: .15em),
    outset: (y: .25em),
    radius: .25em,
    text(fill: item.foreground, item.name),
  )
}
