---
title: DevEco Studio 6.0.0 Beta1 及以上版本DevEco Studio ARKUI-X工程构建app报错
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-188
category: FAQ
updated_at: 2026-03-13T05:47:45.534Z
---

# DevEco Studio 6.0.0 Beta1 及以上版本DevEco Studio ARKUI-X工程构建app报错

**问题现象**

构建app报错：“Could not open settings generic class cache for settings file”

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f5/v3/uadXN2XLS8axIFE4LM8Vqg/zh-cn_image_0000002381980508.png?HW-CC-KV=V1&HW-CC-Date=20260313T054738Z&HW-CC-Expire=86400&HW-CC-Sign=C72F1FA067A5EB9F9DD316CBB78A23AB340499285BC53C9F5865841394325312)

**常见错误场景**

当前工程为使用低于DevEco Studio 6.0.0 Beta1 版本的DevEco Studio创建的。

**问题原因**

DevEco Studio 6.0.0 Beta1版本DevEco Studio内置的java版本为21，当前gradle的版本低于java21配套的版本。

**解决措施**：

-   **方式一：升级gradle版本**
    
    修改gradle-wrapper.properties中的distributionUrl，升级为8.4版本。
    
    ```ruby
    distributionUrl=https\://repo.huaweicloud.com/gradle/gradle-8.4-bin.zip
    ```
    

-   **方式二：指定使用java17**
    
    如果本地有jdk17，可以在gradle.properties中通过org.gradle.java.home变量指定使用java17。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e9/v3/yKxG9x2vRyGbV0D3iPPs1A/zh-cn_image_0000002415859685.png?HW-CC-KV=V1&HW-CC-Date=20260313T054738Z&HW-CC-Expire=86400&HW-CC-Sign=A7AA5C4D6F8A9E241143574EFA91C7FB0D5DDA69E8159F34147FEA4C2845C509)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-188*