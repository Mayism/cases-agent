---
title: 编译报错“ninja: error: mkdir(xxx): No such file or directory”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-31
category: FAQ
updated_at: 2026-03-13T05:32:35.384Z
---

# 编译报错“ninja: error: mkdir(xxx): No such file or directory”

**问题现象**

Native工程编译时出现以下告警和报错信息。

出现工程目录长度超过250字符的告警，示例如下：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d6/v3/cMzGEkZxRymPzSeV83wzNw/zh-cn_image_0000002229604401.png?HW-CC-KV=V1&HW-CC-Date=20260313T053229Z&HW-CC-Expire=86400&HW-CC-Sign=6AC61AE37005F0B500ECFEE2D1944736BFF41ADA07DD7ADDD22D49AD07CE0CCA "点击放大")

出现编译错误“ninja: error: mkdir(xxx): No such file or directory”。示例如下：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/65/v3/MaisP6YqSeiGYfTGqOR3wQ/zh-cn_image_0000002229758889.png?HW-CC-KV=V1&HW-CC-Date=20260313T053229Z&HW-CC-Expire=86400&HW-CC-Sign=8929F33B797AD300ECCA0F4C559F7D10034C70EDAE240B8E4E5553A1623B0784 "点击放大")

**解决措施**

CMAKE\_OBJECT\_PATH\_MAX默认值为250，如果工程中object file的实际路径长度超出该值，将导致编译错误。

开发者需在工程的CMakeLists.txt文件中，根据object file实际路径长度设置CMAKE\_OBJECT\_PATH\_MAX的大小，具体方法如下：

-   方法一： 在CMAKE\_OBJECT\_PATH\_MAX默认值基础上增加一个文件名长度即可。
    
    示例中的告警文件为TextMeasureCache.cpp.obj，长度为24字符。在默认值250的基础上增加24，即设置set(CMAKE\_OBJECT\_PATH\_MAX 274)。
    
-   方法二：根据对象文件的实际路径长度计算CMAKE\_OBJECT\_PATH\_MAX的大小。
    
    计算公式：CMAKE\_OBJECT\_PATH\_MAX = 总路径长度 - object file目录长度 + 32（cmake哈希值字符数）
    
    -   总路径长度为 object file directory 长度与 object file 长度之和。object file directory 和 object file 如下图所示，两个长度之和为 297 个字符，具体以实际为准。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a1/v3/Ekbcp8qCQY-t8lCg6HZWWA/zh-cn_image_0000002194318624.png?HW-CC-KV=V1&HW-CC-Date=20260313T053229Z&HW-CC-Expire=86400&HW-CC-Sign=DA11ED6D5D04740497DE07B3C37EF5B3B5420928E380B90FEA72235EF261C79D "点击放大")
        
    -   object file中目录部分长度：示例中“\_\_/\_\_/\_\_/\_\_/\_\_/third-party/rn/ReactCommon/react/renderer/textlayoutmanager”长度为74字符，具体以实际为准。
    -   cmake哈希值字符数：cmake将长路径转换为哈希值时，哈希值的长度固定为32。
    
    代入示例中的长度后，计算可得：CMAKE\_OBJECT\_PATH\_MAX = 297 - 74 + 32 = 255。设置 CMAKE\_OBJECT\_PATH\_MAX 为 255。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-31*