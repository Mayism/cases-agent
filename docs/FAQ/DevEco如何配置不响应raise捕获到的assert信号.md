---
title: DevEco如何配置不响应raise捕获到的assert信号
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-57
category: FAQ
updated_at: 2026-03-13T05:59:26.214Z
---

# DevEco如何配置不响应raise捕获到的assert信号

在DevEco Studio RUN/Debug Configurations中的Edit Configurations > Debugger > LLDB Post Attach Commands，添加配置：process handle -p false -s false -n false signal。其中，signal为assert发送的信号。详细步骤如图所示：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a7/v3/KGmOohSSR7WGsq2EBXEXFg/zh-cn_image_0000002194158524.png?HW-CC-KV=V1&HW-CC-Date=20260313T055921Z&HW-CC-Expire=86400&HW-CC-Sign=CD816113A0FCD42557535495354BD0F2264E65FCD2609A22132FFC803CC6CA4A)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/93/v3/Jjk9qWKcQTGAuPe16jMJOA/zh-cn_image_0000002229603925.png?HW-CC-KV=V1&HW-CC-Date=20260313T055921Z&HW-CC-Expire=86400&HW-CC-Sign=7680DF33CA08E830ADA7B5F0EEC526CEE55A44D3F9212DE8C8DBF42AD4F1F6BE "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-57*