---
title: 设置KIA文件水印图片
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/fileguard-set-kia-watermark
category: 指南
updated_at: 2026-03-12T12:50:31.747Z
---

# 设置KIA文件水印图片

## 场景介绍

为应用提供设置KIA文件水印图片能力。

## 接口说明

详细接口说明可参考[接口文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/dataguard-fileguard)。

| 接口名 | 描述 |
| --- | --- |
| [setKiaWatermarkImage](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/dataguard-fileguard#section7932161212533) | 使用Promise方式设置KIA文件水印图片。 |

## 开发步骤

1.  导入模块。
    
    ```typescript
    import { fileGuard } from '@kit.EnterpriseDataGuardKit';
    ```
    
2.  初始化[FileGuard](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/dataguard-fileguard#section18457214114215)对象guard，调用接口[setKiaWatermarkImage](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/dataguard-fileguard#section7932161212533)，设置KIA文件水印图片。
    
    ```typescript
    import { fileIo as fs } from '@kit.CoreFileKit';
    import { BusinessError } from '@kit.BasicServicesKit';
    async function testSetKiaWaterMarkImage() {
      try {
        let guard: fileGuard.FileGuard = new fileGuard.FileGuard();
        let imagePath: string = '/data/service/el2/100/hmdfs/account/files/Docs/Documents/1.png';
        let fd: number = await guard.openFile(imagePath);
        let stat: fs.Stat = fs.statSync(fd);
        let buffer: ArrayBuffer = new ArrayBuffer(stat.size);
        fs.readSync(fd, buffer);
        let image: Uint8Array = new Uint8Array(buffer);
        let info: string = new Date().toLocaleString();
        guard.setKiaWatermarkImage(image, info).then(() => {
          console.info(`Succeeded in setting the watermark image for Kia file.`);
        }).catch((err: BusinessError) => {
          console.error(`Failed to set the watermark image for Kia file. Code: ${err.code}, message: ${err.message}.`);
        })
      } catch (e) {
        console.error(`[scanFileGuard] testSetKiaWaterMarkImage Exception, Code: ${e.code}, message: ${e.message}`);
      }
    }
    ```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/fileguard-set-kia-watermark*