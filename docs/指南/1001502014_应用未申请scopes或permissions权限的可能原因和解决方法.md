---
title: 1001502014 应用未申请scopes或permissions权限的可能原因和解决方法
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/account-faq-2
category: 指南
updated_at: 2026-03-12T20:14:03.697Z
---

# 1001502014 应用未申请scopes或permissions权限的可能原因和解决方法

**问题现象**

调用接口报错1001502014 应用未申请scopes或permissions权限。

**可能原因**

1.  没有申请对应的账号权限。
2.  权限申请成功后，最迟会在25小时后生效。
3.  使用[获取风险等级](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/account-get-risklevel)能力，但未申请获取风险等级权限。

**解决措施**

1.  申请对应权限，请见[申请账号权限](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/account-config-permissions)章节。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/73/v3/kGeaJORfTuCW-_Ca3HUNBQ/zh-cn_image_0000002497063284.png?HW-CC-KV=V1&HW-CC-Date=20260312T195834Z&HW-CC-Expire=86400&HW-CC-Sign=4A657BA2338239981DC5CC126E9AF958FB78DEC40A4413F483B25A1DD00A867B "点击放大")
    
2.  权限申请通过后，您可通过修改应用工程 > app.json5中的versionCode触发权限生效。
    
    **图1** 修改前  
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0d/v3/SN8SfVrdTCu0u26mjlfAwQ/zh-cn_image_0000002528823271.png?HW-CC-KV=V1&HW-CC-Date=20260312T195834Z&HW-CC-Expire=86400&HW-CC-Sign=31217D936161AB775EB75232E6E18209583173A3ABA831C793227CA908BACD36)
    
    **图2** 修改后  
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e1/v3/ovVM8dJbRfKpt__IJ2ljlw/zh-cn_image_0000002528943239.png?HW-CC-KV=V1&HW-CC-Date=20260312T195834Z&HW-CC-Expire=86400&HW-CC-Sign=FF14E66C5D5A7366B3D173021667852F71D8098611E851F80AA5CA1AFE43F261)
    
3.  确认是否需要使用获取风险等级能力，如需使用，请参考[获取风险等级](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/account-get-risklevel)申请对应权限。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/account-faq-2*