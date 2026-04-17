---
title: 如何解决自定义组件struct内不支持定义成员变量get/set方法的问题
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-50
category: FAQ
updated_at: 2026-03-13T05:34:35.809Z
---

# 如何解决自定义组件struct内不支持定义成员变量get/set方法的问题

**问题现象**

运行DevEco Studio的build编译构建功能后，产物中不会生成get/set方法的代码逻辑。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/68/v3/aUYEQG69RsePZ-c5gpi-PA/zh-cn_image_0000002229758625.png?HW-CC-KV=V1&HW-CC-Date=20260313T053429Z&HW-CC-Expire=86400&HW-CC-Sign=880BA8D01A5DF945A19E793FE2D82C66EACFE2433E7D4402C570B2C0275D4F33)

错误示例如下：

```typescript
@Entry
@Component
struct GetSetDemo {
  private get value(): string {
    return "Hello";
  }
  private set value(value: string) {
    this.value = value;
  }
  build() {
    Row() {
      Column() {
        Text("Hello World")
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
    }
  }
}
```

**解决措施**

1.可以使用以下方法替代get方法：

private value: string = "Hello";

2.可以使用以下方式替代 set方法：

this.value = "World"；

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-50*