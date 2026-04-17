---
title: 控制后台进程CPU使用率
source: https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-controlling-background-process-cpu
category: 最佳实践
updated_at: 2026-03-13T02:37:31.351Z
---

# 控制后台进程CPU使用率

CPU使用率表示进程在CPU上的运行时间占总时间的百分比，计算公式为：CPU使用率 = 运行时间 / 总时间。单核CPU使用率的最大值为100%，多核CPU使用率的最大值为核数乘以100%。例如，8核CPU使用率的最大值为800%。

系统将进程的任务调度到多个CPU核上，进程在所有核上运行的时间总和与总时间的比值即为该进程的CPU使用率。例如，1秒内进程在所有核上运行的总时间为1.1秒，则该进程的CPU使用率为110%。

## 约束

后台进程在10分钟内的单核CPU使用率不得超过80%。

短时任务后台进程CPU使用率约束：后台进程任务期间单核CPU使用率不得高于80%。

## 调测验证

1.  连接设备，打开命令行窗口，输入hdc shell进入设备。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bd/v3/4VJghCxqQG6lHbsWWLFUEA/zh-cn_image_0000002229450601.png?HW-CC-KV=V1&HW-CC-Date=20260313T023724Z&HW-CC-Expire=86400&HW-CC-Sign=652E83D981D3943E331AD3E5EFED66EA7BB119EE4E0062925192C1EB0F6CA96B "点击放大")
    
2.  输入ps -ef | grep bundleName，查询应用使用率的进程号。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/69/v3/hr1N_Y31Q8OXh571BObzsA/zh-cn_image_0000002229336117.png?HW-CC-KV=V1&HW-CC-Date=20260313T023724Z&HW-CC-Expire=86400&HW-CC-Sign=7B87C34838207C2E290B2784B40531BF595A9F9B47E276ECFECE2E56C314F262 "点击放大")
    
3.  输入：top -p xxx，查看对应进程的使用率。查询结果中，CPU列显示进程的实时使用率。其中，xxx是进程ID(PID)。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3a/v3/53nPiSk7RY-lOb5o16vudQ/zh-cn_image_0000002194010320.png?HW-CC-KV=V1&HW-CC-Date=20260313T023724Z&HW-CC-Expire=86400&HW-CC-Sign=EF05F0EEF15FC03B130DE8D5A7AD738ED4E4C9E5862E4155BBCD21ECBFB4205A "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-controlling-background-process-cpu*