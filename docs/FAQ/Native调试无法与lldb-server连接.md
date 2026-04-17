---
title: Native调试无法与lldb-server连接
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-34
category: FAQ
updated_at: 2026-03-13T05:58:20.760Z
---

# Native调试无法与lldb-server连接

**问题现象：**Native调试长时间没有启动，最后DevEco Studio超时报错"Attach request timeout after 600000 milliseconds"或Native调试启动后报错"Failed to connect port"。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/22/v3/EUTKFQd2T_SzNJ2wqJJDUQ/zh-cn_image_0000002229758601.jpg?HW-CC-KV=V1&HW-CC-Date=20260313T055815Z&HW-CC-Expire=86400&HW-CC-Sign=CEA44A08F67E2FC4CECBBE4755010EB97F88CDC7AB2C011C3682693A01C0F8A1)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/26/v3/l_alflT1RzSArqVMaK4pDw/zh-cn_image_0000002194318340.png?HW-CC-KV=V1&HW-CC-Date=20260313T055815Z&HW-CC-Expire=86400&HW-CC-Sign=04FA5452FA66425AAB737784EBC12A3EC5BAC8D7C1BF2DF6B734ED927B143DC9)

**可能原因：**

linux或MacOS 下 /etc/hosts文件被修改。

**解决措施：**

1.  在/etc/hosts文件后添加如下内容：
    
    ```plaintext
    127.0.0.1 localhost
    255.255.255.255 broadcasthost
    ::1 localhost
    ```
    
2.  重启电脑使修改生效。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-34*