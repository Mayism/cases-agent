---
title: 如何使用DevEco Studio上的Git工具进行多远程仓管理
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-project-management-19
category: FAQ
updated_at: 2026-03-13T05:26:25.464Z
---

# 如何使用DevEco Studio上的Git工具进行多远程仓管理

添加新的远程仓库：

1.  右击Remote以调出菜单。
2.  点击Manage Remotes，打开Git Remotes窗口。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c1/v3/98oVo1ALTX-YgJb2xEatVA/zh-cn_image_0000002194318352.png?HW-CC-KV=V1&HW-CC-Date=20260313T052620Z&HW-CC-Expire=86400&HW-CC-Sign=636F90B0D9648A5F34561C0B9A7085EB55DA36668E0058C29FE4BD4435A6D570)
    
3.  点击添加按钮。
4.  输入远程仓名称和URL，远程仓名称可自由命名。
5.  点击Define Remote窗口的OK按钮，在新弹出的窗口中输入域账号和密码。
6.  点击Git Remotes窗口的确定按钮。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/22/v3/NBBKOKoZRm-b4_mibSiOaQ/zh-cn_image_0000002229604125.png?HW-CC-KV=V1&HW-CC-Date=20260313T052620Z&HW-CC-Expire=86400&HW-CC-Sign=FF9B41F8AA679C77E651F289B63B945899E14D69DC1AB4FDD4A4B7C42B2908C5 "点击放大")
    
7.  点击拉取远程记录，新添加的远程仓库将在Remote子菜单中显示。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/59/v3/JFMN47m_TJGHWm66ccQPfA/zh-cn_image_0000002229758613.png?HW-CC-KV=V1&HW-CC-Date=20260313T052620Z&HW-CC-Expire=86400&HW-CC-Sign=582C45C697D953D9509D7055BB5D8CC0E20E0FB8AD612CB8DE39CFFBB77B7D44)
    

Push提交：

Push提交和Push提交到远程仓库的过程相似。如需切换远程仓库，可单击下图中标记1的分支名；标记3表示以PR方式提交。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2e/v3/69uQzlJpR7ORquTxFXWIDg/zh-cn_image_0000002194158744.png?HW-CC-KV=V1&HW-CC-Date=20260313T052620Z&HW-CC-Expire=86400&HW-CC-Sign=F92B23E9B74DFF4192A471882294DAE7D44CE21C98B7A5ABC00DDBBF917CDB54 "点击放大")

切换默认关联的远程仓库：

可以使用以下命令进行切换。

```vbnet
git branch hmos_dev_20230907 --set-upstream-to=codehub_origin/hmos_dev_20230907
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-project-management-19*