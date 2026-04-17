---
title: 如何通过hdc命令拉起指定的UIAbility
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-performance-analysis-kit-45
category: FAQ
updated_at: 2026-03-13T02:34:47.822Z
---

# 如何通过hdc命令拉起指定的UIAbility

使用命令拉起指定UIAbility：

```cangjie
hdc shell aa start -a <UIAbility Name> -b <Bundle Name>
```

启动成功时，返回"start ability successfully."，启动失败时，返回"error: failed to start ability."，同时会包含相应的失败信息。

示例如下：

```css
hdc shell aa start -a EntryAbility -b com.example.myapplication
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0/v3/LUhYDXwDTmKQOHF9UPMz5g/zh-cn_image_0000002229758597.png?HW-CC-KV=V1&HW-CC-Date=20260313T023441Z&HW-CC-Expire=86400&HW-CC-Sign=DB9E09DEB454147FDFA45796F09A17E931B68D49E15143719DBF4F04CD248DDB "点击放大")

**参考链接**

[aa工具](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/aa-tool)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-performance-analysis-kit-45*