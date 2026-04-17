---
title: 设置KIA文件列表
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/fileguard-kia-file-list
category: 指南
updated_at: 2026-03-12T12:50:08.950Z
---

# 设置KIA文件列表

## 场景介绍

Enterprise Data Guard Kit为应用提供设置KIA文件列表的能力，HarmonyOS系统根据管控策略对KIA文件列表中的文件实行管控。

## 接口说明

详细接口说明可参考[接口文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/dataguard-fileguard)。

| 接口名 | 描述 |
| --- | --- |
| [setKiaFilelist](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/dataguard-fileguard#section276855317514) | 使用Callback方式设置KIA文件列表。 |
| [setKiaFilelist](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/dataguard-fileguard#section920033180) | 使用Promise方式设置KIA文件列表。 |

## 开发步骤

1.  导入模块。
    
    ```typescript
    import { fileGuard } from '@kit.EnterpriseDataGuardKit';
    ```
    
2.  初始化[FileGuard](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/dataguard-fileguard#section18457214114215)对象guard，将KIA文件列表对象转为字符串，调用接口setKiaFilelist，设置KIA文件列表。
    
    -   通过回调函数方式，设置KIA文件列表。
    
    ```typescript
    import { BusinessError } from '@kit.BasicServicesKit';
    function setKiaFilelistCallback() {
      let guard: fileGuard.FileGuard = new fileGuard.FileGuard();
      let fileListStr: string = '{' +
        '"kia_filelist":' +
        '["' +
        '/data/service/el2/100/hmdfs/account/files/Documents/Desktop/aaa.docx",' +
        '"/data/service/el2/100/hmdfs/account/files/Documents/Desktop/bbb.docx"' +
        ']' +
        '}';
      guard.setKiaFilelist(fileListStr, (err: BusinessError) => {
        if (err) {
          console.error(`Failed to set the list of KIA file. Code: ${err.code}, message: ${err.message}.`);
        } else {
          console.info(`Succeeded in setting the list of KIA file.`);
        }
      });
    }
    ```
    
    -   通过Promise方式，设置KIA文件列表。
    
    ```typescript
    import { BusinessError } from '@kit.BasicServicesKit';
    function setKiaFilelistPromise() {
      let guard: fileGuard.FileGuard = new fileGuard.FileGuard();
      let fileListStr: string = '{' +
        '"kia_filelist":' +
        '["' +
        '/data/service/el2/100/hmdfs/account/files/Documents/Desktop/aaa.docx",' +
        '"/data/service/el2/100/hmdfs/account/files/Documents/Desktop/bbb.docx"' +
        ']' +
        '}';
      guard.setKiaFilelist(fileListStr).then(() => {
        console.info(`Succeeded in setting the list of KIA file.`);
      }).catch((err: BusinessError) => {
        console.error(`Failed to set the list of KIA file. Code: ${err.code}, message: ${err.message}.`);
      });
    }
    ```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/fileguard-kia-file-list*