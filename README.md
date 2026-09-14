# BUPT-freshatlas

灵光一现写出来的东西，不知不觉规模就大到应该公开了。

欢迎大家一起来贡献内容。

排版比较复杂，数据全在 `.typ` 里放着，因为一开始就没好好写所以代码质量不是很高，请见谅。

## 获取

在 [Releases](https://github.com/ArtveFlinaInBupt/freshatlas/releases) 中下载。

## 构建

### 依赖

- [Typst](https://github.com/typst/typst) 0.15.1
- GNU Make
- 字体（也可在 GitHub Actions workflow file 中自行找到）
  - 衬线体
    - 简体中文：[思源宋体 (Source Han Serif SC)](https://github.com/adobe-fonts/source-han-serif)
    - 西文：[STIX Two Text](https://github.com/stipub/stixfonts)
  - 非衬线体：[思源黑体 (Source Han Sans SC)](https://github.com/adobe-fonts/source-han-sans)
  - 数学：[STIX Two Math](https://github.com/stipub/stixfonts)
  - 等宽：[Fira Code](https://github.com/tonsky/FiraCode)
  - 图标：[Font Awesome](https://github.com/fortawesome/font-awesome)

### 编译

```bash
git clone git@github.com:ArtveFlinaInBupt/freshatlas.git
cd freshatlas
make
# 所有产物会在 `out/` 目录下
```

### FAQ

- 为什么只用宋体？太细了看着不舒服！
  1. 我们难以解决与思源黑体协调的美观的西文非衬线体的使用许可问题；
  2. 作者感觉这样比全文黑体好看。

- 为什么没有海南校区的宿舍信息？
  - 目前没有可靠的信息来源。若您能调研得到完整可靠信息，欢迎提供。

## Licensing

若需修改或二次创作，请自行阅读源码。

- 源码采用 [GPL v3](https://www.gnu.org/licenses/gpl-3.0.html) 协议。
- PDF、图片等产物采用 [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) 协议。
- 简化版北京地铁线路图使用[地铁线路图绘制器](https://railmapgen.org/)绘制。

## 已知问题

- Typst 编译报 warning：
  
  ```
  warning: glyph has assembly parts with overlap less than minConnectorOverlap
   = hint: its rendering may appear broken - this is probably a font bug
   = hint: please file an issue at https://github.com/typst/typst/issues
  ```

  该问题早已 filed issue at [typst/typst #7999](https://github.com/typst/typst/issues/7999) 并在 20 分钟内被直接 close。Typst 的 maintainer 认为这是字体问题，但他们并未在 0.15 中更改编译器的 warning 行为或文本。
