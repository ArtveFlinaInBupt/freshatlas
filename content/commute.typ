#import "/template/style.typ": show-body
#import "/template/util.typ": fancy

#import "model/subway.typ": get-subway, get-subway-color

#let tint = get-subway-color(27)

#show: show-body.with(tint: tint)

= 柏油 · #text(fill: tint)[通勤]

#show: align.with(center)

#fancy(sharped: true, ((2, 3, 4, 8, 9, 10, 12, 13, 18, 19, 27, 34, 35).map(get-subway-color)))[
  今夏将更新各交通场站前往柏油沙河校区的通勤指南，敬请期待。

  彩蛋：本框中有北京地铁哪些线路的主题色？
]
