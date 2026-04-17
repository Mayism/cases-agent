---
title: 导入Sample工程
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-import-sample
category: 指南
updated_at: 2026-03-13T04:07:06.184Z
---

# 导入Sample工程

DevEco Studio支持Sample工程的导入功能，通过对接Gitee开源社区中的Sample资源，可一键导入Sample工程到DevEco Studio中。下面介绍导入Sample的方法。

## 约束与限制

### 支持的国家/地区

该功能仅支持中国境内（香港特别行政区、澳门特别行政区、中国台湾除外）。

## 操作步骤

1.  在DevEco Studio的欢迎页，进入**Customize** **> All Settings... > Version Control > Git**界面，单击**Test**按钮检测是否安装Git工具。
    
    说明
    
    在打开工程的情况下，可以单击**File > Settings**（macOS为**DevEco Studio > Preferences/Settings**）进入设置界面。
    
    -   已安装，请根据[2](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-import-sample#li1599692216194)开始导入Sample。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2b/v3/wPzk2GNAQbCyEA9IUxpPdg/zh-cn_image_0000002501070074.png?HW-CC-KV=V1&HW-CC-Date=20260313T040626Z&HW-CC-Expire=86400&HW-CC-Sign=9EA8D70188AAB666B3149FB267106D49F2A6820D89E383F360144FE0A72D954D)
        
    -   未安装，请单击**Download and Install**，DevEco Studio会自动下载并安装。安装完成后，请根据[2](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-import-sample#li1599692216194)开始导入Sample。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/99/v3/IMX-Rf6ATwaq5JEsj6m_DQ/zh-cn_image_0000002532670147.png?HW-CC-KV=V1&HW-CC-Date=20260313T040626Z&HW-CC-Expire=86400&HW-CC-Sign=5E25A8B65352B1B8671157E7938A2204BAC05DD5CB2826E0B608F196A660CD37)
        
    
2.  在DevEco Studio的欢迎页，在**Projects**页签下，单击**M****ore Action >** **Import Sample**按钮，导入Sample工程。
    
    说明
    
    在打开工程的情况下，可以单击**File > New > Import > Import Sample**来进行导入。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4c/v3/PTSNbUSGT-SxCIoLygdmcQ/zh-cn_image_0000002532670149.png?HW-CC-KV=V1&HW-CC-Date=20260313T040626Z&HW-CC-Expire=86400&HW-CC-Sign=541A8F77F47E3C20D63AC1698357BA210517D52877DCBE8C47AD5C8A0E95ED3C)
    
3.  选择需要导入的Sample工程，然后单击**Next**。
4.  设置**Project name**和**Project location**，然后单击**Finish**，等待Sample工程导入完成。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/60/v3/ViAUMj4nQsymwXne2OArKQ/zh-cn_image_0000002501070072.png?HW-CC-KV=V1&HW-CC-Date=20260313T040626Z&HW-CC-Expire=86400&HW-CC-Sign=D504DAA7FDC27288F84D4A4A6BE23F342E2AAC85ADCFE89C36B40EC2BA28C042)
    
5.  导入Sample后，等待工程同步完成即可。
    
    说明
    
    如果网络受限，导入时会提示“Failed to connect to gitee.com port 443: Time out”连接超时错误，请[配置Git代理信息](https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-development-environment-2)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-import-sample*