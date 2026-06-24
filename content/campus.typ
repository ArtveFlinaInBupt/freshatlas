#import "/template/util.typ": *
#import "/template/model.typ": backlink
#import "/template/style.typ": show-body

#import "model/color.typ": secondary-color, 本部-color
#import "model/subway.typ": get-subway
#import "model/campus-cell.typ": *

#let tint = 本部-color.foreground

#show: show-body.with(tint: tint)

#let secondary = text.with(fill: secondary-color)
#let active(body) = text(fill: red)[\[#body\]]

#let data = (
  (
    name: "信息与通信工程学院",
    code: 311,
    count: 2,
    dept: ("本部", "教二"),
    source: [23 级大三前回迁],
  ),
  (
    name: "电子工程学院",
    code: 312,
    count: 2,
    dept: ("本部", "教四"),
    source: [23 级大三前回迁],
  ),
  (
    name: "计算机学院（国家示范性软件学院）",
    code: 313,
    fill: (沙河-cell(),) * 3 + (undetermined-cell(body: [未知]),) + (本部-cell(),),
    dept: ("本部", "教三"),
    source: [
      23 级大二前回迁 \
      24 级起可能不再回迁 \
      #active[有活跃异动，未稳定] \
    ],
  ),
  // 老自动化院 314 RIP
  // 软件院 315? RIP
  (
    name: "数字媒体与设计艺术学院",
    code: 316,
    count: 5,
    dept: ("沙河", "数媒楼"),
    source: [21 级毕业前未曾回迁],
  ),
  // 邮政院 317 RIP
  (
    name: "网络空间安全学院",
    code: 318,
    count: 5,
    dept: ("沙河", "网安楼"),
    source: [21 级毕业前未曾回迁],
  ),
  (
    name: "经济管理学院",
    code: 321,
    count: 2,
    dept: ("本部", "经管楼"),
    source: [24 级大二前回迁\ 25 级大二前不回迁\ #active[有活跃异动，未稳定]],
  ),
  (
    name: "人文学院",
    code: 331,
    fill: (
      沙河-cell(),
      沙河-cell(),
      沙河-cell(body: [沙#fn(2)]),
      沙河-cell(),
      沙河-cell(),
    ),
    dept: ("沙河", "S2"),
    source: [21 级毕业前未曾回迁],
  ),
  (
    name: "马克思主义学院",
    code: 332,
    fill: (..(invalid-cell(),) * 4, 沙河-cell()),
    dept: ("沙河", "S2"),
    source: [],
  ),
  // 理学院 341 RIP
  (
    name: "国际学院",
    code: 351,
    count: 2,
    dept: ("本部", "国院楼"),
    source: [24 级大二前回迁\ 25 级大二前不回迁\ #active[有活跃异动，未稳定]],
  ),
  (
    name: "玛丽女王海南学院",
    code: 377,
    fill: (..(海南-cell(),) * 4, invalid-cell()),
    source: [],
  ),
  (
    name: "未来学院",
    code: 378,
    count: (2, 2),
    source: [23 级大三前回迁],
  ),
  (
    name: "集成电路学院",
    code: 379,
    count: 2,
    dept: ("本部", "学发"),
    source: [23 级大三前回迁],
  ),
  (
    name: "卓越工程师学院",
    code: 380,
    fill: (..(invalid-cell(),) * 4, 本部-cell()),
    source: [
      #active[有活跃异动，未稳定] \
    ],
  ),
  (
    name: "智能工程与自动化学院",
    code: 386,
    count: 5,
    dept: ("沙河", "智工楼"),
    source: [21 级毕业前未曾回迁],
  ),
  (
    name: "数学科学学院",
    code: 387,
    count: 5,
    dept: ("沙河", "理学楼"),
    source: [21 级毕业前未曾回迁],
  ),
  (
    name: "物理科学与技术学院",
    code: 388,
    count: 5,
    dept: ("沙河", "理学楼"),
    source: [21 级毕业前未曾回迁],
  ),
  (
    name: "人工智能学院",
    code: 391,
    count: 2,
    dept: ("本部", "创新楼"),
    source: [23 级大三前回迁],
  ),
  (
    name: "密码学院",
    code: "???",
    fill: (..(invalid-cell(),) * 5,),
    source: none,
  ),
  // (
  //   name: "",
  //   code: 0,
  //   count: 0,
  //   source: [],
  // ),
)

#let gen-row-fill(..args) = {
  let TOTAL = 5
  let 沙河-count = args.pos().at(0, default: 5)
  let 本部-count = args.pos().at(1, default: TOTAL - 沙河-count)
  let 空-count = TOTAL - 沙河-count - 本部-count
  (..(沙河-cell(),) * 沙河-count, ..(本部-cell(),) * 本部-count, ..(invalid-cell(),) * 空-count)
}

#let dept-building(dept) = if dept.len() == 0 { tcell[] } else {
  assert(dept.len() == 2)
  let (campus, building) = dept
  ("沙": 沙河-cell, "沙河": 沙河-cell, "本": 本部-cell, "本部": 本部-cell).at(campus)(
    body: building,
  )
}


#let gen-row-data(row) = {
  let fill = if "count" in row.keys() {
    let count = row.count
    if type(count) == int {
      gen-row-fill(row.count)
    } else if type(count) == array {
      gen-row-fill(..count)
    }
  } else {
    if row.fill.len() != 5 {
      panic("Row fill must have exactly 5 elements, got " + repr(row.fill))
    }
    row.fill
  }

  (
    [(#row.code) #row.name],
    ..fill,
    dept-building(row.at("dept", default: ())),
    row.source,
  )
}

#let 校区说明表格 = table(
  columns: (auto, auto, auto, 30em),
  align: (x, y) => if x == 3 and y != 0 { left } else { center } + horizon,

  table.header[*校区名称*][*图例*][*地址*][*介绍*],

  [西土城校区\ （校本部）],
  本部-cell(),
  [北京市海淀区\ 西土城路 10 号],
  subtable[
    自 1955 年建校以来的主校区，位于北京城区，交通十分便利。

    近几年正在大力活跃翻修，几个最差的寝室楼一跃而上成为了如今最好的。
  ][
    位于三环以内，紧邻北三环，距二环（铁路#proper[北京北站]）约 #qty[2][km]。周边有超多商圈。

    与#proper[北师大]隔街相望；距#("北航", "央财", "交大", "法大", "电影学院").map(proper).join("、")、#proper[北大医学部]（#proper[北医三院]）*等*均短于 #qty[3][km]；北航以北是学院路 8 校。

    距#proper[字节跳动总部（抖音大楼）]约 #qty[1.5][km]，距#proper[中关村]核心区约 #qty[5][km]。

    距地铁#proper[蓟门桥]站约 #qty[200][m]，距地铁#("北太平庄", "西土城", "大钟寺").map(it => proper(it) + "站").join("、")、#proper[四道口]站（在建）均短于 #qty[1.5][km]，涉及地铁 #get-subway(10), #get-subway(12), #get-subway(13), #get-subway(19), #get-subway(27)，线路非常优质。
  ][
    校内的连锁品牌：

    - 餐饮：蜜雪冰城、瑞幸咖啡、麦当劳、醉面、虎头军煎饼、泸溪河桃酥
    - 零售：物美（多点）超市
  ],

  [沙河校区],
  沙河-cell(),
  [北京市昌平区\ 沙河高教园区],
  subtable[
    2018 年起全面投入使用的新校区，位于北京郊区，生活环境较优渥。

    本校区与周边其他大学的校园都在活跃建设中。
  ][
    周边稍显荒凉，外来人口众多，主要为居民区，以及#("外交学院", "北航", "北师大", "央财").map(proper).join("、")等众多高校的沙河校区，也有少量商圈。

    距地铁#get-subway(27)#proper[沙河]站、#proper[沙河高教园]站均短于 #qty[1][km]。

    #沙河-styled[沙河校区]和#本部-styled[西土城校区]之间单程乘地铁需 #qty[1][h] 以上（其中列车运行 #qty[40][min]），乘免费班车最快约 #qty[30][min]，实际耗时可能因路况增加（例如遇早晚高峰、雨雪天气）。
  ][
    校内的连锁品牌：

    - 餐饮：蜜雪冰城、库迪咖啡、KFC、必胜客、醉面、虎头军煎饼
    - 零售：天猫超市
  ],

  [海南校区],
  海南-cell(),
  [海南省陵水黎族自治县\ 黎安国际教育创新试验区],
  [
    2022 年投入使用的新校园（园区），与#proper[成电]、#proper[中传]等数所其他高校的中外合作办学共用。

    交通较不便利。
  ],

  [宏福校区],
  [],
  secondary[北京市昌平区\ 北七家镇郑各庄村],
  [已不再承载普通全日制学生教学与生活活动。高考志愿中出现宏福校区字样的同学入学应前往#沙河-styled[沙河校区]。],

  [小西天校区],
  [],
  secondary[北京市西城区\ 新街口外大街28号],
  [不承载普通全日制学生教学与生活活动，有少量家属公寓楼。],
)

#let 详表 = align(
  left,
  stack(
    spacing: spacing.par-spacing,
    dir: ttb,
    // @typstyle off
    table(
      columns: 8,
      inset: (x: .5em, y: spacing.par-spacing * .75),
      table.header(
        tcell(rowspan: 3)[*学院*],
        tcell(colspan: 5)[*校区*（宿舍）],
        tcell(rowspan: 3)[*校区*\ （学院楼）],
        tcell(rowspan: 3)[*依据*],
        tcell(colspan: 4)[本科生],
        tcell(rowspan: 2)[研究生#fn(1)],
        [大一], [大二], [大三], [大四],
      ),
      ..data.map(gen-row-data).flatten(),
    ),
    [#fn(1)曾经所有#沙河-styled[沙河校区]的研究生须在毕业年级回迁#本部-styled[本部]，但自 2025 年起似乎不再有该要求。#active[有活跃异动，未稳定]],
    [#fn(2)人文学院法学专业联培学生大三学年前往中国政法大学参与联合培养。],
  ),
)

= 柏油 · #text(fill: tint)[校区]

另附：来自学校官网的#backlink("https://www.bupt.edu.cn/bygk/zjby/xydt.htm")[校园地图]

#grid(
  columns: (auto, auto),
  column-gutter: 3em,
  [
    == 校区简介

    #figure(校区说明表格)
  ],
  [
    == 校区分配

    尽量为信息给出来源；规划持续变动，请以实际为准，不要过于依赖本表。

    目前，学校遵循的分配策略为：

    - 所有（位于北京的）本科新生都在#沙河-styled[沙河校区]；
    - 本科生以学院为单位可能在某个时间点后回迁#本部-styled[本部]；
    - 研究生以学院为单位倾向于分配在同一校区#fn(1)。

    #figure(详表)
  ],
)
