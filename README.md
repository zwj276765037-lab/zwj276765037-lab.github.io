# 卓文俊 · 个人网站

奶油纸底 + 深蓝「监控画面」六面体。一个 `index.html`，没有框架、没有构建、没有追踪脚本。

线上地址：<https://zwj276765037-lab.github.io/>

---

## 页面结构

| 页面 | 内容 |
|---|---|
| `#home` | 名字、可拖动的自我标签墙、3D 六面体（拖拽旋转、越正面越清晰）、三张板块卡片、About |
| `#research` | 研究简介 + 研究平台 + 三块内容（BAPE 论文、ScaleLLM、持续更新 ing） |
| `#log` | 训练日历（按月切换、训练容量 + 部位色块）+「游玩」板块（建设中） |
| `#notes` | 思考与随笔（建设中） |
| `#contact` | Gmail / 邮箱 / GitHub |

中英双语：右上角 **EN / 中文** 切换，选择存在浏览器里。

## 目录

```
index.html            全部页面与数据（含六面体贴图，约 690KB）
assets/fonts/         MiSans 字体分片（result.css + woff2）
assets/tags/          标签图标的源图（页面里已内嵌 base64）
素材/                 原始照片与素材（不进仓库）
_dev/                 开发辅助脚本与截图（不进仓库）
```

## 更新内容

### 标签墙

页面里按 `Shift + E`（或网址后加 `?edit=1`）进入编辑：

- 拖动贴纸改位置，点选后改文字 / 介绍 / 颜色 / 形状 / 角度
- 右下角「＋ 新标签」加一张；工具条里可加星星、爱心、闪光、胶带
- 「保存」写到浏览器 localStorage，并下载一份 `zhuo-tags.json` 备份
- 改坏了点「恢复」退回上一版

访客看到的永远是只读版本。

### 文字内容

研究、下班后、思考、关于、联系这些文案直接改 `index.html` 里的文本；中英两份分别存放在同一个元素的 `data-zh` 与 `data-en` 属性里：

```html
<p data-zh="中文文案" data-en="English copy">中文文案</p>
```

新增一句带换行的说明用 `data-zh-html` / `data-en-html`。

### 训练日历

数据在脚本里的 `LOG` 对象，按 `YYYY-MM` → 日期 → `[容量, [部位...]]`：

```js
'2026-10': {
  1: ['4860', ['臀部', '腿']],
  2: ['8102.5', ['胸', '二头']],
  ...
}
```

部位配色在 `GROUP_C`，英文名在 `GROUP_EN`。

## 本地预览

直接双击 `index.html` 即可；或者在目录里起一个静态服务器：

```bash
python -m http.server 8765
# 打开 http://127.0.0.1:8765/
```

## 发布到 GitHub Pages

```bash
git add -A
git commit -m "更新"
git push
```

仓库：`zwj276765037-lab/zwj276765037-lab.github.io`（用户主页仓库）。
首次部署：仓库 **Settings → Pages → Deploy from a branch → main / (root)**，之后每次 push 会自动更新。

## 注意

- 六面体的贴图是 base64 内嵌在 `index.html` 里的，换图需要重新生成（约 500KB）
- 字体是 MiSans 全量分片（约 15MB），首次加载会慢一点
- `assets/tags/`、`素材/`、`_dev/` 不参与页面渲染
