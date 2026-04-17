---
title: 编译初始化报错“resource busy or locked, open 'xxx\outputs\build-logs\build.log'”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-132
category: FAQ
updated_at: 2026-03-13T05:42:44.181Z
---

# 编译初始化报错“resource busy or locked, open 'xxx\outputs\build-logs\build.log'”

**问题现象**

在升级DevEco Studio至5.0.3.403版本后，打开旧工程时，可能会遇到以下错误：resource busy or locked, open 'xxx\\outputs\\build-logs\\build.log'。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b7/v3/s9qmkev8R7mrH0EyyhvXeg/zh-cn_image_0000002194158364.png?HW-CC-KV=V1&HW-CC-Date=20260313T054239Z&HW-CC-Expire=86400&HW-CC-Sign=F58EF46C4257B826AA57864C1CF6238F05202C34DED02282F46EA04F07A51E50)

**问题原因**

初始化时，日志写入存在冲突，.hvigor目录中的build-log文件被占用，导致报错。

**解决方案**

-   方法一：点击编辑器窗口上方的Sync Now。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/52/v3/uuDBjC2DROysdpdEG3FOWg/zh-cn_image_0000002194317984.png?HW-CC-KV=V1&HW-CC-Date=20260313T054239Z&HW-CC-Expire=86400&HW-CC-Sign=A7AE4555DD2F86BFDE7F23A5B451913DB764911978AA57F9F3B2841FE38BF858)
    
-   方法二：点击工具栏**File > Sync and Refresh Project**。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9c/v3/LCrIOgEBQV6yFc7uLcqJQw/zh-cn_image_0000002229758229.png?HW-CC-KV=V1&HW-CC-Date=20260313T054239Z&HW-CC-Expire=86400&HW-CC-Sign=A0B35F581703AD52E193E6CC8C92CBA23D3D0D10D320E6D9FE46D877BF131A1C)
    
-   方法三：如果方法一和方法二无法解决问题，可以手动删除工程目录下的 .hvigor目录，然后重启并执行 Sync。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/dd/v3/pF62uxCSSHecadTMG7r-SQ/zh-cn_image_0000002229758233.png?HW-CC-KV=V1&HW-CC-Date=20260313T054239Z&HW-CC-Expire=86400&HW-CC-Sign=4AEFABDC5A5207B884671AEE586AFDD7450185DD20307A2521CAD5489C75CCC5)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-132*