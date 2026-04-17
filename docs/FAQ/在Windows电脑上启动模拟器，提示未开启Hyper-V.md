---
title: 在Windows电脑上启动模拟器，提示未开启Hyper-V
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-running-10
category: FAQ
updated_at: 2026-03-13T05:51:02.759Z
---

# 在Windows电脑上启动模拟器，提示未开启Hyper-V

**问题现象**一

启动模拟器时，如果未开启Hyper-V，或在虚拟环境中使用模拟器，会弹窗提示“Hyper-V not enabled”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/24/v3/-1fKdnsnQ4GdID7fgB3Twg/zh-cn_image_0000002194158596.png?HW-CC-KV=V1&HW-CC-Date=20260313T055056Z&HW-CC-Expire=86400&HW-CC-Sign=A48094702B6ACA74E11C1D95E358745CB239AA35FB1CE3346D6ACD5848807322)

**解决措施**

1.  请确保模拟器的[使用环境](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-emulator-requirements)符合要求。
2.  如果CPU支持虚拟化，打开控制面板 > 程序 > 程序与功能 > 启动或关闭Windows功能（对于Windows 11系统，需打开系统 > 可选功能，在相关设置中点击更多Windows功能），找到并勾选“Hyper-V”、“Windows虚拟机监控程序平台”和“虚拟机平台”，点击确定并重启电脑。若勾选后启动模拟器仍提示错误，需以管理员权限打开命令行窗口，执行 \`bcdedit /set hypervisorlaunchtype auto\`，然后重启电脑。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2f/v3/47W0mt-BR7uMP1G3js6Daw/zh-cn_image_0000002273550542.png?HW-CC-KV=V1&HW-CC-Date=20260313T055056Z&HW-CC-Expire=86400&HW-CC-Sign=8B12BE25CD9421CC55AB4B6ACE4F66E4D404E12E1EBE3ECA6017A44EECDBB1A3)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2c/v3/H9CwsgPeQwOeLTSDKAJfpg/zh-cn_image_0000002308080257.png?HW-CC-KV=V1&HW-CC-Date=20260313T055056Z&HW-CC-Expire=86400&HW-CC-Sign=2DA9ED4D6E3425B5BC9FB91CE5D2503C6D63AD936D0D73D6365BEE0301B0E8BC)
    
3.  若勾选后启动模拟器仍然提示该错误，需要以管理员权限打开命令行窗口执行以下命令，并重启电脑。
    
    ```cpp
    bcdedit /set hypervisorlaunchtype auto
    ```
    
4.  如果上述步骤无法解决问题，打开任务管理器，切换到“性能”选项卡。如果显示虚拟化已禁用或未开启，说明BIOS中虚拟化功能未开启。请根据计算机主板型号，进入 BIOS 设置界面，开启虚拟化功能。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c5/v3/K6RW4rt4SReNYey92rl9aw/zh-cn_image_0000002307967181.png?HW-CC-KV=V1&HW-CC-Date=20260313T055056Z&HW-CC-Expire=86400&HW-CC-Sign=0D1A87E4B9276A308A4AC142807765ECFE4D53FA3DD65CD8C6D58C74FA3C0084)
    

如果安装和开启Hyper-V的过程遇到其他问题，请根据系统版本查阅相关文档。更多关于Hyper-V安装请参考[安装 Hyper-V](https://learn.microsoft.com/zh-cn/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v?f=255&MSPPError=-2147217396)，[Windows 和 Windows Server 上的 Hyper-V 的系统要求](https://learn.microsoft.com/zh-cn/virtualization/hyper-v-on-windows/reference/hyper-v-requirements)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-running-10*