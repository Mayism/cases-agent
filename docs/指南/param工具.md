---
title: param工具
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/param-tool
category: 指南
updated_at: 2026-03-12T15:41:01.372Z
---

# param工具

param是为开发人员提供用于操作系统参数的工具，该工具只支持标准系统。

## 环境要求

-   获取hdc工具，执行hdc shell。
-   正常连接设备。

## param工具命令列表

| 选项 | 说明 |
| --- | --- |
| -h | 获取param支持的命令。 |
| ls [-r] [name] | 显示匹配name的系统参数信息。带"-r"则根据参数权限获取信息，不带"-r"则直接获取参数信息。 |
| get [name] | 获取指定name系统参数的值；若不指定任何name，则返回所有系统参数。 |
| set name value | 设置指定name系统参数的值为value。 |
| wait name [value] [timeout] | 同步等待指定name系统参数与指定值value匹配。value支持模糊匹配，如"*"表示任何值，"val*"表示只匹配前三个val字符。timeout为等待时间（单位：s），不设置则默认为30s。 |
| save | 保存persist参数到工作空间。 |

## 获取param支持的命令

-   获取param支持的命令，命令格式如下：
    
    ```bash
    param -h
    ```
    

## 获取系统参数信息

-   显示匹配name的系统参数信息，命令格式如下：
    
    ```bash
    param ls [-r] [name]
    ```
    
    **示例**
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/37/v3/YMubLT0DQ6a3yekPqldQGQ/zh-cn_image_0000002527377038.png?HW-CC-KV=V1&HW-CC-Date=20260312T154017Z&HW-CC-Expire=86400&HW-CC-Sign=68A81F086211232B9CF1B403452C1B1250E2CBFDFF47EC2844393866C4135393)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d2/v3/XRtHp6hVTCupfHY3iu9CMA/zh-cn_image_0000002558536817.png?HW-CC-KV=V1&HW-CC-Date=20260312T154017Z&HW-CC-Expire=86400&HW-CC-Sign=5567BD4AFCDC904887681F7AF6B370C0D6CFE128EAAFD1CA94579CB37D325A22)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/be/v3/F_CMdZedRque9PGBdQJsBQ/zh-cn_image_0000002527217086.png?HW-CC-KV=V1&HW-CC-Date=20260312T154017Z&HW-CC-Expire=86400&HW-CC-Sign=FE961671A835D4415FE6715B82BC168DCFF5DD5BFC4CE03FE82BF276A4928315)
    

## 获取系统参数的值

-   获取指定name系统参数的值，命令格式如下：
    
    ```bash
    param get [name]
    ```
    
    **示例**
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/79/v3/u888ebXkQB6cBPT1Jlm9Hw/zh-cn_image_0000002558376921.png?HW-CC-KV=V1&HW-CC-Date=20260312T154017Z&HW-CC-Expire=86400&HW-CC-Sign=27CB5161EA2CDC274410C46590E21CD173E245A823BBF044F713EA7056A7908F)
    

## 设置系统参数的值

-   设置指定name系统参数的值为value，命令格式如下：
    
    ```bash
    param set name value
    ```
    
    **示例**
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8a/v3/5t91dS9tQgGsUq-5lF0kyg/zh-cn_image_0000002527377040.png?HW-CC-KV=V1&HW-CC-Date=20260312T154017Z&HW-CC-Expire=86400&HW-CC-Sign=A7FF60B6FC0CEA27B72844186754414151CBCAC3CFA9705446FDD9A588BF2766)
    

## 等待系统参数值匹配

-   同步等待指定name系统参数与指定值value匹配，命令格式如下：
    
    ```bash
    param wait name [value] [timeout]
    ```
    
    **示例**
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/74/v3/P2HzZTfZRbORXwRFLqdrXQ/zh-cn_image_0000002558536819.png?HW-CC-KV=V1&HW-CC-Date=20260312T154017Z&HW-CC-Expire=86400&HW-CC-Sign=B2317B3F69301FEB7D73D9F779EC29F55155A04508D0AD3D210039769E64B160)
    

## 保存persist(可持久化)参数

-   保存persist(可持久化)参数到工作空间，命令格式如下：
    
    ```bash
    param save
    ```
    
    **示例**
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f8/v3/CLTL75eRR1i9o0kqAZiD5w/zh-cn_image_0000002527217088.png?HW-CC-KV=V1&HW-CC-Date=20260312T154017Z&HW-CC-Expire=86400&HW-CC-Sign=F13849155B5F09670EC9EB099C2D24BA5DBACE5ECCEE3B2BA79F224818F6626B)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/param-tool*