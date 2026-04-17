---
title: {@link}
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-arktsdoc-link
category: 指南
updated_at: 2026-03-13T04:48:59.179Z
---

# {@link}

{@link} 用于创建指向指定namepath或网页的链接。使用 {@link} 标记时，可以使用不同格式提供链接文本。

## 语法

-   {@link namepathOrURL}
-   \[link text\]{@link namepathOrURL}
-   {@link namepathOrURL|link text}
-   {@link namepathOrURL link text (after the first space)}

## 示例

提供链接文本：

```bash
/**
 * See {@link MyClass}.
 * Also, check out {@link https://www.example.com/cn/ | Example} and
 * {@link https://www.example.com/cn/ Example}.
 */
export function myFunction() {}
```

说明

若namepath是类名，如例子中的MyClass，用户需要在当前模块中定义该类才能进行正确的跳转。暂不支持对类中属性和方法的跳转。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-arktsdoc-link*