#import "/template/util.typ": *

#import "color.typ": BUPT-VI-color
#import "campus-cell.typ": 沙河-styled

#let freshman-hint = [
  #show: align.with(center)
  #show: fancy.with((green, olive, teal, blue))
  #show: align.with(left)

  #align(center, text(
    size: 1.25em,
    [#datetime.today().display("[year]") 开学季 Special：*本科新生相关的信息*],
  ))

  - 欢迎 2026 届新生加入没有诈骗的 QQ 新生群 1078311315 与贴吧群 991769113，与学长学姐们和其他新生交流。
  - 欢迎新生阅读文档#link("https://bupt-bump.feishu.cn/wiki/KNqbw7weriDZLwkyHuycnxlbndd")[柏油本科新生年经问题 Q&A]。

  // - 关于户型、家具参数

  //   - *据猜测*，26 级本科新生将会入住#沙河-styled[沙河校区]上床下桌 4 人间。如有更新的情况，本材料会及时跟进。
  //     - 25 级学长学姐们对宿舍怨言很大，因为他们被学校阴了一手，成为了 2018 年至今唯一一届不住上床下桌 4 人间的新生。
  //     - 目前 25 级已经进行了 6 改 4 进程，#沙河-styled[沙河校区]目前没有空置的 6 人间。
  //     - 25 级寝室被临时改造为 6 人间的消息在#backlink("https://github.com/ArtveFlinaInBupt/dormitory/releases/tag/v250703")[本材料 2025 年 7 月 3 日公开发布的历史版本]中已有记载#super[（也可能更早就有，但是我最早只能找到这个版本的存档了！）]，不存在隐瞒和岁月史书，请相信我们。
]
