---
title: 预览告警“@Consume/@Link decorated property <propertyName> not initialized”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-previewer-operating-3
category: FAQ
updated_at: 2026-03-13T05:29:19.991Z
---

# 预览告警“@Consume/@Link decorated property <propertyName> not initialized”

**问题现象**

启动预览后，预览窗口显示白屏，上方出现错误信息：“Preview failed. View details in the PreviewerLog window.”

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9a/v3/K6zfe9mkRk6jbg_oNwYXJQ/zh-cn_image_0000002194317968.png?HW-CC-KV=V1&HW-CC-Date=20260313T052913Z&HW-CC-Expire=86400&HW-CC-Sign=A1DD55CC85DECFC1DAF547827D31B083A880502F2AE06CDB1758AE43566BEF69 "点击放大")

此时，PreviewLog 窗口显示如下告警信息：“@Consume/@Link 装饰的属性 \_<propertyName>\_未初始化。”

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c6/v3/9Uo8MQFCQpi5bFMftGMFUA/zh-cn_image_0000002194158348.png?HW-CC-KV=V1&HW-CC-Date=20260313T052913Z&HW-CC-Expire=86400&HW-CC-Sign=60BDA66300EF1032C7C0B12FC40B8AEA38FB56CBE677D09E233D3BD617413C49)

**解决措施**

由于@Consume/@Link装饰的成员需要与父组件建立绑定关系，单独预览时无法完成初始化，因此如果预览包含@Consume（或@Link）装饰的成员的页面或组件，就可能会出现空白屏幕。

建议不要直接预览含有@Consume或@Link装饰的子组件，而应通过预览父组件来查看子组件的预览效果。

示例代码：

```typescript
// Suggest adding @ Preview on ParentComp to preview the preview effect of ChildComp
@Preview
@Component
struct ParentComp {
  // @Provide decoration is provided by the entrance component ParentComp as its descendant component
  @Provide reviewVotes: number = 10;
  build() {
    Column() {
      Button(`reviewVotes(${this.reviewVotes}), give +1`)
        .onClick(() => this.reviewVotes += 1)
      ChildComp()
    }
  }
}
// @Preview is not recommended to directly preview ChildComp
@Component
struct ChildComp {
  // The variable decorated with '@Consume' is bound to the variable decorated with '@Provide' in its ancestor component ParentComp using the same attribute name
  @Consume reviewVotes: number;
  build() {
    Column() {
      Text(`reviewVotes(${this.reviewVotes})`)
      Button(`reviewVotes(${this.reviewVotes}), give +1`)
        .onClick(() => this.reviewVotes += 1)
    }
    .width('50%')
  }
}
```

[PreviewFailed.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/PreviewerOperating/entry/src/main/ets/pages/PreviewFailed.ets#L3-L32)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-previewer-operating-3*