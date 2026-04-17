---
title: @typescript-eslint/brace-style
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_brace-style
category: 指南
updated_at: 2026-03-13T04:12:57.399Z
---

# @typescript-eslint/brace-style

对代码块强制执行一致的括号样式。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/brace-style": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/brace-style选项](https://eslint.nodejs.cn/docs/rules/brace-style#选项)。

## 正例

```typescript
function foo(): boolean {
  return true;
}
class C {
  static {
    foo();
  }
  public meth() {
    foo();
  }
}
export { C };
```

## 反例

```typescript
function foo(): boolean
{
  return true;
}
class C {
  static
  {
    foo();
  }
  public meth()
  {
    foo();
  }
}
export { C };
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_brace-style*