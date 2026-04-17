---
title: @performance/hp-arkui-remove-redundant-nest-container
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_hp-arkui-no-redundant-nest
category: 指南
updated_at: 2026-03-13T04:33:45.522Z
---

# @performance/hp-arkui-remove-redundant-nest-container

避免冗余的嵌套。

通用丢帧场景下，建议优先修改。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@performance/hp-arkui-remove-redundant-nest-container": "suggestion",
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```typescript
@Entry
@Component
struct MyComponent {
  @State children: number[] = Array.from(Array<number>(900), (v, k) => k);
  build() {
    Scroll() {
      Grid() {
        ForEach(this.children, (item: Number[]) => {
          GridItem() {
            Text(item.toString())
          }.backgroundColor(Color.Yellow)
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .columnsGap(0)
      .rowsGap(0)
      .size({ width: "100%", height: "100%" })
    }
  }
}
```

## 反例

```less
@Entry
@Component
struct MyComponent {
    @State children: number[] = Array.from(Array<number>(900), (v, k) => k);
    build() {
      Scroll() {
      Grid() {
        ForEach(this.children, (item: Number[]) => {
          GridItem() {
            // 冗余Stack
            Stack() {
              Stack() {
                Stack() {
                  Text(item.toString())
                }.size({ width: "100%"})
              }.backgroundColor(Color.Yellow)
            }.backgroundColor(Color.Pink)
          }
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .columnsGap(0)
      .rowsGap(0)
      .size({ width: "100%", height: "100%" })
    }
  }
}
```

## 规则集

```sql
plugin:@performance/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_hp-arkui-no-redundant-nest*