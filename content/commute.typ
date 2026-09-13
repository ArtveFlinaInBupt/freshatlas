#import "/template/style.typ": show-body
#import "/template/util.typ": fancy, qty, ruby, tcell

#import "model/icon.typ": cah, cr, subway
#import "model/campus-cell.typ": 本部-color, 本部-styled, 沙河-color, 沙河-styled
#import "model/subway.typ": get-subway, get-subway-color

#let tint = get-subway-color(27)

#show: show-body.with(tint: tint)
#set page(width: 150em)

#let 场站表 = {
  let columns = (
    场站: (align: center + horizon, width: auto),
    地铁站: (align: left + horizon, width: auto),
  )
    .pairs()
    .enumerate()
    .map(((i, (k, v))) => (k, v + (x: i)))
    .to-dict()
  let name = tcell.with(x: columns.场站.x)
  let subway-name(body, iconed: false) = tcell(
    x: columns.地铁站.x,
    if not iconed { subway(body) } else { body },
  )

  let 表 = table(
    inset: (x: 1em, y: 0.5em),
    align: (x, y) => if y == 0 { center + horizon } else { columns.values().at(x).align },
    columns: columns.values().map(it => it.width),
    table.header(..columns.keys().map(strong)),
    name(cr[北京站]), subway-name[北京站],
    name(cr[北京南站]), subway-name[北京南站],
    name(cr[北京西站]), subway-name[北京西站],
    name(cr[清河站]), subway-name[清河站],
    name(cr[北京北站]), subway-name[西直门],
    // description[
    //   若你的目的地是#沙河-styled[沙河校区]，请尽可能选择在#cr[清河站]而非#cr[北京北站]下车；否则，您不仅需要在人流极其拥挤、缺少电梯等设施的#cr[北京北站]和#subway[西直门]辗转换乘，最后还要乘地铁折返回#subway[清河站]，白白浪费时间、金钱、体力。
    // ],
    name(cr[北京朝阳站]), subway-name[朝阳站],
    name(cr[北京丰台站]), subway-name[丰台站],
    name(cah[北京首都国际机场 (PEK)]),
    subway-name(iconed: true)[#subway[2 号航站楼]\ #subway[3 号航站楼]],
    // description[
    //   若您经由 PEK 前来，建议优先考虑网约车而非地铁。
    // ],
    name(cah[北京大兴国际机场 (PKX)]), subway-name[大兴机场站],
    // description[
    //   若经由 PKX 前来，可检查机票是否赠送#get-subway(35)免费乘车券或折扣券，这至多能节省单程 #qty[35][元/人]的交通费用。
    // ],
  )

  set align(left)
  stack(
    dir: ttb,
    spacing: 0.75em,
    表,
    context block(width: measure(表).width)[
      考虑到通勤不便等因素，请不要选择经由表中未列出的北京通州站、昌平站、北京东站等场站前来。
    ],
  )
}

= 柏油 · #text(fill: tint)[新生通勤]

#{
  let card(color, name, station, description) = block(
    width: 100%,
    height: 12em,
    fill: color.background,
    stroke: (paint: color.foreground, thickness: .05em),
    radius: 1em,
    inset: (x: 2em),
    {
      set text(fill: color.foreground)
      set par(first-line-indent: 0em)

      v(1fr)
      grid(
        columns: (1fr, 1em, 1fr),
        align: (right, center, left),
        inset: (x: 2em),
        text(size: 1.65em, name),
        block(below: .5em, height: 3em, width: .25em, fill: color.foreground, radius: .5em),
        station,
      )
      v(1fr)
      align(left, description)
      v(1fr)
    },
  )
  set align(center + horizon)
  show: block.with(width: 60%)
  grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    card(本部-color, "本部", subway[蓟门桥])[
      #subway[蓟门桥] D 出口距离#本部-styled[本部]西北角仅 #qty[200][m]，是名副其实的学校地铁站，只是没有以校名命名而已。
    ],
    card(沙河-color, "沙河校区", [#subway[沙河高教园]\ #subway[沙河]])[
      两站距离#沙河-styled[沙河校区]西门均约 #qty[1][km]，日常生活均可使用。

      新生报到日当天，学校在#subway[沙河高教园] A 出口提供接驳服务，请新生选择该站下车。

      若你计划不乘公共交通自行前往，请注意目的地应是#沙河-styled[沙河校区]南门，而非西门。
    ],
  )
}

#grid(columns: (60em, 1fr), column-gutter: 3em)[
  == 谁该阅读？

  本指南主要面向前往#沙河-styled[沙河校区]的新生，但途中经过#subway[蓟门桥]的方案同样适用于前往#本部-styled[本部]的同学。

  - 若你计划自驾抵京，则暂时不需要本指南，不过也可以读着玩玩。
  - 否则，若你计划在报到日当天抵京，则可全盘参考本指南中给出的方案。
  - 否则，若你计划提前抵京，或有在外住宿的需求，也可将本文的信息或方法论作为参考，辅助规划行程。
    - 题外话：笔者极不推荐在沙河镇住宿，请您发挥主观能动性，选择上地、回龙观或其他更合适的区域住宿。

  无论如何，报到日当天学校会在#subway[沙河高教园] A 出口提供接驳服务，我们的目的是乘公共交通前往这里，或打车直接前往校门。

  == 有什么用？

  指南所列方案将：

  - 优先考虑#ruby[携带大件行李][避开台阶]、#ruby[有家人陪同][多人同行]的需求，统筹地铁和网约车（出租车）两种交通方式。
  - 尽可能避免步行、共享单车、公交、京雄城际、机场巴士等对大件行李不友好，或初次使用时心智负担较高的交通方式。
  - 不追求极致的速度、最少的换乘。对于一辈子只有一次的本科报到，应该气定神闲、游刃有余，不该把自己搞得着急忙慌。
    - 例如，如果你在某线路的始发站而没抢到座位，完全可以当机立断下车，排队等待下一班列车。


  #align(center, block(width: 90%, fancy((red, red))[
    #set align(left)

    读者先前可能会疑惑：这不就是我自己开个导航的事情吗？为什么要大费周章写一篇指南，还要我花时间读？

    本通勤指南的核心意义在此——地图和导航完全不会考虑出行的舒适性，也不会考虑新生携带大件行李的需求。

    作为例子，如果你从津鲁苏沪之一的省份乘高铁前来，搜索#cr[北京南站]到#沙河-styled[沙河校区]的通勤方案，市面上的导航软件（即使选择了“电梯优先”也）将会无一例外首推地铁 #get-subway(4) #get-subway(13) #get-subway(27) 的方案，因为这个方案相对较快且换乘最少。

    然而，如果你真的信了这个鬼话，就会在#subway[北京南站] #get-subway(4, long: true) 的站台和列车上被挤成肉馅，在#subway[西直门]离开 #get-subway(4, long: true) 列车时第一时间注意到周围一眼望不到头的台阶，稍作寻找后意识到完全没有电扶梯和直梯，并最终接受现实，拎着行李混在像你一样被导航骗来的人海中走过接近一公里的上天入地换乘通道。

    这么一套连招下来，把自己（或者爸妈，或者自己和爸妈）累个半死不说，全家人对北京的第一印象怕是也彻底毁在这里了！

    *这种没苦硬吃的经历本可以被优秀的通勤方案所避免，这就是这篇通勤指南的作用。*
  ]))

  #show heading.where(level: 2): set heading(supplement: none, numbering: (
    ..nums,
  ) => [#(nums.pos().at(1) - 2).])

  == 购票

  本指南仅从到达时间、到达站点两方面给出一些注意事项。

  / 到达时间: 机场、火车站、北京地铁都并非 #qty[24][h] 运行，深夜的网约车也比白天贵得多。一般来说，即使并非报到当天抵京，也不推荐选择在深夜或凌晨抵达。考虑为可能的突发情况预留时间，推荐不要早于 7:00 或晚于 20:00 抵京。

  / 到达站点:

    / 火车（含动车组列车 / 高铁）: 在这个问题上通常没有多少选择的权利——轨道限制了全国不同方向能到达的车站。你应打开国铁 12306 APP 或官网，搜索你的出发地到北京市的车次，查看有哪些到达站点可供你选择。需要特别指出的是，如果你能购买到达清河站的车票，那就不要考虑其他任何车站。否则，你可转到 #link(<route>)[\1. 在路上]查看不同车站的通勤方案并挑选。

    / 飞机: 与铁路不同，我国商业化的民航业允许选择不同的航司的、降落到不同机场的航班。对于北京市的首都机场 PEK 和大兴机场 PKX，如果你更想快捷地到达学校，尽量选择 PEK 并直接打车前往；如果想体验北京地铁，则可以选择 PKX。具体的价格、通勤方案请查看 #link(<route>)[\1. 在路上]。

  == 离开场站

  可能有相当数量的新生（比如五年前来到北京的笔者本人）过去生活在小城市，没有见过像迷宫一样的庞大交通枢纽，从未乘坐过地铁或网约车，甚至不会说普通话。不必担心，便民设施没有什么使用的门槛，本指南会尝试帮你熟悉它们。

  在使用任何公共交通设施时，只需目的明确，勤于寻找各种导视标识即可。如果不知如何理解标识，或发现自己兜圈迷路，可以主动寻找工作人员求助。

  北京公共交通人流量大，记得全程盯紧同行人员、行李和随身物品，不要被别人顺手牵羊，也不要忘记托运或寄存的行李。

  #grid(columns: (1fr, 1fr), column-gutter: 1em)[
    === 地铁

    - 离开交通场站禁区后，你可跟随形如 #get-subway(12, long: true) 的、带有线路名称和主题色的导视标识，前往地铁站的售票厅或闸机口。
    - 你和家人可以选择以下方式进出站：
      - 提前下载「北京一卡通」APP 刷码，或办卡后 NFC 刷卡
        - 你本人可以在这里申办学校专属卡面的学生公交卡
      - 使用任何交通联合卡
      - 支付宝首页「出行」或微信搜索「城市通」刷码
        - 记得城市要选北京
      - 在售票机购买实体车票
      - 更多方式如刷银行卡等此处不赘述
    - 从站厅前往站台时，或者换乘时从站台前往另一个站台时，可尝试寻找或向工作人员询问电扶梯或直梯，避免携带大件行李步行上下台阶。
  ][
    === 网约车（或出租车）

    - 网约车相比地铁的优劣都显而易见：优势在于方便、舒适、快捷，劣势在于价格相对较高。随着同行人数增加，网约车的价格劣势会减小。
    - 离开交通场站禁区后，可跟随带有“网约车”等字样的导视标识，前往*固定的网约车上车点*。
    - 选择上下车点位时注意精确。例如，上车时需要准确选择特定的地铁出口，前往学校应该选择#沙河-styled[沙河校区]*南门*。

    === 其他（城际铁路、公交、机场巴士等）

    本指南没有推荐其他公共交通方式，但它们中也不乏省心省力的通勤方案。如果你想使用它们，可以通过各种公开资源了解与制订计划，也可加入北邮交通爱好者群聊和大家交流。
  ]
][
  == 在路上 feat. #link("https://qm.qq.com/q/9j8bUgxmw")[北邮交通爱好者 (703789362）] <route>

  #{
    set align(center)
    show: block
    set align(horizon)
    grid(
      columns: 2,
      column-gutter: 3em,
      figure(场站表),
      figure(
        image("/asset/simplified-beijing-subway.svg", width: 40em),
        caption: [北京地铁简化线路图，只保留了与本指南有关的车站。不能体现实际距离关系！],
      ),
    )
  }
]
