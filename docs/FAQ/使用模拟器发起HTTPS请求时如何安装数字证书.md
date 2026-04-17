---
title: 使用模拟器发起HTTPS请求时如何安装数字证书
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-running-27
category: FAQ
updated_at: 2026-03-13T05:53:04.713Z
---

# 使用模拟器发起HTTPS请求时如何安装数字证书

**问题现象**

在使用网络代理发送HTTPS请求时，需要安装网站服务器的数字证书。

**解决措施**

1.  将证书拖拽上传至模拟器，可在文件管理的“我的手机”>“下载”目录下查看上传的文件。
2.  安装证书的方式如下：
    -   点击**设置 > WLAN >**![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/31/v3/Cp8_FTLIQDCbAW15X9pbNA/zh-cn_image_0000002395407910.png?HW-CC-KV=V1&HW-CC-Date=20260313T055259Z&HW-CC-Expire=86400&HW-CC-Sign=FCA59942EE9101D2A1D49DBBC1F51D837DB6BE6ED1480FFE38F67A99255FB462)**\> 安装证书 > CA证书**，选择pem格式证书进行安装。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/82/v3/YepOrakiTPimcQnhOR613w/zh-cn_image_0000002229758177.png?HW-CC-KV=V1&HW-CC-Date=20260313T055259Z&HW-CC-Expire=86400&HW-CC-Sign=AC262751900001A227B05562F573784E13558E0F7F3B0E502C046186F90D9AE6) ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6a/v3/6g2DkQq4TLG-9QsGHjO55A/zh-cn_image_0000002194317924.png?HW-CC-KV=V1&HW-CC-Date=20260313T055259Z&HW-CC-Expire=86400&HW-CC-Sign=BBB4A8145F8C673F1746E7AD75A9F52826E4E68E6EB73BD719E40596531775CA)
        
    -   在本机命令行窗口中使用以下命令打开证书管理。
        
        ```css
        hdc shell aa start -a MainAbility -b com.ohos.certmanager
        ```
        
        选择从存储设备安装，安装pem格式的证书。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-running-27*