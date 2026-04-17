---
title: 如何通过hdc命令关闭整个应用
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-performance-analysis-kit-47
category: FAQ
updated_at: 2026-03-13T02:34:55.553Z
---

# 如何通过hdc命令关闭整个应用

可以通过以下命令结束应用：

```cangjie
hdc shell aa force-stop <Bundle Name>
```

返回“force stop process successfully”，表示应用已成功结束。

示例如下：

```vbnet
hdc shell aa force-stop com.example.myapplication
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/be/v3/eAwH5q5-Roqq5tTEQPTvhw/zh-cn_image_0000002194158796.png?HW-CC-KV=V1&HW-CC-Date=20260313T023448Z&HW-CC-Expire=86400&HW-CC-Sign=274CE74952023997A146209812EA40EF1DC1A283226D6ADC5FEFC3718CB487D4 "点击放大")

**参考链接**

[aa工具](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/aa-tool)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-performance-analysis-kit-47*