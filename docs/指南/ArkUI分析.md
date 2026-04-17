---
title: ArkUI分析
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-arkui-analysis
category: 指南
updated_at: 2026-03-13T05:15:26.455Z
---

# ArkUI分析

ArkUI分析用于定位由于组件耗时、页面布局、状态变量更新导致的卡顿问题。常见场景包含：

场景1：布局嵌套过多引起的性能问题；

场景2：数据结构设计不合理，应用使用一个较大的Object，在更新时，只更新某些属性，导致其他没变化的属性也会更新，产生冗余刷新；

场景3：父组件中的子组件重复绑定同一个状态变量进行更新；

场景4：未正确使用装饰器，如错误使用@Prop传递一个大的对象进行深度拷贝。

## ArkUI Component 泳道：查看组件绘制耗时

开发者通过ArkUI Component泳道可以直观感知组件绘制频率、耗时等统计情况。

1.  在时间轴上拖拽鼠标选定要查看的时间段。
2.  详情区Summary列表给出录制时段内定制组件以及系统组件的绘制统计情况，包括绘制次数、总耗时、最小耗时、平均耗时、最大耗时、耗时标准差。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/40/v3/mERB-JAzTUKR4K_beIjPkA/zh-cn_image_0000002532669845.png?HW-CC-KV=V1&HW-CC-Date=20260313T051449Z&HW-CC-Expire=86400&HW-CC-Sign=20EB4EDD45E6CA1A964357ECAC9A1F708A805E0EB85881BE4AC93DA0D22CB0AD "点击放大")
    
3.  详情区Details列表可以查看按照时间线排序的组件详情，同时more区域展示以该组件为根节点的组件树信息。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/dd/v3/D_KRncYNTLSrXSIL0qkpqg/zh-cn_image_0000002501069774.png?HW-CC-KV=V1&HW-CC-Date=20260313T051449Z&HW-CC-Expire=86400&HW-CC-Sign=C03608CD34C224CFB914E1601A6B84E3493FEA7C4E40661A773E9415BEDBBA40 "点击放大")
    
4.  点选ArkUI Component泳道中的条块，展示Slice Detail数据，Slice Detail中的Name支持跳转至对应Process子泳道并选中trace信息，同时more区域展示以该组件为根节点的组件树信息。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/89/v3/v06M1YVqQ3eF7tULuNgNCA/zh-cn_image_0000002532749799.png?HW-CC-KV=V1&HW-CC-Date=20260313T051449Z&HW-CC-Expire=86400&HW-CC-Sign=AC34169726A10FBBE7141BB4B23CF3A45AA01FF368C5F8913D5D93A4D7D83830 "点击放大")
    
    说明
    
    由于隐私安全政策，已上架应用市场的应用不支持录制ArkUI Component泳道。
    

## ArkUI State 泳道分析

1.  点击ArkUI模板创建session并启动录制，录制过程中触发组件刷新。
2.  录制结束等待处理数据完成。点击ArkUI State泳道，可在下方数据区查看录制过程中发生的状态变量变化。Summary区域可查看状态变量名称，变化次数，状态变量类型、所属组件和所属类。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/67/v3/sl1eY8y2TwaEAvUPGOcqLA/zh-cn_image_0000002532749793.png?HW-CC-KV=V1&HW-CC-Date=20260313T051449Z&HW-CC-Expire=86400&HW-CC-Sign=D7217ADFFDFDC05216AA4E7C1685774888E071BE8735C0A8C0A5A389D3E6D441 "点击放大")
    
    Current Value以时间顺序展示状态变量变化，Current Values列展示变化后的值。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d2/v3/HWWqSDgHRAuYjcR19cs3oQ/zh-cn_image_0000002501069776.png?HW-CC-KV=V1&HW-CC-Date=20260313T051449Z&HW-CC-Expire=86400&HW-CC-Sign=EB08E0CB18908C172FFF3ABDA1ECF9255EC5ED8BD149DB3D89C57AE54BEDE9ED "点击放大")
    
3.  选择Current Value中某一个数据，泳道区域将以虚线展示其时间位置。同时，右侧More区域展示该状态变量影响的组件关联关系。打开页面下方的**Delivery Chain**开关，该状态变量影响的组件关联关系将以图形展示。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/99/v3/mFmzcU_hTkuWprgGlrJbhg/zh-cn_image_0000002500909926.png?HW-CC-KV=V1&HW-CC-Date=20260313T051449Z&HW-CC-Expire=86400&HW-CC-Sign=D15FF3FC22282BC433D10C5E99D570902EDBA075B6A9193C4079D2BB8DB9403A "点击放大")
    
4.  定位到可能造成卡顿的状态变量变化时间点，框选对应时间段，选择ArkUI Component泳道查看对应组件刷新时间。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/70/v3/9thWNUoARSGi8XxAXK9xxg/zh-cn_image_0000002501069778.png?HW-CC-KV=V1&HW-CC-Date=20260313T051449Z&HW-CC-Expire=86400&HW-CC-Sign=6246E04468A2F82EABA0D582572AFFFFC90B170351BAAACFC6136FDC33C3E91B "点击放大")
    

说明

-   如需查看其他泳道信息，请参考[Frame分析](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-insight-session-frame)。
-   由于隐私安全政策，已上架应用市场的应用不支持录制ArkUI State泳道。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-arkui-analysis*