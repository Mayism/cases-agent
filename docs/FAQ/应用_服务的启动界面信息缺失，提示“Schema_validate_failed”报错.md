---
title: 应用/服务的启动界面信息缺失，提示“Schema validate failed”报错
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-16
category: FAQ
updated_at: 2026-03-13T05:31:22.537Z
---

# 应用/服务的启动界面信息缺失，提示“Schema validate failed”报错

**问题现象**

在工程同步或编译构建时，出现“Schema validate failed”的错误提示。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f3/v3/ns1sakk-TUuOJDfHatR_hQ/zh-cn_image_0000002229604277.png?HW-CC-KV=V1&HW-CC-Date=20260313T053117Z&HW-CC-Expire=86400&HW-CC-Sign=96B1ADD48BF24E8E49DB8BDFA78F9A0BA38A91B8AB329C99FEAA57217C20315F)

**解决措施**

在开发应用/服务时，创建工程后，默认设置了启动界面信息。如果开发者误删其中某个字段，将导致报错。下面以重新设置启动界面信息为例，为提高冷启动性能，可以通过以下方式设置启动界面的图标和背景颜色。

1.  在模块的**resources > base > element**目录下，右键点击并选择**New > Element Resource File**来创建资源文件。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/eb/v3/XUMg9RsUTJ-A1i301UPcdg/zh-cn_image_0000002194318512.png?HW-CC-KV=V1&HW-CC-Date=20260313T053117Z&HW-CC-Expire=86400&HW-CC-Sign=71C9A5601DA21BF7F6269780A61D9670F8CB4987739DF85AEE84C271DE8A5705)
    
2.  在弹出的对话框中，开发者可以自定义“File name”，例如 color；“Root element”请选择 **color**。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/24/v3/prI5sIiDSdWMKIxrWH-B1Q/zh-cn_image_0000002194158900.png?HW-CC-KV=V1&HW-CC-Date=20260313T053117Z&HW-CC-Expire=86400&HW-CC-Sign=533F71BA8EF30F287A7327B5990516EC99EF8ACAA540A8FD8B25215BF9AC80A3)
    
    创建完成后，color.json文件如下图所示：
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d4/v3/cjuPaJCDR0O6PaTg4JjHFQ/zh-cn_image_0000002194318508.png?HW-CC-KV=V1&HW-CC-Date=20260313T053117Z&HW-CC-Expire=86400&HW-CC-Sign=413C4B608112A8CD1A8A13DD97CFCB9CAB53940548B778C9E6A1E071190C550D)
    
3.  将[2](https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-16#zh-cn_topic_0000001233028585_li124901748185712)创建的color.json文件拷贝至模块的**ohosTest > resources > base > element**目录下。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5a/v3/NV-oRBs8SquXUAwLgJviTw/zh-cn_image_0000002229604281.png?HW-CC-KV=V1&HW-CC-Date=20260313T053117Z&HW-CC-Expire=86400&HW-CC-Sign=04F57BDBAB12940E1B294B220880E3BDEC2919CBD717FD492CDB2EA5D780973E)
    
4.  在模块的**src > main > module.json5**文件的abilities数组中，添加startWindowIcon和startWindowBackground字段。若缺少任一字段，将出现ERROR: Schema validate failed报错。startWindowIcon字段索引模块下**resources > base > media**中的图标资源，startWindowBackground字段索引**resources > base > element > color.json**中的颜色。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8/v3/H9L0igVPTE6mhVD_LPBFeg/zh-cn_image_0000002194318504.png?HW-CC-KV=V1&HW-CC-Date=20260313T053117Z&HW-CC-Expire=86400&HW-CC-Sign=65C6E5C260F42CE076AEE8AC1098063B49E861097FE03A84BABF3E20DBAD81AB)
    
5.  在**src > ohosTest > module.json5**文件的abilities数组中，添加startWindowIcon和startWindowBackground字段。其中，startWindowIcon字段引用模块ohosTest下 **resources > base > media**中的图标资源，startWindowBackground字段引用 **resources > base > element > color.json**中的颜色。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-16*