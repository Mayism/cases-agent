---
title: 如何将多工程的HAP打包成一个App
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-package-structure-35
category: FAQ
updated_at: 2026-03-13T02:43:23.233Z
---

# 如何将多工程的HAP打包成一个App

1.  分别对不同工程的模块进行打包，执行DevEco Studio中的Build Hap指令。在outputs文件夹下获取未签名的hap包和pack.info文件。
2.  合并所有模块的pack.info文件，生成app级别的pack.info文件，格式如下。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/dd/v3/qA8iMbkpRwSamyUKKy4-Qw/zh-cn_image_0000002344840905.png?HW-CC-KV=V1&HW-CC-Date=20260313T024318Z&HW-CC-Expire=86400&HW-CC-Sign=E746127105D2F1BF32EDFAAFD5C2118F982F2C22E73E47EAD4975DB130AE5D3A)
    
    summary.app为整个包的配置信息，保证唯一。summary.modules和packages取模块级别pack.info文件中相对应的第1个值填入。
    
3.  在SDK toolchains工具的lib文件夹下执行以下命令打包未签名的app包：\`java -jar app\_packing\_tool.jar --mode app --force true --pack-info-path \[pack.info 文件路径\] --hap-path \[hap 包路径，使用逗号隔开\] --out-path \[输出 app 包路径，以 .app 结尾\]。
4.  签名app包在SDK toolchains工具lib文件下执行指令java -jar hap-sign-tool.jar sign-app -mode localSign -keystoreFile \[P12签名文件\] -keystorePwd \[keystorePwd\] -keyAlias \[keyAlias\] -keyPwd \[keyPwd\] -signAlg \[signAlg\] -profileFile \[P7b签名文件\] -appCertFile \[CER签名文件\] -inFile \[未签名App包路径\] -outFile \[签名App包路径\]。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-package-structure-35*