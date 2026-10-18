# 卓文俊 · 个人网站

一个单页静态站。没有框架、没有构建步骤、没有追踪脚本。
`index.html` 一个文件 ＋ `assets/` 里一张照片，就是全部。

线上地址（配好之后）：`https://zwj276765037-lab.github.io/`

---

## 这个网站有什么

| 区块 | 内容 | 改哪里 |
|---|---|---|
| 首屏 | 一句话：在 FPGA 上把乘法换成查表 | `class="statement"` 那段 |
| 10 秒认识我 | 四条按时间排的事实 | `class="facts"` 里四个 `<div>` |
| 10 分钟认识我 | 指向「关于」的一句话 | 全文 |
| 在读的东西 | 论文和板子两件事 | 第二个 `class="facts"` |
| 技术笔记 | 三篇论文向的文章（都还没发） | `class="posts"` |
| 随笔 | 研究之外的三件想写的小事 | `class="jot"` |
| 关于 | 一段自我介绍 ＋ 照片 | `id="about"` |
| 怎么找我 | 邮箱、GitHub、DOI、单位 | `class="contact"` |

## 怎么加一篇文章

**技术笔记**（`class="posts"` 里）——复制这段，粘到最前面，改文字：

```html
<article>
  <h3>标题</h3>
  <p>一句话说清这篇在讲什么。</p>
  <span class="st"><em>草稿</em>，还没发</span>
</article>
```

发出来了就把那行状态换成日期：`<span class="st">2026-11</span>`，并把 `h3` 换成链接 `<a href="...">标题</a>`。

**随笔**（`class="jot"` 里）——复制这段：

```html
<article>
  <h3><span class="when">2026-11</span>标题</h3>
  <p>第一段。想写多长写多长，这一段可以整段替换成正文。</p>
</article>
```

写够多了，就别再往这一页塞了——把 `随笔` 拆成 `/notes/` 目录下的独立页面，
`index.html` 里只留最近三条。到那一步告诉我，我帮你改结构。

## 怎么发布到 GitHub Pages

第一次：

```bash
git init
git add .
git commit -m "site: first version"
git branch -M main
git remote add origin https://github.com/zwj276765037-lab/zwj276765037-lab.github.io.git
git push -u origin main
```

然后到 GitHub 仓库页：**Settings → Pages → Build and deployment**
- Source 选 `Deploy from a branch`
- Branch 选 `main`，目录 `/ (root)`
- 保存，等一两分钟，`https://zwj276765037-lab.github.io/` 就有了

以后改完：

```bash
git add -A && git commit -m "更新随笔" && git push
```

> 仓库名必须是 `zwj276765037-lab.github.io` 才是根地址。
> 叫别的名字（比如 `site`）也能用，地址会变成 `https://zwj276765037-lab.github.io/site/`。

## 字体说明

中文正文字体用的是 Google Fonts 的 Noto Serif SC，**国内访问可能很慢**。
如果发现打开时字先是宋体、过两秒才变，把字体文件下载下来自托管：

1. 从 [Google Fonts](https://fonts.google.com/noto/specimen/Noto+Serif+SC) 下载，或用 [google-webfonts-helper](https://gwfh.mranftl.com/fonts) 取 woff2
2. 放到 `assets/fonts/`，把 `index.html` 里那段 `<link href="https://fonts.googleapis.com/...">` 换成 `@font-face`
3. 中文全字库很大（几 MB），建议只打包 400/700 两个字重，或按页面上实际出现的字做子集

## 本地看一眼

双击 `index.html` 就行。要更接近线上效果，在这个目录开个服务：

```bash
python -m http.server 8000
# 然后浏览器打开 http://localhost:8000
```

## 目录

```
index.html                  线上页面（全部内容都在这一个文件里）
assets/portrait-pixel-1x.png 像素人像的原图（112×131，靠 CSS 放大显示）
_design/                    设计过程：方向稿、参考截图、原图、生成脚本、论文 PDF（不进仓库）
`

## 首屏那张像素人像

不是画的，是从照片转的：

1. 从自拍里抠掉背景（泛洪 + 最大连通块 + 补洞）
2. 缩到 **112×131** 像素，映射到 12 色固定色板（纸、墨、皮肤三级、头发两级、衬衫蓝两级、眼白）
3. 去掉孤立像素

网页里用 image-rendering: pixelated 显示：

- 桌面宽 **448px = 112 × 4**，正好 4 倍，像素是方的
- 手机宽 **336px = 112 × 3**，正好 3 倍

**要改成别的倍数也行，但必须是整数倍**，否则像素会被重采样、边缘发虚。

交互：鼠标在图上移动时整张微微转动（±6° / ±4.5°），光斑跟着鼠标走，悬停时出现扫描线；
触屏和 prefers-reduced-motion 下自动关掉。

换照片重新生成：把新照片丢进 _design/，然后

`ash
python _design/.tmp/pixel4.py       # 抠图 + 像素化
python _design/.tmp/pixel_clean.py  # 清理 + 裁边
`

（或者直接把照片发我，我出一版。）``

`_design/` 已经在 `.gitignore` 里，不会推到 GitHub。想连设计过程一起备份，
把 `.gitignore` 里那行删掉再提交即可。
