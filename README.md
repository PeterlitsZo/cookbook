# Cookbook

(The project is using Chinese only)

## 这是什么？

这是 Peterlits 的 cookbook。使用 LaTeX 编写。

## 构建

使用下面命令来完成构建：

```bash
make build
```

它依赖 TeXLive（或者其他你喜欢的 TeX 发行版）。如果编译结果不符合预期时，请再运行一次 `make build`（例如，生成目录需要依赖上一次 `make build` 的产物）。

## 其他

截止目前，图像都使用 D3 这个 JavaScript 库来在 DOM 中渲染。在文档中我会将结果保存在 `src/static` 中，并使用 `resvg` 工具来将 SVG 图像处理为 PNG 图像。
