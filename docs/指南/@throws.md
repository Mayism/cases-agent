---
title: @throws
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-arktsdoc-throws
category: 指南
updated_at: 2026-03-13T04:48:28.170Z
---

# @throws

@throws标签用于函数，记录函数可能引发的错误。可以在一个ArkTSDoc注释中多次使用@throws标记。

## 语法

@throws description

## 示例

使用带有描述的 @throws 标记：

```javascript
/**
 * @throws Will throw an error if the argument is null.
 */
export function bar(x: number) {
  throw new Error();
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-arktsdoc-throws*