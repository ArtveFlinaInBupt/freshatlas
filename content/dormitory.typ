#import "/template/util.typ": *
#import "/template/style.typ": show-body
#import "/template/model.typ": backlink

#import "campus-cell.typ": *
#import "freshman-hint.typ": *

#show: show-body

#let male-colour = eastern.darken(5%)
#let female-colour = fuchsia.darken(5%)
#let mixed-colour = color.mix(male-colour, female-colour)

#let good-colour = green.darken(25%)
#let bad-colour = red.darken(25%)
#let neutral-colour = blue
#let unknown-colour = yellow.darken(25%)
#let wip-colour = gray

#let male = text.with(fill: male-colour)
#let female = text.with(fill: female-colour)
#let mixed = text.with(fill: mixed-colour)

#let good = text.with(fill: good-colour)
#let bad = text.with(fill: bad-colour)
#let neutral = text.with(fill: neutral-colour)
#let unknown = text.with(fill: unknown-colour)
#let wip = text.with(fill: wip-colour)

#let quest = unknown[?]

#let 性别图例 = table(
  inset: (x: 1em),
  table.header()[*性别图例*],
  male[男],
  female[女],
  [#mixed[混合]#fn(1)],
  wip[无住户],
)
#let 好坏图例 = table(
  inset: (x: 1em),
  table.header()[*好坏图例*],
  good[好 / 近],
  bad[坏 / 远],
  neutral[中],
  wip[建设中],
  unknown[待确认\ 或待补充],
)
// @typstyle off
#let 主体表格 = table(
  columns: (..(auto,) * 16, 20em),
  inset: .5em,
  align: (x, y) => if y != 0 and x == 16 { left } else { center },
  table.header(
    tcell(rowspan: 3)[*所在校区*],
    tcell(rowspan: 3)[*宿舍楼*],
    tcell(colspan: 12)[*配置*],
    tcell(rowspan: 3)[*最后装修\ 年份*],
    tcell(rowspan: 3)[*住宿费#linebreak()#text(size: .7em)[元 / 学年]*],
    tcell(rowspan: 3)[*其他说明*\ #unknown[（欢迎补充）]],
    tcell(rowspan: 2)[住户类型],
    tcell(rowspan: 2)[每室人数],
    tcell(rowspan: 2)[家具],
    tcell(rowspan: 2)[卫生间],
    tcell(rowspan: 2)[阳台],
    tcell(rowspan: 2)[楼层 / 电梯],
    tcell(rowspan: 2)[水电网供应],
    tcell(colspan: 5)[距离],
    [快递站],
    [外卖柜],
    [浴室楼 / 浴室],
    [教学楼群],
    [科研楼],
  ),

  沙河-cell(rowspan: 5, body: [沙河校区]),
  female[雁南 S6],
  tcell(rowspan: 5, [本科生\ 硕士研究生\ 博士研究生]),
  tcell(rowspan: 5, good[4]),
  tcell(rowspan: 5, good[上床下桌]),
  tcell(rowspan: 5, good[独卫\ +\ 公卫#fn(2)#fn(3)]),
  tcell(rowspan: 5, good[有]),
  tcell(rowspan: 3, good[6 层\ 有电梯]),
  tcell(rowspan: 5, good[正常]),
  tcell(rowspan: 5, bad[远]),
  tcell(rowspan: 5, bad[小南门柜]),
  tcell(rowspan: 5, good[层浴#fn(2)]),
  tcell(rowspan: 5, []),
  tcell(rowspan: 5, []),
  [2020],
  [1200],
  [
    单独一期工程修建，与 S1 \~ S5 无关

    面积大于其他宿舍，家具更好，上下床走台阶而非爬梯子
  ],

  female[雁南 S5\ 雁南 S4\ （24 级前）],
  [2016],
  [900],
  [由于 S6 不足以装下沙河所有女生，此处仍有一部分 2024 级以上的女生居住，对应的房间维持使用原有上床下桌家具],

  [#male[雁北 E]\ #male[雁北 D2]],
  tcell(rowspan: 3)[2014],
  tcell(rowspan: 3)[1200],
  [
    （沙河最初规划中有且仅有女寝浴室有隔板）

    在 S6 没建好时曾经是女寝，改男寝后浴室隔板没拆
  ],
  [#male[雁北 D1]\ #male[雁北 C]],
  good[6 层\ 有电梯#fn(3)],
  tcell(rowspan: 2)[
    单寝面积略小于雁南
  ],
  [#male[雁北 B]\ #male[雁北 A]],
  neutral[6 层\ 部分有电梯#fn(3)],

  本部-cell(rowspan: 9, body: [西土城\ 校区\ （校本部）]),

  tcell(rowspan: 2, male[学 13]),
  [博士研究生],
  good[2],
  tcell(rowspan: 3, good[上床下桌]),
  tcell(rowspan: 3, neutral[公卫]),
  tcell(rowspan: 2)[少量房间#good[有]\ 其余为#neutral[假阳台]],
  tcell(rowspan: 2, neutral[5 层\ 无电梯]),
  tcell(rowspan: 2)[#bad[移动网络信号奇差]\ （校园网正常）],
  tcell(rowspan: 2, bad[远]),
  tcell(rowspan: 2, good[西门柜]),
  tcell(rowspan: 2, bad[远\ #wip[楼浴尚未启用]]),
  tcell(rowspan: 2, neutral[中]),
  tcell(rowspan: 2, bad[远]),
  tcell(rowspan: 2, [2025]),
  tcell(rowspan: 2, [750]),
  tcell(rowspan: 3)[
    使用沙河雁南换下的家具
  ],
  [硕士研究生],
  good[4],

  wip[学 2],
  quest,
  good[4],
  good[有],
  neutral[5 层\ 无电梯],
  good[正常#quest],
  bad[远],
  good[西门柜],
  bad[远\ #wip[层浴尚未启用]],
  good[近],
  bad[远],
  [2025],
  quest,

  female[学 29],
  [硕士研究生\ 博士研究生],
  [8 人套间\ 每室 #good[2 \~ 4] 人],
  good[普通单层\ 床铺桌椅],
  neutral[套间\ 卫生间\ （马桶）],
  good[有],
  neutral[20 层\ 2 部电梯],
  good[正常#quest],
  bad[远],
  good[东门柜],
  bad[远 #v(.25em) #neutral[有套间浴室]\ 但无热水],
  bad[远],
  neutral[中],
  [#quest\ 早于 2003],
  [1020],
  [
    可参考#backlink("https://bbs.byr.cn/#!article/Picture/3377378")[北邮人论坛]

    曾经是家属区眷 29 楼，非典时期被征用为非典塔，后空置直到学校扩招被征用为宿舍；高层曾用作留学生宿舍

    只有一楼有热饮用水
  ],

  [#female[学 9]\ #female[学 11]],
  [本科生],
  good[4],
  good[上床下桌],
  neutral[公卫],
  bad[无],
  neutral[5 层\ 无电梯],
  bad[每天凌晨\ 停冲厕用中水],
  good[近],
  good[北门柜],
  neutral[中\ #wip[层浴尚未启用]],
  bad[远],
  bad[远],
  [2024],
  [750],
  [
    单寝面积很小
  ],

  mixed[学 8],
  [本科生\ 博士研究生],
  tcell(rowspan: 2, good[4]),
  tcell(rowspan: 2, good[上床下桌]),
  tcell(rowspan: 2, neutral[独卫]),
  tcell(rowspan: 2, good[有]),
  tcell(rowspan: 2, neutral[12 层\ 2 部电梯]),
  tcell(rowspan: 2, good[正常#quest]),
  good[近],
  neutral[北门柜],
  [#neutral[近]\ #neutral[部分寝室有独浴]\ #bad[但无热水]],
  neutral[中],
  neutral[中],
  tcell(rowspan: 2, [#quest\ 早于 2001]),
  [1200],
  tcell(rowspan: 2, [部分房间地漏不可用，楼板渗水，搭配独浴和停水忘关水龙头有奇效]),
  female[学 4\ （部分）],
  [博士研究生],
  neutral[中],
  neutral[北门柜\ 西门柜],
  [#neutral[中]\ #neutral[部分寝室有独浴]\ #bad[但无热水]],
  neutral[中],
  bad[远],
  [850],

  [#mixed[学 3]\ #male[学 5]],
  [本科生\ 硕士研究生],
  neutral[6],
  good[上床下桌],
  bad[公卫],
  good[有],
  bad[15 层\ 2 部电梯],
  bad[每天凌晨\ 停冲厕用中水],
  neutral[中],
  neutral[北门柜\ 西门柜],
  neutral[中],
  neutral[中],
  bad[远],
  [2004],
  [900],
  [
    均摊千人一部电梯，有时等待时间极长

    除一楼和顶楼外层高很低，床上难以坐直
  ],

  male[学 10],
  [本科生\ 硕士研究生\ 博士研究生],
  neutral[6],
  good[上床下桌],
  neutral[公卫],
  good[有],
  neutral[15 层\ 7 部电梯],
  good[正常#quest],
  good[近],
  good[北门柜],
  neutral[近],
  bad[远],
  neutral[中],
  [2011],
  [900],
  [
    楼道内通风、采光差
  ],


  沙河-cell(body: [沙河校区]),
  [#male[雁南 S2\ 雁南 S3]\ #mixed[雁南 S4]\ #female[雁南 S5]\ #mixed[（25 级）]],
  [本科生\ 硕士研究生\ 博士研究生#quest],
  neutral[6],
  neutral[
    床床#hide[#backlink("about:blank")[]] \
    床#backlink("https://baike.baidu.com/pic/TFBOYS/9083733/0/3c6d55fbb2fb4316390c99072da4462309f7d3b8")[桌] \
  ],
  good[独卫\ +\ 公卫#fn(2)],
  good[有],
  good[6 层\ 有电梯],
  good[正常],
  bad[远],
  bad[小南门柜],
  good[层浴],
  [],
  [],
  [2016],
  [900],
  [
    床位布局难以评价，床铺尺寸不统一

    衷心希望新的宿舍楼能够早日建成以分担住宿压力，拯救水深火热中的雁南住户
  ],

  本部-cell(rowspan: 3, body: [西土城\ 校区\ （校本部）]),

  female[学 4\ （部分）],
  [本科生\ 硕士研究生\ 博士研究生],
  neutral[6],
  bad[上下铺],
  neutral[独卫],
  good[有],
  neutral[12 层\ 2 部电梯],
  good[正常#quest],
  neutral[中],
  neutral[北门柜\ 西门柜],
  [#neutral[中]\ #neutral[部分寝室有独浴]\ #bad[但无热水]],
  neutral[中],
  bad[远],
  [#quest\ 早于 2001],
  [850],
  [
    单寝面积略大于学 6

    有和前面学 8 相同的所有问题
  ],

  male[学 6],
  [本科生],
  neutral[6],
  bad[上下铺],
  bad[独卫],
  [除#bad[一楼]外#good[有]],
  bad[6 层\ 无电梯],
  bad[随机停电\ 随机停冲厕用中水],
  good[近],
  good[科研楼柜],
  neutral[近],
  bad[远],
  good[近],
  [2003],
  [1020],
  [
    离经管楼和科研楼近，也许可以……
  ],

  [#male[学 1]],
  [本科生],
  bad[8],
  bad[上下铺],
  bad[公卫],
  good[有],
  neutral[5 层\ 无电梯],
  bad[五楼卫生间\ 部分时间无水],
  bad[远],
  good[西门柜],
  bad[远],
  good[近],
  bad[远],
  [1993],
  [550],
  [
    有翻修计划，预计将在 2025 年下半年开始
  ],
)

#let 表格注 = stack(
  dir: ttb,
  spacing: .5em,
  ..(
    [表中列出的所有#mixed[混寝]宿舍楼中性别混合的最小单位均为*楼层*。也即，不存在同一楼层内男女混住的情况。],
    [雁北 D2, E 楼为一个区域，内部部分连通，共用电梯。D2 楼借用 E 楼公卫、水房、浴室，可能需要前往其他层。],
    [雁北 A, B, C, D1 楼为一个区域，内部部分连通。该区域两部电梯均位于 D1 部分，A, B, C 楼需要借道；A, B 二楼与 A 六楼无法通过电梯到达，需要步行一层；B 楼和 D 楼借用位于 A 楼和 C 楼的各一套公卫、水房、浴室，可能需要前往其他层。],
  )
    .enumerate()
    .map(((n, it)) => fn(n + 1) + it),
)

#let 好坏条 = stack(
  spacing: .5em,
  good[好],
  context box(
    width: .1em,
    height: measure(主体表格).height - 7.5em, // 需在更新表格后手动调整
    fill: gradient.linear(green, red, angle: 90deg),
  ),
  bad[坏],
)

= 柏油 · 宿舍

#disclaimer

学校绝大部分建筑物内，以及不存在例外的全部宿舍房间内：

- 配备空调、暖气；
- 不存在晚熄灯和晚断电制度（但大部分楼有锁门宵禁）；
- 免费不限时不限流量无线校园网全覆盖，一般速度至少 #qty[120][Mbps]，至多 #qty[400][Mbps]。

此外，全校所有浴室均装有隔板（但未安装门，因此没有隔间）。

#v(1em)

表格内只讨论绝大多数宿舍配置，不讨论占比较少的特殊房间。

本文档旨在提供信息而非排个高低，因此不接受任何有关排名顺序的建议和批评——几乎所有人都觉得别人住得比自己好，学 3, 5, 8, 9, 10, 11, 29 甚至沙河雁北中的任何一个放前面都有人不满意，被喷得实在烦。

#{
  show: align.with(center + horizon)

  stack(
    dir: ltr,
    spacing: 3em,
    stack(
      spacing: 2em,
      性别图例,
      好坏图例,
    ),
    grid(
      columns: 2,
      align: (bottom, left),
      column-gutter: 1em,
      row-gutter: .5em,
      好坏条, 主体表格,
      [], 表格注,
    ),
  )
}

特殊房间不完全列表（仅说明和其他房间不同之处）：

#grid(
  columns: 2,
  gutter: .5em,
  [- *学 3 大 6 人间*：], [更大的空间，无阳台，有超大落地窗],
  [- *学 4 10 人间*：], [10 人（5 张上下铺），多个房间，无阳台],
  [- *学 5 10 人间*：], [10 人（5 张上下铺），更大的空间，无阳台],
  [- *学 10 大 6 人间*：], [更大的空间],
  [- *学 13 有阳台房间*：], [2 人间和 4 人间均存在；阳台大小不一，同时兼有假阳台],
)
