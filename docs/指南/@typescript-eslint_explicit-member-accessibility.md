---
title: @typescript-eslint/explicit-member-accessibility
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_explicit-member-accessibility
category: 指南
updated_at: 2026-03-13T04:14:22.316Z
---

# @typescript-eslint/explicit-member-accessibility

在类属性和方法上需要显式定义访问修饰符。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/explicit-member-accessibility": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/explicit-member-accessibility选项](https://typescript-eslint.nodejs.cn/rules/explicit-member-accessibility)。

## 正例

```typescript
export class Animal {
  private animalName: string; // Property
  public constructor(name: string) {
    // Parameter property and constructor
    this.animalName = name;
  }
  public get name(): string {
    // get accessor
    return this.animalName;
  }
  public set name(value: string) {
    // set accessor
    this.animalName = value;
  }
  public walk() {
    // method
  }
}
```

## 反例

```typescript
export class Animal {
  private animalName: string; // Property
  constructor(name: string) {
    // Parameter property and constructor
    this.animalName = name;
  }
  get name(): string {
    // get accessor
    return this.animalName;
  }
  set name(value: string) {
    // set accessor
    this.animalName = value;
  }
  walk() {
    // method
  }
}
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_explicit-member-accessibility*