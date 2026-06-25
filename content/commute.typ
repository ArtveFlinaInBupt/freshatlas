#import "/template/style.typ": show-body
#import "/template/util.typ": fancy

#import "model/campus-cell.typ": 本部-styled, 沙河-styled
#import "model/subway.typ": get-subway, get-subway-color

#let tint = get-subway-color(27)

#show: show-body.with(tint: tint)

= 柏油 · #text(fill: tint)[通勤]

注意到#get-subway(27)的南端（蓟门桥站）是我校#本部-styled[本部]且短期内没有任何南延计划。

这给我校的出行带来了极大的便利，同时让#get-subway(27)几乎成为了我校摆渡车的存在。让我们赞美北京地铁。

以下通勤方案虽目标为前往#沙河-styled[沙河校区]的新生，但若只关注地铁方案到达#get-subway(12)和#get-subway(27)蓟门桥站之前的部分，同样也适用于前往#本部-styled[本部]的同学。

#align(center, fancy(((3, 12, 13, 9, 8, 4, 10, 2, 35, 18, 34, 19, 27).map(get-subway-color)))[
  今夏将更新各交通场站前往柏油沙河校区的通勤指南，敬请期待。

  彩蛋：本框中有北京地铁哪些线路的主题色？
])
