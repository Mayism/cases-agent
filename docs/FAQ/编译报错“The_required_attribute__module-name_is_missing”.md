---
title: 编译报错“The required attribute: module-name is missing”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-136
category: FAQ
updated_at: 2026-03-13T05:43:08.224Z
---

# 编译报错“The required attribute: module-name is missing”

**错误描述**

缺少必需属性：module-name。

**可能原因**

1.  build-profile.json5 文件中缺少模块名称。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2d/v3/89soOIaXQeWE6uKOqZOByw/zh-cn_image_0000002229758649.png?HW-CC-KV=V1&HW-CC-Date=20260313T054303Z&HW-CC-Expire=86400&HW-CC-Sign=7293402827E5E8706101DF7C009090921054959EB0C63853B4A89889B30A0D21)
    
2.  在hvigorconfig.ts中动态添加模块时未设置模块名。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6/v3/5FNm484WT-mI19NHRLBz1w/zh-cn_image_0000002194158776.png?HW-CC-KV=V1&HW-CC-Date=20260313T054303Z&HW-CC-Expire=86400&HW-CC-Sign=D3564B4B9F81214D218D8FBEAA5AE1F68EC5128CF2043F83C76210C817BCEA13)

**解决措施**

1.  进入项目根目录下的build-profile.json5文件，确保module下有非空的name字段。
2.  进入项目根目录下的hvigorconfig.ts文件，确保includeNode方法的参数name字段存在且非空。

**参考链接**

[Hvigor脚本文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-life-cycle#section810245135914)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-136*