---
title: 编译报错“The 'tag' keyword is not allowed for 'version' at 'xxx/oh-package.json5'”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-149
category: FAQ
updated_at: 2026-03-13T05:44:47.664Z
---

# 编译报错“The 'tag' keyword is not allowed for 'version' at 'xxx/oh-package.json5'”

**错误描述**

oh-package.json5文件中的version字段不能包含tag标签。

**可能原因**

使用parameterFile参数化配置版本号时，oh-package.json5文件中的version字段不能包含tag标签。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1e/v3/Jfffd0y_Q5mKWel2IsA17w/zh-cn_image_0000002229604173.png?HW-CC-KV=V1&HW-CC-Date=20260313T054443Z&HW-CC-Expire=86400&HW-CC-Sign=7F4411634FB47E38AAB921B20F5D05C8AF9EACA0754159E5FA0DBADF2EE98DD0)

**解决措施**

当oh-package.json5文件中的version字段引用parameterFile时，开发者不应使用tag标签。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-149*