#import "/template/util.typ": *

#import "color.typ": BUPT-VI-color

#let freshman-hint = [
  #show: align.with(center)
  #show: fancy.with((green, olive, teal, blue))
  #show: align.with(left)

  #align(center, text(
    size: 1.25em,
    [#datetime.today().display("[year]") 开学季 Special：*本科新生相关的信息*],
  ))

  - 欢迎 2026 届*考生*加入（没有诈骗的）QQ 新生群 #(1078311315, 198716287, 991769113).map(str).join("，", last: " 与 ")，与学长学姐们交流。我们希望交流停留在同龄人之间，因此*谢绝家长加入。*

  - 关于户型、家具参数

    - *据猜测*，26 级本科新生将要继承回迁本部的 24 级的宿舍，入住沙河雁北上床下桌 4 人间。如有更新的情况，本材料会及时跟进。
      - 25 级学长学姐们对宿舍怨言很大，因为他们被学校阴了一手，已经在雁南 6 人间住了一年；但是就目前的蛛丝马迹看来 26 级不会步其后尘。
      - 25 级入住当时还不存在的 6 人间的消息在#link("https://github.com/ArtveFlinaInBupt/dormitory/releases/tag/v250703")[本材料 2025 年 7 月 3 日公开发布的历史版本]中已有记载#super[（也可能更早就有，但是我最早只能找到这个版本的存档了！）]，不存在隐瞒和岁月史书，所以请相信我们。

    - 宿舍普通床铺尺寸一般在 $#qty($(185 ~ 192)$)[cm] times #qty[90][cm]$ 左右，也有少量加长床。

      - 我们建议录取后向自己的辅导员询问具体尺寸数值，届时再考虑床品的置备。本材料也会持续跟进。

  // - 宿舍原则上#super[（“原则上”是什么意思呢？）]不允许安装不透明床帘。若需购买安装，建议到校实地体验并测量尺寸后再决定。
]
