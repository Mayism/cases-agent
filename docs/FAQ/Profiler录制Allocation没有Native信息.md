---
title: Profiler录制Allocation没有Native信息
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-profiler-5
category: FAQ
updated_at: 2026-03-13T06:00:36.936Z
---

# Profiler录制Allocation没有Native信息

**解决措施**

取消勾选Run > Edit Configurations > Diagnostics 内的Address Sanitizer、Thread Sanitizer、Hardware-Assisted Address Sanitizer选项重新运行应用录制即可。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6a/v3/CP_bX4zSS8iH280m5d7iDA/zh-cn_image_0000002269366576.png?HW-CC-KV=V1&HW-CC-Date=20260313T060031Z&HW-CC-Expire=86400&HW-CC-Sign=47BEC1B216099B975B8C14D00C571AAD1C17765FDDFD9AA650F433C0E1A1DACD)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4d/v3/TH2eU-rRQJ6NeBtOPdrpNA/zh-cn_image_0000002304120341.png?HW-CC-KV=V1&HW-CC-Date=20260313T060031Z&HW-CC-Expire=86400&HW-CC-Sign=E5A2B93A52577EA6D656A007E6C6C9676D716238F28B8F5B1251120D9F8C9388)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-profiler-5*