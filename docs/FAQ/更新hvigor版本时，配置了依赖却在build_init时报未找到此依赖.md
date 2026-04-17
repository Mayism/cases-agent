---
title: 更新hvigor版本时，配置了依赖却在build init时报未找到此依赖
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-35
category: FAQ
updated_at: 2026-03-13T05:33:00.234Z
---

# 更新hvigor版本时，配置了依赖却在build init时报未找到此依赖

**问题现象**

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5e/v3/VUXlcPiPQQOQdsiFwyYevQ/zh-cn_image_0000002194158852.png?HW-CC-KV=V1&HW-CC-Date=20260313T053255Z&HW-CC-Expire=86400&HW-CC-Sign=02AAEDA5868D2FE62BFAA9A09F36432C4F4FB83A6534FEDEC7A2BB8FA4839B63)

**解决措施**

出现该问题的原因是工程中使用了3.3.0及后续版本的Hvigor，但Hvigor-wrapper.js版本较旧，两者不兼容。不兼容的场景包括：

-   场景一：使用4.0 Canary2之前的DevEco Studio时，同步只会下载hvigor，不会下载dependencies下的内容（即hvigor-ohos-plugin）。如果需要更新hvigor版本且不更新DevEco Studio，只能下载hvigor，无法下载hvigor-ohos-plugin。建议更新至DevEco Studio NEXT Developer Preview1及以上版本
-   场景二：对于4.0 Beta1之前的DevEco Studio创建的工程，需要更新hvigor版本。使用DevEco Studio NEXT Developer Preview1及以上版本的DevEco Studio打开历史工程，修改hvigor-config.json5中的hvigor和plugin版本号，然后Sync。同步时会提示更新，点击按钮后将自动完成hvigor和plugin的下载。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/31/v3/rhnnLuFPRiOnNeT8sXNyzA/zh-cn_image_0000002229758729.png?HW-CC-KV=V1&HW-CC-Date=20260313T053255Z&HW-CC-Expire=86400&HW-CC-Sign=E3A46B594DB4DF56CAA44A1A3CBE1E3FE735D6BBBAE9E5F9A2CAD6699F97F3FF)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-35*