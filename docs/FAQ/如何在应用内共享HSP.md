---
title: 如何在应用内共享HSP
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-package-structure-69
category: FAQ
updated_at: 2026-03-13T02:47:13.389Z
---

# 如何在应用内共享HSP

如需在应用内共享HSP，请将HSP共享包上传至私仓。动态共享包HSP不能直接发布在私仓内，需要先转换为.tgz包。请按以下操作编译生成\*.tgz包。

1.  将编译模式设为release。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2b/v3/hEXexO6bQ-ax1i0RhqIyOg/zh-cn_image_0000002215625442.png?HW-CC-KV=V1&HW-CC-Date=20260313T024706Z&HW-CC-Expire=86400&HW-CC-Sign=C74176E0B3E8D7133047313791BF0CEB3EE26D8BADE1509CAF5F4B8297785274 "点击放大")
    
2.  选中HSP模块的根目录，点击Build > Make Module {libraryName}，启动构建。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ef/v3/sHJeCDMBQQCFS0X69nbvOQ/zh-cn_image_0000002215465626.png?HW-CC-KV=V1&HW-CC-Date=20260313T024706Z&HW-CC-Expire=86400&HW-CC-Sign=67CF8FB10BE1B1E8FD2709884EA2363784CF0E86111BC134D68223C060E9291C)
    
3.  构建完成后，build目录下生成HSP包产物，其中.tgz用来上传至私仓（请参考[将三方库发布到 ohpm-repo](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-quickstart#zh-cn_topic_0000001792256157_将三方库发布到ohpm-repo)）。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f0/v3/tB0dn6bCSKWAk6dLyFXmyg/zh-cn_image_0000002250545457.png?HW-CC-KV=V1&HW-CC-Date=20260313T024706Z&HW-CC-Expire=86400&HW-CC-Sign=95EAA11380FA84327FFCD637CACC6F14CACB84EA70AB47D073131BB2303D0BBB "点击放大")
    
4.  上传到仓库，然后使用 \`ohpm install\` 命令将依赖安装到工程的oh-package.json5文件的dependencies字段中，即可查看对外共享的 HSP 方法。

**参考链接**

[创建HSP模块](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hsp#section79378499185)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-package-structure-69*