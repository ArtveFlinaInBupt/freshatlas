#import "/template/util.typ": *
#import "/template/style.typ": show-body

#import "model/color.typ": level-color, placement-color, unknown-color

#let tint = placement-color

#show: show-body.with(tint: tint)

#let unknown = text.with(fill: unknown-color)
#let placement = text.with(fill: placement-color)
#let level = text.with(fill: level-color)

#let quest = unknown[?]
#let 两者 = box(context {
  let body = [两者]
  let (width, height) = measure(body)
  text(
    fill: gradient.linear(placement-color, level-color, angle: -calc.atan(width / height)).sharp(2),
    body,
  )
})

#set page(width: 60em)

= 柏油 · #text(fill: tint)[入学考试]

#placement[入学考试]在大一入学前后举行，近年通常开学前线上进行。，项目仅包含#box(stroke: (bottom: .5pt), outset: (bottom: .2em))[英语]，题型与英语四级（CET-4）的客观题部分相似。

一般认为#placement[入学考试的结果]与#level[第一学期四级报名资格和英语教学分级]有相关性。#placement[考]后一般不公布#placement[分数与排名]，公布#level[四级资格]名单，并在#level[英语课分班]上体现#level[分级]结果。

另注：虽然一般认为#{ 两者 }有关，但是由于#placement[考试结果]的黑箱性质，没有确凿的证据表明#{ 两者 }存在依据或唯一依据关系。事实上，在 23 级以前，部分专业会根据每个同学的高考数学成绩在省内的排名直接指派选修数学分析或高等数学。一方面既已有此先例，另一方面线上考试形式不太严肃，我们认为#level[后者]可能也会参考高考英语成绩。

#figure(table(
  columns: 7,
  inset: (x: 1em, y: .5em),

  // @typstyle off
  table.header(
    tcell(rowspan: 2)[*年级*],
    tcell(rowspan: 2)[*考试形式*],
    tcell(rowspan: 2)[#level[*第一学期\ 四级资格*]],
    tcell(colspan: 4)[#level[*英语课分班形式*]],
    [大部分专业],
    [元班],
    [国际学院],
    [玛丽女王海南学院],
  ),

  [19 级],
  [线下纸笔],
  [前 1000 名],
  [
    大部分进入普通班 \
    倒数若干名单开班 \
  ],
  tcell(rowspan: 3)[#text(fill: gray)[尚未成立]],
  tcell(rowspan: 5)[不分班#quest],
  tcell(rowspan: 3)[#text(fill: gray)[尚未成立]],

  [20 级], [没考！], [全都不许考], [不分班],

  [21 级], [线下纸笔], tcell(rowspan: 5)[前 1000 名], tcell(rowspan: 2)[ABCD 班],

  [22 级],
  tcell(rowspan: 4)[线上机考],
  tcell(rowspan: 2, text(fill: gray)[混乱\ 无参考价值]),
  tcell(rowspan: 4)[不分班\ 且全员有四级资格\ 因此考试毫无作用],

  [23 级], [ABC 班],

  [24 级],
  tcell(rowspan: 2)[AB 班],
  tcell(rowspan: 2)[AB 班\ （单独分班）],
  tcell(rowspan: 2)[ABC 班],

  [25 级],

  [26 级], tcell(colspan: 6)[#quest],
))

必须指出，虽然#level[分级教学]客观存在，但#level[其]出发点和结果均非限制同学们的学习资源和分数——完全没有必要担心#level[分级]结果对自己未来的影响（实际上确实不会产生什么影响）。

英语课只占学习生活中微不足道的一部分，请同学们保持平常心，积极投入到更广阔的大学生活中去。
