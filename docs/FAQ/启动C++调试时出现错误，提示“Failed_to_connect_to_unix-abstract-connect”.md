---
title: 启动C++调试时出现错误，提示“Failed to connect to unix-abstract-connect”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-25
category: FAQ
updated_at: 2026-03-13T05:57:28.274Z
---

# 启动C++调试时出现错误，提示“Failed to connect to unix-abstract-connect”

**问题现象**

启动C++调试时出现错误，提示“Failed to connect to unix-abstract-connect://\\\*\\\*\\\*\\\*\\\*\\\*\\\*\\\*\\\*.sock: Connection shut down by remote side while waiting for reply to initial handshake packet”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/99/v3/ljD17lL-RW-GqPh28sdrjQ/zh-cn_image_0000002194158920.png?HW-CC-KV=V1&HW-CC-Date=20260313T055723Z&HW-CC-Expire=86400&HW-CC-Sign=01ABF5A72322495924D98BF9112508A8BB57A1F908CE95FE53C8D88E4E48D09E)

**解决措施**

1.  如果设备镜像与DevEco Studio版本不匹配，请尝试更换设备镜像版本以解决问题。
2.  签名使用了release证书，请更换为debug证书。
3.  到设备路径 /data/local/tmp/debugserver/ 下，删除与应用包名相同的文件夹。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-25*