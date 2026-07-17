#import "/template/style.typ": show-body
#import "/template/util.typ": fancy, ruby, tcell

#import "model/icon.typ": cr, cah, subway
#import "model/campus-cell.typ": 本部-styled, 沙河-styled
#import "model/subway.typ": get-subway, get-subway-color

#let tint = get-subway-color(27)

#show: show-body.with(tint: tint)
#set page(width: 60em)

#let 场站表 = {
  let columns = (
    站名: (align: center + horizon, width: auto),
    // 简称: (align: center + horizon, width: auto),
    介绍: (align: left + horizon, width: 30em),
  )
    .pairs()
    .enumerate()
    .map(((i, (k, v))) => (k, v + (x: i)))
    .to-dict()
  let name = tcell.with(x: columns.站名.x)
  // let short = tcell.with(x: columns.简称.x)
  let description = tcell.with(x: columns.介绍.x)

  table(
    align: (x, y) => if y == 0 { center + horizon } else { columns.values().at(x).align },
    columns: columns.values().map(it => it.width),
    table.header(..columns.keys().map(strong)),

    name(cr[北京站]),
    // short(cr[北京站]),
    description[
      从东北地区及京哈铁路、京沪铁路沿线开来的部分列车到达本站。

      出站后可换乘地铁#get-subway(2)号线。
    ],

    name(cr[北京南站]),
    // short(cr[南站]),
    description[
      从京沪高铁、京津城际及相关线路沿线开来的列车通常到达本站。

      出站后可换乘地铁#get-subway(4)号线、#get-subway(14)号线。
    ],

    name(cr[北京西站]),
    // short(cr[西站]),
    description[
      从京广高铁、京广铁路、京九铁路及其连接线路沿线开来的许多列车到达本站。

      出站后可换乘地铁#get-subway(7)号线、#get-subway(9)号线。
    ],

    name(cr[清河站]),
    // short(cr[清河站]),
    description[
      从京张高铁沿线开来的部分列车到达本站。

      出站后可换乘地铁#get-subway(13)号线、#get-subway(27)。
    ],

    name(cr[北京北站]),
    // short(cr[北站]),
    description[
      从京张高铁沿线开来的部分列车到达本站。

      出站后可前往西直门站，换乘地铁#get-subway(2)号线、#get-subway(4)号线和#get-subway(13)号线。

      若您的目的地是#沙河-styled[沙河校区]，请尽可能选择在#cr[清河站]而非#cr[北京北站]下车；否则，您不仅需要在缺少无障碍设施的#cr[北京北站]和#subway[西直门站]辗转换乘，最后还要乘地铁折返回#subway[清河站]。
    ],

    name(cr[北京朝阳站]),
    // short(cr[朝阳站]),
    description[
      从京哈高铁沿线开来的列车通常到达本站。

      出站后可换乘地铁#get-subway(3)号线。
    ],

    name(cr[北京丰台站]),
    // short(cr[丰台站]),
    description[
      从京广高铁，以及京广、京九、丰沙等普速铁路沿线开来的部分列车到达本站。

      出站后可换乘地铁#get-subway(10)号线、#get-subway(16)号线。
    ],

    name(cah[北京首都国际机场\ (PEK)]),
    // short[PEK],
    description[
      PEK 2 号和 3 号航站楼均可换乘#get-subway(34)。

      若您经由 PEK 前来，建议优先考虑网约车而非地铁。
    ],

    name(cah[北京大兴国际机场\ (PKX)]),
    // short[PKX],
    description[
      抵达后可乘#get-subway(35)前往#subway[草桥站]，并换乘地铁#get-subway(10)号线或#get-subway(19)号线。

      若您经由 PKX 前来，可检查机票是否赠送#get-subway(35)免费乘车券或折扣券，这至多能节省单程 35 元/人的交通费用。
    ],
  )
}

= 柏油 · #text(fill: tint)[通勤]

注意到#get-subway(27)的南端蓟门桥站紧邻我校#本部-styled[本部]，且短期内没有继续南延的计划。这给我校师生的出行带来了极大便利，也让#get-subway(27)几乎成为了我校的摆渡车。让我们赞美北京地铁。

以下通勤方案虽主要面向前往#沙河-styled[沙河校区]的新生，但其中抵达#get-subway(12)和#get-subway(27)蓟门桥站之前的地铁部分，同样适用于前往#本部-styled[本部]的同学。

#align(center, fancy(((3, 12, 13, 9, 8, 4, 10, 2, 35, 18, 34, 19, 27).map(get-subway-color)))[
  今夏将更新各交通场站前往柏油沙河校区的通勤指南，敬请期待。

  彩蛋：本框中有北京地铁哪些线路的主题色？
])

#align(center, fancy((red, red))[
  下方内容仍在施工中，未经校对且可能较为流水账，请谨慎参考。
])

== 新生通勤指南

本指南所讨论的通勤场景是报到日当天乘公共交通到达北京，自某一公共交通场站开始通勤，并最终抵达我校#沙河-styled[沙河校区]南门，或其附近的地铁沙河高教园站。学校将会在报到日当天提供地铁沙河高教园站到#沙河-styled[沙河校区]南门的接驳服务。

讨论的通勤方案将优先考虑#ruby[携带大件行李][无障碍]、#ruby[有家人陪同][多人通勤]等需求，统筹地铁和网约车（出租车）两种交通方式，尽量避免步行、共享单车、公交、京雄城际、机场巴士等对大件行李不友好，或初次使用时心智负担较高的交通方式。

若您计划早于#ruby[允许校内住宿日][报到日]抵达北京，您也可将下面的信息或方法论作为参考，辅助规划行程。不过，笔者极不推荐在沙河镇住宿，请您发挥主观能动性，选择上地、回龙观或其他更合适的区域住宿，并在报到日当天自行安排交通前往学校。

=== 主要交通场站

#figure(场站表)

考虑到通勤不便等因素，请尽量不要选择经由表中未列出的北京东站、北京通州站等场站前来。
