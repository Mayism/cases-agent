---
title: @typescript-eslint/comma-spacing
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_comma-spacing
category: 指南
updated_at: 2026-03-13T04:13:15.175Z
---

# @typescript-eslint/comma-spacing

强制逗号前后的空格风格保持一致。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/comma-spacing": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/comma-spacing选项](https://eslint.nodejs.cn/docs/rules/comma-spacing#选项)。

## 正例

```typescript
// 默认不允许逗号前有空格，逗号后需要一个或多个空格
export const arr1 = ['1', '2'];
export const arr2 = ['1',, '3'];
function qur(a: string, b: string) {
  return `${a}${b}`;
}
qur('1', '2');
```

## 反例

```typescript
// 默认不允许逗号前有空格，逗号后需要一个或多个空格
export const arr = ['1' , '2'];
function qur(a: string ,b: string) {
  return `${a}${b}`;
}
qur('1' ,'2');
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_comma-spacing*