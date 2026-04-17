---
title: @typescript-eslint/prefer-string-starts-ends-with
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_prefer-string-starts-ends-with
category: 指南
updated_at: 2026-03-13T04:24:43.214Z
---

# @typescript-eslint/prefer-string-starts-ends-with

强制使用“String#startsWith”和“String#endsWith”而不是其他检查子字符串的等效方法。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/prefer-string-starts-ends-with": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```php
declare const foo: string;
// starts with
foo.startsWith('bar');
// ends with
foo.endsWith('bar');
```

## 反例

```typescript
declare const foo: string;
declare const index: number;
// starts with
foo[index] === 'b';
foo.charAt(index) === 'b';
foo.indexOf('bar') === index;
foo.slice(index) === 'bar';
foo.substring(index) === 'bar';
foo.match(/^bar/) !== null;
/^bar/.test(foo);
// ends with
foo[foo.length - index] === 'b';
foo.charAt(foo.length - index) === 'b';
foo.lastIndexOf('bar') === foo.length - index;
foo.slice(-index) === 'bar';
foo.substring(foo.length - index) === 'bar';
foo.match(/bar$/) !== null;
/bar$/.test(foo);
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_prefer-string-starts-ends-with*