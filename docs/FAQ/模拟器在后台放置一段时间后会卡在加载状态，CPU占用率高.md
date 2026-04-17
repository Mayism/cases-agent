---
title: 模拟器在后台放置一段时间后会卡在加载状态，CPU占用率高
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-running-20
category: FAQ
updated_at: 2026-03-13T05:51:58.999Z
---

# 模拟器在后台放置一段时间后会卡在加载状态，CPU占用率高

**问题描述**

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bc/v3/L4rtmFiyS4GASBpRn5YBtA/zh-cn_image_0000002229603801.png?HW-CC-KV=V1&HW-CC-Date=20260313T055153Z&HW-CC-Expire=86400&HW-CC-Sign=B2FDCA255967A95FB8E07A1D80032E7058BD8644F49F5C4C904CE367A9519BA0)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ab/v3/ogz1gYD2QqmUK_xAyNU5eg/zh-cn_image_0000002194318016.png?HW-CC-KV=V1&HW-CC-Date=20260313T055153Z&HW-CC-Expire=86400&HW-CC-Sign=00370C654BA09E8E09EC467975C5EAED1CC9ECADED5373F66A93588C1D2E5B2D)

打开活动检测器，发现模拟器的CPU占用率为80%。

**解决措施**

1.打开模拟器设备管理页面。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6c/v3/6zZpoDS6R6CELtPdxE3MVg/zh-cn_image_0000002229603789.png?HW-CC-KV=V1&HW-CC-Date=20260313T055153Z&HW-CC-Expire=86400&HW-CC-Sign=49B75AB22DE6CCA76E16D6EFF4D1C45B01EA454EBA8A13C17BD5F08D3C7DDD6A)

2.选择“新建模拟器”弹窗。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/28/v3/RW_NoF5IRJW_E16_osVdOQ/zh-cn_image_0000002194158400.png?HW-CC-KV=V1&HW-CC-Date=20260313T055153Z&HW-CC-Expire=86400&HW-CC-Sign=5F3B87CF5ECA5CFB37F4E1BB02128FE51EF67E5759EB05E3F95D8103B5026018)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f9/v3/D5fv6fkoRZed0yFh3jUpqQ/zh-cn_image_0000002229758273.png?HW-CC-KV=V1&HW-CC-Date=20260313T055153Z&HW-CC-Expire=86400&HW-CC-Sign=8F1AE8661C5B1A6822F5212D61A18D8EC4CC1EEC62D0489A05DA3CE2EE554C52)

3.复制路径并用文件夹打开system-image\\HarmonyOS-NEXT-DB1\\phone\_x86。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/38/v3/rhk6kxrjSA-mS380futOeg/zh-cn_image_0000002229758269.png?HW-CC-KV=V1&HW-CC-Date=20260313T055153Z&HW-CC-Expire=86400&HW-CC-Sign=1512108256961B84406DA394C306204782D9647170C4096BDEBFE998C7B08CE5)

4.打开features.ini文件，将bootanimation.feature.key的值改为true，保存后重启模拟器。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9c/v3/BCVKMWbKSla_mZIKyxXdOQ/zh-cn_image_0000002194158396.png?HW-CC-KV=V1&HW-CC-Date=20260313T055153Z&HW-CC-Expire=86400&HW-CC-Sign=8AD820A39AF9911C95365E1D0E395ECA6684F800355FC2597A298E921E577B20)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-running-20*