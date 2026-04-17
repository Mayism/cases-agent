---
title: ohosTest测试文件引用了启动页的导出方法，测试时报错“Load Page Failed: pages/Index”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-test-9
category: FAQ
updated_at: 2026-03-13T06:03:06.812Z
---

# ohosTest测试文件引用了启动页的导出方法，测试时报错“Load Page Failed: pages/Index”

**问题现象**

在测试文件中引用启动页的导出方法并拉起启动页面所在的Ability时，执行测试会抛出jscrash，错误信息为：“Load Page Failed: pages/Index”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/fc/v3/93LoPogGS1SL7EeDZyvywQ/zh-cn_image_0000002229604273.png?HW-CC-KV=V1&HW-CC-Date=20260313T060300Z&HW-CC-Expire=86400&HW-CC-Sign=65AF543BEDF64B6EEBB9BCB0F9F30AFBC5F3B9176CD7E03855DD99F48067D6FC)**解决措施**

拉起启动页面所在Ability时指定当前模块名称，执行测试，用例正常运行。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/03/v3/GdIJgNwfQgqx7IFOwXP-xQ/zh-cn_image_0000002194158896.png?HW-CC-KV=V1&HW-CC-Date=20260313T060300Z&HW-CC-Expire=86400&HW-CC-Sign=3201A5C48B85F6C520A2CE4CE351485D47FEBBF8E6151E1F07E6049D53EB1716)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-test-9*