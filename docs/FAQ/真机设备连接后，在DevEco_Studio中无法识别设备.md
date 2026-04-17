---
title: 真机设备连接后，在DevEco Studio中无法识别设备
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-3
category: FAQ
updated_at: 2026-03-13T05:55:11.146Z
---

# 真机设备连接后，在DevEco Studio中无法识别设备

**问题现象**

调试运行时，安装HAP失败并提示“设备未找到或未连接”；或DevEco Studio设备列表显示“No device”（未识别设备）。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c0/v3/ioCTkwNQS7eg5qwuG3CGmw/zh-cn_image_0000002370362990.png?HW-CC-KV=V1&HW-CC-Date=20260313T055504Z&HW-CC-Expire=86400&HW-CC-Sign=C2AF2A2C8CEB7C34E3607A7CFF914BC0416A27BDB9FD37CFF752D2F614B5C9A3 "点击放大")

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9a/v3/x-771npVQIuSOtf2Bf_IJw/zh-cn_image_0000002403922581.png?HW-CC-KV=V1&HW-CC-Date=20260313T055504Z&HW-CC-Expire=86400&HW-CC-Sign=B4BF714AAAA55BB954D86470EE83DE62490634AA329F58AE9AC28DE0317B5970 "点击放大")

**可能原因**

1.  设备未开启“开发者选项”开关。
2.  设备系统与DevEco Studio版本不匹配。
3.  使用的USB连接线为充电线而非数据线。
4.  当前的USB数据口损坏。
5.  hdc工具的进程或设备异常。
6.  场景一：关闭“USB调试”开关，断开USB连接，然后重新打开“USB调试”开关。此时无法识别到设备。
    
    场景二：打开“无线调试”开关后，进行无线调试连接。随后，关闭“无线调试”开关，并打开“USB调试”开关，进行USB调试。此时，设备无法被识别。
    
7.  连接的设备不在支持调试的设备列表中。

**解决措施**

1.  在设备上打开“[开发者选项](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-developer-mode)”开关，打开“USB调试”开关或“无线调试”开关。
2.  务必确认版本的配套关系是否与当前所使用的开发套件是一致的，可参考[版本概览](https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/overview-502-release)使用对应的配套版本。如无真机设备，可使用Device Manager模拟器。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/80/v3/MKo8mnDrQBO5edoGcmHMjw/zh-cn_image_0000002403917585.png?HW-CC-KV=V1&HW-CC-Date=20260313T055504Z&HW-CC-Expire=86400&HW-CC-Sign=2D84B59E94BAA3781F091D9463C183170B589B712F3CF445E77D7CCCE0A81895)
    
3.  请更换为符合USB2.0标准的数据线；建议直接连接，不要使用拓展坞。
4.  请更换USB数据口后重新尝试，并检查端口驱动是否正常。
5.  执行如下命令，结束hdc进程，然后重新连接。
    
    ```bash
    hdc kill
    ```
    
    如果按上一个步骤操作后仍无法连接，请重启设备，尝试重新连接。
    
6.  重启设备，连接USB，开启USB调试。
7.  确保连接调试的设备在支持列表中，详细请参见[各版本支持设备型号清单](https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/support-device)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-3*