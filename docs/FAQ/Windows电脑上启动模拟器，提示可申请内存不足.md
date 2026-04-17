---
title: Windows电脑上启动模拟器，提示可申请内存不足
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-running-39
category: FAQ
updated_at: 2026-03-13T05:54:42.035Z
---

# Windows电脑上启动模拟器，提示可申请内存不足

**问题现象**

启动模拟器时，如果系统提示“当前可申请的内存不足”，表示Windows电脑内存不足。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/da/v3/OpYzSJcJRBqeq8aH6t6u6A/zh-cn_image_0000002229604313.png?HW-CC-KV=V1&HW-CC-Date=20260313T055437Z&HW-CC-Expire=86400&HW-CC-Sign=1D40974314F20B0CD11BEFEDA9CA38D86A1771D5823289BF49AE38A6BE836CAF)

**解决措施**

1.  打开任务管理器的详细信息页面，在列表表头右键选择列，勾选“提交大小”，然后点击“提交大小”列进行排序，关闭提交大小占用高的进程。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1/v3/mRK8GY_1T3SFaQ78UCSWkA/zh-cn_image_0000002229758817.png?HW-CC-KV=V1&HW-CC-Date=20260313T055437Z&HW-CC-Expire=86400&HW-CC-Sign=B59A655877F8C082157C40C2BD7D71969DD5CED7F9909B559BE603F17F029AD8 "点击放大")
    
2.  打开任务管理器的性能和内存页面，确保已提交内存的剩余量大于模拟器设置的RAM大小。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/47/v3/Ek0g2UxyTe2okfg1OsmNSA/zh-cn_image_0000002194158932.png?HW-CC-KV=V1&HW-CC-Date=20260313T055437Z&HW-CC-Expire=86400&HW-CC-Sign=135F8715849FB875830DEFEBD807C828C35CB55E19A866E8E74EB808E00F06E6)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-running-39*