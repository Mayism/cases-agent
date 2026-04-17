---
title: 自动续期订阅商品，A切换B且立即生效时，新订阅有效期的组成
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/iap-faq-23
category: 指南
updated_at: 2026-03-24T11:01:23.175Z
---

# 自动续期订阅商品，A切换B且立即生效时，新订阅有效期的组成

订阅在发生切换且立即生效时，原订阅的剩余权益价值会自动按照比例，折算并叠加至新订阅。所以，切换后订阅有效期的组成 = 原订阅剩余权益的折算时间 + 新订阅原本的周期时间。

比如，某个用户首先购买了订阅A（普通会员，20元/30天），使用了15天后，切换成同订阅组下的订阅B（高级会员，60元/30天）。切换时，A订阅剩余权益自动按比例折算，折算至B订阅的时间为5天。则切换后，B订阅有效期的天数 = 5天 + 30天 = 35天。

时间轴（MM/dd）如下：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1d/v3/25PG8P4fRgOfklbsWZZhwA/zh-cn_image_0000002510827043.png?HW-CC-KV=V1&HW-CC-Date=20260324T110123Z&HW-CC-Expire=86400&HW-CC-Sign=801893ECC8288CB52B15577EDBFADB117C560BBDF87B5AD22A1022764008FF3F)

对于沙盒环境，按照生产1天 = 沙盒10s换算，等效时间轴（hh:mm:ss）如下：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c0/v3/337-2JGcTC-QHykEzqrhVA/zh-cn_image_0000002478627636.png?HW-CC-KV=V1&HW-CC-Date=20260324T110123Z&HW-CC-Expire=86400&HW-CC-Sign=BCB75769E5B3F2DC45663B7B16BEF5E0936A1AF4628C0CD7CF806F0860938DDC)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/iap-faq-23*