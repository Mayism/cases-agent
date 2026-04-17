---
title: 使用PixelMap完成图像变换
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/image-transformation
category: 指南
updated_at: 2026-03-12T16:42:23.362Z
---

# 使用PixelMap完成图像变换

图片处理指对PixelMap进行相关的操作，如获取图片信息、裁剪、缩放、偏移、旋转、翻转、设置透明度、读写像素数据等。图片处理主要包括图像变换、[位图操作](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/image-pixelmap-operation)，本文介绍图像变换。

## 开发步骤

图像变换相关API的详细介绍请参见[API参考](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-image-pixelmap)。

1.  完成[图片解码](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/image-decoding)，获取PixelMap对象。
    
2.  获取图片信息。
    
    ```typescript
    import { BusinessError } from '@kit.BasicServicesKit';
    // 获取图片大小。
    pixelMap.getImageInfo().then( (info : image.ImageInfo) => {
      console.info('info.width = ' + info.size.width);
      console.info('info.height = ' + info.size.height);
    }).catch((err : BusinessError) => {
      console.error("Failed to obtain the image pixel map information.And the error is: " + err);
    });
    ```
    
3.  进行图像变换操作。
    
    原图：
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cd/v3/jxm-gV8bTWiPFF_jTzhB6g/zh-cn_image_0000002527217148.jpeg?HW-CC-KV=V1&HW-CC-Date=20260312T164115Z&HW-CC-Expire=86400&HW-CC-Sign=34676AFF8E9C91441F3E125DFF5D1C8772AE2BD746EB6674438A251F9902E22F)
    
    -   裁剪
        
        ```typescript
        // x：裁剪起始点横坐标0。
        // y：裁剪起始点纵坐标0。
        // height：裁剪高度400，方向为从上往下（裁剪后的图片高度为400）。
        // width：裁剪宽度400，方向为从左到右（裁剪后的图片宽度为400）。
        pixelMap.crop({x: 0, y: 0, size: { height: 400, width: 400 } });
        ```
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/53/v3/-DfZBVMYRoKzEXN7WZy_0g/zh-cn_image_0000002558376983.jpeg?HW-CC-KV=V1&HW-CC-Date=20260312T164115Z&HW-CC-Expire=86400&HW-CC-Sign=64FAFE77B1E38302C1C34A3193D4948E33438EDA094ABF47E33B42B67A0FF6F8)
        
    -   缩放
        
        ```typescript
        // 宽为原来的0.5。
        // 高为原来的0.5。
        pixelMap.scale(0.5, 0.5);
        ```
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3d/v3/mBL0nLa-Qg2Kebc2r2sbWg/zh-cn_image_0000002527377102.jpeg?HW-CC-KV=V1&HW-CC-Date=20260312T164115Z&HW-CC-Expire=86400&HW-CC-Sign=7BF785B2D47CE9400DC90C3F3D6CD77B93415839D9EA88D8CDE1A5E9373ED6C0)
        
    -   偏移
        
        ```typescript
        // 向下偏移100。
        // 向右偏移100。
        pixelMap.translate(100, 100);
        ```
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/93/v3/b4Hms2puTFWu-pHQN4xVIA/zh-cn_image_0000002558536881.jpeg?HW-CC-KV=V1&HW-CC-Date=20260312T164115Z&HW-CC-Expire=86400&HW-CC-Sign=057B46F66E2D45B944F21DFB9291B323ACA9CE55209B27DA60AF36D083DCE988)
        
    -   旋转
        
        ```typescript
        // 顺时针旋转90°。
        pixelMap.rotate(90);
        ```
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/15/v3/jP9CXIySQkqdsvH4VV-LRQ/zh-cn_image_0000002527217150.jpeg?HW-CC-KV=V1&HW-CC-Date=20260312T164115Z&HW-CC-Expire=86400&HW-CC-Sign=81AFCDF19AD0812D6775E9B04F972ED9A26650367ABAA1E7BEF99F6AEDC3E37C)
        
    -   翻转
        
        ```typescript
        // 垂直翻转。
        pixelMap.flip(false, true);
        ```
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b8/v3/R-tYpCQMTzmKOR4AdyYdrg/zh-cn_image_0000002558376985.jpeg?HW-CC-KV=V1&HW-CC-Date=20260312T164115Z&HW-CC-Expire=86400&HW-CC-Sign=EC644682C0A10FE7AF3A912A6CB76ADC28DF9ECD6D02874E8CB58BFB64880B33)
        
        ```typescript
        // 水平翻转。
        pixelMap.flip(true, false);
        ```
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/89/v3/ZWzkMCCJR2ee5BYwATMHRw/zh-cn_image_0000002527377104.jpeg?HW-CC-KV=V1&HW-CC-Date=20260312T164115Z&HW-CC-Expire=86400&HW-CC-Sign=881A2B52C4CB97B6A4D5F663AEBB9C98626F20A1A3C5E0804BA83EB4F651AF51)
        
    -   透明度
        
        ```typescript
        // 透明度0.5。
        pixelMap.opacity(0.5);
        ```
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/29/v3/BDBL6uQ8SS6FWjQRaC1Bgg/zh-cn_image_0000002558536883.png?HW-CC-KV=V1&HW-CC-Date=20260312T164115Z&HW-CC-Expire=86400&HW-CC-Sign=5FA469885E1E64838BC4A869BE21E1A05260D0F98E0FF7F8E188413C2AE59F18)
        

## 示例代码

-   [拼图](https://gitcode.com/HarmonyOS_Samples/game-puzzle)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/image-transformation*