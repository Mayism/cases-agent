---
title: @performance/tabs-on-change-check
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-tabs-on-change-check
category: 指南
updated_at: 2026-03-13T04:39:59.847Z
---

# @performance/tabs-on-change-check

推荐使用onAnimationStart事件设置切换标签动效。避免使用onChange事件会导致页面切换后再触发动效，造成效果延迟。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@performance/tabs-on-change-check": "suggestion",
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```cangjie
@Builder
TabBuilder(id: number, index: number) {
  Column() {
    Text(this.tabBarArray[id].name)
      .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
  }
  .alignItems(HorizontalAlign.Start)
}
build() {
  Tabs({ barPosition: BarPosition.Start }) {
    ForEach(this.tabBarArray, (tabsItem: NewsTypeModel, index: number) => {
      TabContent() {
      }.tabBar(this.TabBuilder(xx, xx))
    }, (item: NewsTypeModel) => JSON.stringify(item));
  }
  .onAnimationStart((_index: number, targetIndex: number, _event: TabsAnimationEvent) => {
    this.currentIndex = targetIndex;
  })
}
```

## 反例

```typescript
@Builder
TabBuilder(id: number, index: number) {
  Column() {
    Text(this.tabBarArray[id].name)
      .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
  }
  .alignItems(HorizontalAlign.Start)
}
build() {
  Tabs({ barPosition: BarPosition.Start }) {
    ForEach(this.tabBarArray, (tabsItem: NewsTypeModel, index: number) => {
      TabContent() {
      }.tabBar(this.TabBuilder(xx, xx))
    }, (item: NewsTypeModel) => JSON.stringify(item));
  }
  .onChange((_index: number) => {
    this.currentIndex = _index;
  })
}
```

## 规则集

```sql
plugin:@performance/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-tabs-on-change-check*