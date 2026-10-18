# 卓文俊 · 个人网站

结构照 ashton.is 复刻：一张白纸、超大字号、身份轮播、居中的一句话、16:10 作品格、三栏页脚、深浅色切换。
**内容、图片、文字全部是你自己的**——没有搬对方任何素材。

`index.html` ＋ `assets/` 就是全部，没有框架、没有构建、没有追踪脚本。

---

## 页面结构

| 区块 | 里面是什么 | 改哪里 |
|---|---|---|
| 顶栏 | 工作 / 关于 / 联系 / 深浅色切换，滚动后压扁成 58px | `<header>` |
| 首屏 | `卓文俊是` ＋ 一行轮播的身份（6 个），右下角圆点＋暂停 | `#role`、脚本里的 `roles` 数组 |
| 陈述 | 居中的两行大字 ＋ 地点 | `.intro` |
| 作品 | 2×2 的 16:10 图卡，带标题和一行状态 | `.grid` 里四个 `.item` |
| 页脚 | 左边身份、中间邮箱、右边导航与链接，底部版权 | `<footer>` |

## 怎么改（搜 ✏️）

index.html 里所有要改的地方都标了 **✏️**，在编辑器里搜这个符号就能跳到：

| 编号 | 位置 | 改什么 |
|---|---|---|
| 1 | 顶栏 | 工作 / 关于 / 联系 |
| 2 | 首屏第一行 | 名字（现在是「卓文俊是」） |
| 3 | ar roles | 6 句身份，增删都行，圆点自动跟着变 |
| 4 | 陈述段 | 一句主张 ＋ 一行地点 |
| 5 | 作品格 | 现在是 4 个空位；按注释里那段 <a class=item> 替换，图 16:10 |
| 6 | 页脚 | 身份、邮箱、链接、版权 |
| 7 | :root | 深浅色那几组颜色值 |

放图片：丢进 ssets/work/，在 <img src=...> 里写文件名即可。

**改身份轮播**：找脚本里的这一行，增删引号里的词就行，圆点会自动跟着变。

```js
var roles = ['一个研究者。', '一个硕士生。', '一个写 RTL 的人。', '一个像素画作者。', '一个广州人。', '一个在把乘法换成查表的人。'];
```

**加一件作品**：复制一个 `.item`，换图和文字。图的比例是 **16:10**（建议 1160×726 或 580×363），不按这个比例会被裁切。

```html
<a class="item" href="#">
  <figure><img src="assets/work/新图.png" alt="描述"></figure>
  <figcaption><b>标题</b><span>类型 · 时间</span></figcaption>
</a>
```

**换主题色**：只改 `:root` 里那几行变量（`--ink`、`--paper`、`--soft`、`--muted`）。

## 深浅色

右上角的按钮切换，选择存在 localStorage 里，下次打开还是上次的。
暗色是 `#0d0d0d` 底、`#f2f2f2` 字，和原站同一套数值。

## 字体

拉丁文用 Inter（Google Fonts），中文回落到系统字体（PingFang SC / 微软雅黑）。
**国内打开 Google Fonts 会慢**，要彻底解决就把 Inter 换成自托管 woff2，或者干脆只用系统字：

```css
font-family: "PingFang SC","Hiragino Sans GB","Microsoft YaHei","Noto Sans SC",sans-serif;
```

## 发布到 GitHub Pages

```bash
git add -A && git commit -m "改版" && git push
```

首次部署：仓库 **Settings → Pages → Deploy from a branch → main / (root)**。
仓库名用 `zwj276765037-lab.github.io` 才是根地址。

## 目录

```
index.html     线上页面
assets/
  work/        作品格的图（现在是空的，只放了一个说明文件；你把图丢进来即可）
  portrait-pixel-*.png   旧版页面的像素人像，可留可删
_design/       设计过程、参考站截图、旧版页面、生成脚本（不进仓库）
```

旧版（暖纸 + 像素人像那套）留在 git 里：

```bash
git log --oneline
git checkout <commit> -- index.html    # 想退回某一版
```
