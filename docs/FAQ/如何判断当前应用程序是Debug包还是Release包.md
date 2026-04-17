---
title: 如何判断当前应用程序是Debug包还是Release包
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-package-structure-61
category: FAQ
updated_at: 2026-03-13T02:46:17.239Z
---

# 如何判断当前应用程序是Debug包还是Release包

在编译构建时，Hvigor会生成BuildProfile类，可以通过该类在运行时获取编译构建参数，BuildProfile.BUILD\_MODE\_NAME即为编译模式。编译模式为“debug”表示Debug包，“release”则表示Release包。

**参考链接**

[获取自定义编译参数-能力说明](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-get-build-profile-para-guide)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-package-structure-61*