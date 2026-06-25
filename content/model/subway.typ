#import "/template/model.typ": *

// 参考北京市地方标准 DB11/T 657.2—2024《公共交通客运标志——第 2 部分：城市轨道交通》附录 B。
// 一方面 Typst 对 CMYK 的支持不佳；另一方面标准中给出的 CMYK 颜色值与实际疑似有较大偏差。因此，以下颜色均采用 RGB 模式近似表示。
#let Beijing-subway-data = (
  "2": (
    background: color.spot("PANTONE 301 C", rgb(0, 75, 135)), // cmyk(100%, 44%, 0%, 47%)
    name: "2",
  ),
  "3": (
    background: color.spot("PANTONE 186 C", rgb(200, 16, 46)), // cmyk(0%, 92%, 77%, 22%)
    name: "3",
  ),
  "4": (
    background: color.spot("PANTONE 321 C", rgb(0, 140, 149)), // cmyk(100%, 6%, 0%, 42%)
    name: "4",
  ),
  "8": (
    background: color.spot("PANTONE 3278 C", rgb(0, 155, 119)), // cmyk(100%, 0%, 23%, 39%)
    name: "8",
  ),
  "9": (
    background: color.spot("PANTONE 375 C", rgb(151, 215, 0)), // cmyk(30%, 0%, 100%, 16%)
    name: "9",
  ),
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
  "18": (
    background: color.spot("PANTONE 2725 C", rgb(104, 91, 199)), // cmyk(48%, 54%, 0%, 22%)
    name: "18",
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
  "34": (
    background: color.spot("PANTONE 666 C", rgb(161, 146, 178)), // cmyk(10%, 18%, 0%, 30%)
    name: "首都机场线",
  ),
  "35": (
    background: color.spot("PANTONE 2728 C", rgb(0, 71, 187)), // cmyk(100%, 62%, 0%, 27%)
    name: "大兴机场线",
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

#let get-subway-data(name) = Beijing-subway-data.at(str(name))

#let get-subway-color(name) = get-subway-data(name).background.tint(100%)

#let get-subway(name) = {
  let item = get-subway-data(name)
  box(
    fill: item.background.tint(100%),
    inset: (x: .15em),
    outset: (y: .25em),
    radius: .25em,
    text(font: font.sans, fill: item.foreground, item.name),
  )
}
