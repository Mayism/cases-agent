---
title: @param
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-arktsdoc-param
category: 指南
updated_at: 2026-03-13T04:48:03.539Z
---

# @param

@param标签提供函数参数的描述信息。

可以通过在描述之前插入一个连字符（-），使ArkTSDoc注释更具可读性。连字符前后需使用空格隔开。

## 语法

@param \[<description>\]

## 示例

下面的示例演示如何在 @param 标签中包含描述信息。

变量说明：

```javascript
/**
 * @param somebody Somebody's name.
 */
export function sayHello(somebody: string): void {
  console.log('Hello ' + somebody);
}
```

可以在变量说明前加个连字符（-），使之更加容易阅读：

```javascript
/**
 * @param somebody - Somebody's name.
 */
export function sayHello(somebody: string): void {
  console.log('Hello ' + somebody);
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-arktsdoc-param*