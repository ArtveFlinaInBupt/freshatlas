#import "/template/model.typ": *

#let get-subway(name) = {
  // 参考北京市地方标准 DB11/T 657.2—2024《公共交通客运标志——第 2 部分：城市轨道交通》附录 B。
  // 一方面Typst 对 CMYK 的支持不佳；另一方面标准中给出的 CMYK 颜色值与实际疑似有较大偏差。因此，以下颜色均采用 RGB 模式近似表示。
  let Beijing-subway-data = (
    "10": (
      // background: cmyk(85%, 15%, 20%, 0%),
      background: rgb(0, 146, 188),
      name: "10",
      url: "https://www.pantone.com/color-finder/313-C",
    ),
    "12": (
      // background: cmyk(0%, 60%, 100%, 25%),
      background: rgb(155, 90, 26),
      name: "12",
      url: "https://www.pantone.com/color-finder/154-C",
    ),
    "13": (
      // background: cmyk(5%, 5%, 90%, 0%),
      background: rgb(244, 218, 64),
      foreground: rgb(0, 51, 128), // cmyk(100%, 60%, 0%, 50%),
      name: "13",
      url: "https://www.pantone.com/color-finder/7404-C",
    ),
    "19": (
      // background: cmyk(17%, 39%, 10%, 0%),
      background: rgb(221, 156, 223),
      foreground: rgb(0, 51, 128), // cmyk(100%, 60%, 0%, 50%),
      name: "19",
      url: "https://www.pantone.com/color-finder/251-C",
    ),
    "27": (
      // background: cmyk(10%, 60%, 0%, 0%),
      background: rgb(217, 134, 186),
      name: "昌平线",
      cjk: true,
      url: "https://www.pantone.com/color-finder/673-C",
    ),
  )
  let item = Beijing-subway-data.at(str(name))
  if "cjk" not in item {
    item.cjk = false
  }
  if "foreground" not in item {
    item.foreground = white
  }

  box(
    fill: item.background,
    inset: (x: .15em),
    outset: (y: .25em),
    radius: .25em,
    text(fill: item.foreground, item.name),
  )
}
