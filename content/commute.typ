#import "/template/style.typ": show-body
#import "/template/util.typ": fancy, qty, ruby, tcell

#import "model/icon.typ": cah, cr, get-taxi, subway
#import "model/campus-cell.typ": 本部-color, 本部-styled, 沙河-color, 沙河-styled
#import "model/subway.typ": get-subway, get-subway-color

#let tint = get-subway-color(27)

#show: show-body.with(tint: tint)
#set page(width: 180em)

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
    name(cr[北京丰台站]), subway-name[丰台站],
    name(cr[清河站]), subway-name[清河站],
    name(cr[北京北站]), subway-name[西直门],
    name(cr[北京朝阳站]), subway-name[朝阳站],
    name(cah[北京首都国际机场 (PEK)]),
    subway-name(iconed: true)[#subway[2 号航站楼]\ #subway[3 号航站楼]],
    name(cah[北京大兴国际机场 (PKX)]), subway-name[大兴机场],
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

#grid(columns: (60em, 1fr), column-gutter: 3em)[
  == 有什么用？

  #align(center, block(width: 90%, fancy((red, red))[
    #set align(left)

    #par(text(size: 2em)[*绝对不要说：“太多字了不想看，我还是自己开导航吧。”*])

    *本指南的核心意义在此——地图和导航完全不会考虑任何舒适性，也不会考虑学生携带大件行李的需求。*

    作为例子，如果你从津鲁苏沪之一的省份乘高铁前来，搜索#cr[北京南站]到#沙河-styled[沙河校区]的公共交通路线，市面上的导航软件（即使选择了“电梯优先”也）将会无一例外首推地铁 #get-subway(4) #get-subway(13) #get-subway(27) 的方案，因为这个方案相对较快且换乘最少。

    然而，如果你真的信了这个鬼话，就会在#subway[北京南站] #get-subway(4, long: true) 的站台和列车上被挤成肉馅，在#subway[西直门]离开 #get-subway(4, long: true) 列车时第一时间注意到周围一眼望不到头的台阶，稍作寻找后意识到完全没有电扶梯和直梯，并最终接受现实，拎着行李混在像你一样被导航骗来的人海中走过接近一公里的上天入地换乘通道。

    这么一套连招下来，把自己（或者爸妈，或者自己和爸妈）累个半死不说，全家人对北京的第一印象怕是也彻底毁在这里了！

    *这种没苦硬吃的经历本可以被优秀的通勤方案所避免，这就是这篇通勤指南的作用。*
  ]))

  指南所列方案将：

  - 优先考虑#ruby[携带大件行李][避开台阶]、#ruby[有家人陪同][多人同行]的需求，统筹地铁和网约车（出租车）两种交通方式。
  - 尽可能避免步行、共享单车、公交、京雄城际、机场巴士等对大件行李不友好，或初次使用时心智负担较高的交通方式。
  - 不追求极致的速度、最少的换乘。对于一辈子只有一次的本科报到，应该气定神闲、游刃有余，不该把自己搞得着急忙慌。
    - 例如，如果你在某线路的始发站而没抢到座位，完全可以当机立断下车，排队等待下一班列车。

  #{
    let card(color, name, station, description) = block(
      width: 100%,
      height: 15em,
      fill: color.background,
      stroke: (paint: color.foreground, thickness: .05em),
      radius: 1em,
      inset: (x: 2em),
      {
        set text(fill: color.foreground)

        v(1fr)
        strong(grid(
          columns: (1fr, 1em, 1fr),
          align: (right, center, left),
          inset: (x: 2em),
          text(size: 1.65em, name),
          block(below: .5em, height: 3em, width: .25em, fill: color.foreground, radius: .5em),
          station,
        ))
        v(1fr)
        align(left, description)
        v(1fr)
      },
    )

    heading(level: 2)[Home Sweet Home]

    set align(center + horizon)
    show: block.with(width: 90%)
    grid(
      columns: (1fr, 1fr),
      column-gutter: 1em,
      card(本部-color, "本部", subway[蓟门桥])[
        #subway[蓟门桥] D 出口距离#本部-styled[本部]西北角仅 #qty[200][m]，是名副其实的学校地铁站，只是没有以校名命名而已。
      ],
      card(沙河-color, "沙河校区", [#subway[沙河高教园]\ #subway[沙河]])[
        两站距离#沙河-styled[沙河校区]西门均约 #qty[1][km]，日常生活均可使用。

        新生报到日当天，学校在#subway[沙河高教园] A 出口提供接驳服务，请新生选择该站下车。

        若计划不乘公共交通前往，请注意目的地应是#沙河-styled[沙河校区]南门，而非日常开放的西门。
      ],
    )
  }

  == 谁该阅读？

  本指南主要面向前往#沙河-styled[沙河校区]的新生，但途中经过#subway[蓟门桥]的方案同样适用于前往#本部-styled[本部]的同学。

  - 若你计划自驾抵京，则暂时不需要本指南，不过也可以读着玩玩。
  - 否则，若你计划在报到日当天抵京，则可全盘参考本指南中给出的方案。
  - 否则，若你计划提前抵京，或有在外住宿的需求，也可将本文的信息或方法论作为参考，辅助规划行程。
    - 题外话：笔者极不推荐在沙河镇住宿，请您发挥主观能动性，选择上地、回龙观或其他更合适的区域住宿。

  无论如何，报到日当天学校会在#subway[沙河高教园] A 出口提供接驳服务，我们的目的是乘公共交通前往这里，或打车直接前往校门。

  #show heading.where(level: 2): set heading(supplement: none, numbering: (
    ..nums,
  ) => [#(nums.pos().at(1) - 2).])

  == 购票

  本指南仅从到达时间、到达站点两方面给出一些注意事项。

  / 到达时间: 机场、火车站、北京地铁都并非 #qty[24][h] 运行，深夜的网约车也比白天贵得多。一般来说，即使并非报到当天抵京，也不推荐选择在深夜或凌晨抵达。考虑为可能的突发情况预留时间，推荐不要早于 7:00 或晚于 20:00 抵京。

  / 到达站点:


    / 火车（含动车组列车 / 高铁）: 在这个问题上通常没有多少选择的权利——铺设好的轨道限制了全国不同方向能到达的车站。你应打开国铁 12306 APP 或官网，搜索你的出发地到北京市的车次，查看有哪些到达站点可供你选择。需要特别指出的是，如果你能购买到达清河站的车票，那就不要考虑其他任何车站。否则，你可转到 #link(<route>)[\1. 在路上]查看不同车站的通勤方案并挑选。


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
      - 在自助售票机或售票窗口购买实体车票
      - 更多方式如刷银行卡等此处不赘述
    - 从站厅前往站台时，或者换乘时从站台前往另一个站台时，可尝试寻找或向工作人员询问电梯（含扶梯和直梯），避免携带大件行李步行上下台阶。
    - 大多数地铁线路有 2 个方向！例如，从#本部-styled[本部]到#沙河-styled[沙河校区]应该乘坐#get-subway(27)的*开往昌平西山口*方向。到达站台后不要理所当然地任选其中一个上车，先确认你的目标站点在哪一侧的列车上，防止坐反列车。
    - 有些车次可能不会走完线路的全程，例如#get-subway(27)有一部分*开往昌平西山口*方向的列车以#subway[朱辛庄]作为终点站。你可以在上车时就忽略它，也可以先上车，到#subway[朱辛庄]后下车原地换乘之后的班次。
  ][
    === 网约车（或出租车）

    - 网约车相比地铁的优劣都显而易见：优势在于方便、舒适、快捷，劣势在于价格相对较高。随着同行人数增加，网约车的价格劣势会减小。
    - 离开交通场站禁区后，可跟随带有“网约车”等字样的导视标识，前往*固定的网约车上车点*。
    - 选择上下车点位时注意精确。例如，上车时需要准确选择特定的地铁出口，前往学校应该选择#沙河-styled[沙河校区]*南门*。

    === 学校接站

    学校接站通知突然，且对学生的要求有些严苛（例如只有部分站点、部分时间，至多一位家人陪同），且我们无法对学校的运力代为作任何保证。

    因此，本指南不会涉及任何有关学校接站的内容。

    如果你幸运地享受到了接站服务，那么恭喜你——暂时不用忍受本指南的长篇大论了（不过你的家人在离开时可能还是得看一眼）。

    === 其他（城际铁路、公交、机场巴士等）

    本指南没有推荐其他公共交通方式，但它们中也不乏省心省力的通勤方案。如果你想使用它们，可以通过各种公开资源了解与制订计划，也可加入北邮交通爱好者群聊和大家交流。
  ]
][
  #show heading.where(level: 2): set heading(supplement: none, numbering: (
    ..nums,
  ) => [#(nums.pos().at(1) - 2).])

  #{
    set align(center)
    show: block
    set align(horizon)
    grid(
      columns: 2,
      column-gutter: 3em,
      figure(场站表),
      figure(
        image("/asset/simplified-beijing-subway.svg", width: 55em),
        caption: [北京地铁简化线路图，只保留了与本指南有关的车站。不能体现实际距离关系！],
      ),
    )
  }

  == 在路上 feat. #link("https://qm.qq.com/q/9j8bUgxmw")[北邮交通爱好者 (703789362）] <route>

  #let route(..args) = {
    args
      .pos()
      .enumerate()
      .map(((i, node)) => {
        if calc.even(i) {
          node
        } else {
          $stretch(->)^#pad(node, left: .1em, right: .5em)$
        }
      })
      .join(h(.25em))
  }

  以下，我们尽力提供了各评价维度下最优的的分场站方案，请搭配上图使用。经过人力查证，涉及到的地铁换乘均存在可全程避开台阶的通道或电梯（含扶梯和直梯）。

  带有下划线的站点（如 #subway(terminal-color: get-subway-color(27))[蓟门桥]）表示该站为对应标识色线路的始发站，在这里乘车可以保证有座位。

  *若你计划前往其他地方，也可参考以下经过验证的换乘*，并尽力避开 #(2, 4, 10, 13).map(get-subway).join(h(.25em)) 或其他修建较早的线路。

  计算花费时的 $n$ 表示人数。地铁价格恒定不变；网约车#ruby[和用时][价格]的波动与偶然性很大，以下数据为查询到的滴滴快车*最高价*（某周末晚高峰时），仅供参考。

  #let get-subway = get-subway.with(long: true)

  #set terms(spacing: 1em)

  #grid(columns: (1fr, 1fr), column-gutter: 3em)[
    / #cr[北京站]:
      - #route(
          subway[北京站],
          get-subway(2),
          subway[积水潭],
          get-subway(19),
          subway[北太平庄],
          get-subway(12),
          subway(terminal-color: get-subway-color(27))[蓟门桥],
          get-subway(27),
          subway(exit: "A")[沙河高教园],
        )
        - 纯地铁方案；花费 $7 n$ 元。
      - #route(
          cr[北京站],
          get-taxi(),
          [#subway(terminal-color: get-subway-color(27), exit: "B")[蓟门桥]],
          get-subway(27),
          subway(exit: "A")[沙河高教园],
        )
        - 折中方案；花费至多约 $6 n + 50$ 元。
      - #route(
          cr[北京站],
          get-taxi(),
          [#沙河-styled[沙河校区]南门],
        )
        - 纯网约车方案；花费至多约 125 元。

    / #cr[北京南站]:
      - #route(
          subway[北京南站],
          get-subway(14),
          subway[景风门],
          get-subway(19),
          subway[北太平庄],
          get-subway(12),
          subway(terminal-color: get-subway-color(27))[蓟门桥],
          get-subway(27),
          subway(exit: "A")[沙河高教园],
        )
        - 综合乘坐体验最佳且在这几个纯地铁方案中最快，但需换乘 3 次；花费 $7 n$ 元。
        - 在景风门需要耐心寻找并绕路乘坐 3 次电梯。如果愿意提着行李经过一小段台阶，则可跳过其中的 2 次，且不需绕路。
      - #route(
          subway[北京南站],
          get-subway(14),
          subway[永定门外],
          get-subway(8),
          subway[朱辛庄],
          get-subway(27),
          subway(exit: "A")[沙河高教园],
        )
        - 几乎坐穿整个 #get-subway(8)，可能有些许枯燥；花费 $7 n$ 元。
      - #route(
          subway[北京南站],
          get-subway(4),
          subway[人民大学],
          get-subway(12),
          subway(terminal-color: get-subway-color(27))[蓟门桥],
          get-subway(27),
          subway(exit: "A")[沙河高教园],
        )
        - 拥挤换省心；花费 $7 n$ 元。
        - 在 #subway[人民大学]换乘时，下 #get-subway(4, long: false) 列车后不要跟随标识下楼（需要手提行李经过漫长的台阶），而应乘电梯上楼到站厅寻找换乘通道。
      - #route(
          cr[北京南站],
          get-taxi(),
          [#subway(terminal-color: get-subway-color(27), exit: "B")[蓟门桥]],
          get-subway(27),
          subway(exit: "A")[沙河高教园],
        )
        - 网约车折中方案；花费至多约 $6 n + 60$ 元。
      - #route(
          cr[北京南站],
          get-taxi(),
          [#沙河-styled[沙河校区]南门],
        )
        - 纯网约车方案；花费至多约 150 元。

    / #cr[北京西站]:
      - #route(
          subway[北京西站],
          get-subway(9),
          subway[国家图书馆],
          get-subway(4),
          subway[人民大学],
          get-subway(12),
          subway(terminal-color: get-subway-color(27))[蓟门桥],
          get-subway(27),
          subway(exit: "A")[沙河高教园],
        )
        - 花费 $7 n$ 元。
        - 注意在#subway[国家图书馆]的换乘为同站台换乘，只需前往站台的对侧，不需要任何上下楼。
      - #route(
          subway(terminal-color: get-subway-color(7))[北京西站],
          get-subway(7),
          subway[珠市口],
          get-subway(8),
          subway[朱辛庄],
          get-subway(27),
          subway(exit: "A")[沙河高教园],
        )
        - 绕路换省心，几乎坐穿整个 #get-subway(8)，可能有些许枯燥；花费 $7 n$ 元。
      - #route(
          cr[北京西站],
          get-taxi(),
          [#subway(terminal-color: get-subway-color(27), exit: "B")[蓟门桥]],
          get-subway(27),
          subway(exit: "A")[沙河高教园],
        )
        - 网约车折中方案；花费至多约 $6 n + 35$ 元。
      - #route(
          cr[北京西站],
          get-taxi(),
          [#沙河-styled[沙河校区]南门],
        )
        - 纯网约车方案；花费至多约 150 元。

    / #cr[北京丰台站]:
      - #route(
          subway[丰台站],
          get-subway(16),
          subway[苏州桥],
          get-subway(12),
          subway(terminal-color: get-subway-color(27))[蓟门桥],
          get-subway(27),
          subway(exit: "A")[沙河高教园],
        )
        - 花费 $7 n$ 元。
      - #route(
          subway[丰台站],
          get-subway(10),
          subway[西土城],
          get-subway(27),
          subway(exit: "A")[沙河高教园],
        )
        - 拥挤换省心；花费 $7 n$ 元。
  ][

    / #cr[清河站]:
      - #cr[清河站]是到学校（两校区都）最方便的车站。如果你能买到停靠清河站的车票，就不要考虑其他任何车站。
      - #route(
          subway[清河站],
          get-subway(27),
          subway(exit: "A")[沙河高教园],
        )
        - 纯地铁方案；花费 $5 n$ 元。

    / #cr[北京北站]:
      - 如果你能买到终到#cr[北京北站]的车票，那你一定能买到停靠#cr[清河站]的车票。请避开令人沮丧的#cr[北京北站]；必要时可以买长乘短，在#cr[清河站]提前下车。
      - #route(
          subway(terminal-color: get-subway-color(13))[西直门],
          get-subway(13),
          subway[清河站],
          get-subway(27),
          subway(exit: "A")[沙河高教园],
        )
        - 纯地铁方案；花费 $6 n$ 元。

    / #cr[北京朝阳站]:
      - #route(
          subway[北京朝阳站],
          get-subway(3),
          subway(terminal-color: get-subway-color(12))[东坝北],
          get-subway(12),
          subway(terminal-color: get-subway-color(27))[蓟门桥],
          get-subway(27),
          subway(exit: "A")[沙河高教园],
        )
        - 非常省心的纯地铁方案，两次换乘都是都为始发站；花费 $7 n$ 元。
      - #route(
          cr[北京朝阳站],
          get-taxi(),
          [#沙河-styled[沙河校区]南门],
        )
        - 纯网约车方案；花费至多约 125 元。

    / #cah[首都机场 2 号航站楼 / 3 号航站楼 (PEK T2 / T3)]: 你可检查航司有无赠送 #get-subway(34) 免费乘车券或折扣券，这能抵扣下面提到的所有费用的 $25 n$ 部分。
      - #route(
          [#cah[PEK] T2 / T3],
          get-taxi(),
          [#沙河-styled[沙河校区]南门],
        )
        - 对于 PEK 降落，非常推荐网约车直达学校；T2 和 T3 分别花费至多约 120 或 150 元。
      - #route(
          [#cah[PEK] T2 / T3],
          get-taxi(),
          subway(exit: "A")[孙河],
          get-subway(15),
          subway[六道口],
          get-subway(27),
          subway(exit: "A")[沙河高教园],
        )
        - 折中但可能最便宜的方案；花费至多约 $7 n + 35$ 元。
        - 这种打车方式可能引起网约车司机不满。他可能为了进机场接大单而排了很久队，而你只打车到了几公里外的地方，这会导致他浪费大量时间，利益受损。
      - #route(
          [#subway[2 号航站楼] / #subway[3 号航站楼]],
          get-subway(34),
          subway[三元桥],
          get-subway(12),
          subway(terminal-color: get-subway-color(27))[蓟门桥],
          get-subway(27),
          subway(exit: "A")[沙河高教园],
        )
        - 纯地铁方案，机场线很贵；花费 $25 n + 7n$ 元。
        - 不要在#subway[三元桥]为了更近的换乘改乘 #get-subway(10)。你欠下的一切会 #get-subway(10, long: false) 列车上和#subway[西土城]如数奉还。

    / #cah[大兴机场 (PKX)]: 你可检查航司（尤其南航/CZ、东航/MU、国航/CA）有无赠送 #get-subway(35) 免费乘车券或折扣券，这能抵扣下面提到的所有费用的 $35 n$ 部分。
      - #route(
          subway[大兴机场],
          get-subway(35),
          subway[草桥],
          get-subway(19),
          subway[北太平庄],
          get-subway(12),
          subway(terminal-color: get-subway-color(27))[蓟门桥],
          get-subway(27),
          subway(exit: "A")[沙河高教园],
        )
        - 纯地铁方案，机场线很贵；花费 $35 n + 7 n$ 元。
        - 这 4 条线路几乎是目前#subway[北京地铁]乘坐体验最佳的 4 条热门线路。PKX 到#沙河-styled[沙河校区]的距离是 PEK 的 2 倍以上，但全程公共交通的耗时却相差无几，即有它们的功劳。
      - #route(
          subway[大兴机场],
          get-subway(35),
          subway[草桥],
          get-subway(19),
          subway[牡丹园],
          get-taxi(),
          [#沙河-styled[沙河校区]南门],
        )
        - 折中方案，机场线很贵；花费 $35 n + 5 n + 70$ 元。
      // - #route(
      //     cah[PKX],
      //     get-taxi(),
      //     [#subway(terminal-color: get-subway-color(8), exit: "B")[瀛海]],
      //     get-subway(8),
      //     subway[朱辛庄],
      //     get-subway(27),
      //     subway(exit: "A")[沙河高教园],
      //   )
      //   - 几乎只适合想要挑战坐穿整个 #get-subway(8) 的人，非常枯燥；花费至多约 $8 n + 105$ 元。
      - #route(
          cah[PKX],
          get-taxi(),
          [#沙河-styled[沙河校区]南门],
        )
        - 不太推荐全程打车：PKX 到#沙河-styled[沙河校区]驾车路程有整整 #qty($80 ~ 100$)[km]，这导致打车价格超乎寻常地贵，且波动极大；花费至多约 350 元。
  ]
]
