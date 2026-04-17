---
title: 订阅或取消订阅KIA文件拷贝、重命名和压缩事件
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/fileguard-kia-event
category: 指南
updated_at: 2026-03-12T12:50:30.854Z
---

# 订阅或取消订阅KIA文件拷贝、重命名和压缩事件

## 场景介绍

为应用提供监听或取消监听KIA文件拷贝、重命名和压缩事件的能力，当KIA文件发生变种时，通过回调函数，返回KIA变种信息。

## 接口说明

详细接口说明可参考[接口文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/dataguard-fileguard)。

| 接口名 | 描述 |
| --- | --- |
| [on](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/dataguard-fileguard#section1970915372527) | 订阅事件监听，需在业务初始化时注册。当用户拷贝KIA文件时会触发回调。 |
| [off](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/dataguard-fileguard#section17735575217) | 取消订阅KIA文件拷贝事件监听。 |
| [on](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/dataguard-fileguard#section35573470434) | 订阅事件监听，需在业务初始化时注册。当用户重命名KIA文件时会触发回调。 |
| [off](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/dataguard-fileguard#section35611847134314) | 取消订阅KIA文件重命名事件监听。 |
| [on](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/dataguard-fileguard#section10111185510433) | 订阅事件监听，需在业务初始化时注册。当用户压缩KIA文件时会触发回调。 |
| [off](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/dataguard-fileguard#section5115755104315) | 取消订阅KIA文件压缩事件监听。 |

## 开发步骤

1.  导入模块。
    
    ```typescript
    import { fileGuard } from '@kit.EnterpriseDataGuardKit';
    ```
    
2.  初始化[FileGuard](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/dataguard-fileguard#section18457214114215)对象guard，调用接口on或off，订阅或取消订阅KIA文件拷贝、重命名和压缩事件。
    
    ```typescript
    function onKiaCopyCallback(eventData: string) {
      console.info(`Succeeded in receiving kia copy eventData: ${eventData}.`);
    }
    function onKiaRenameCallback(eventData: string) {
      console.info(`Succeeded in receiving kia rename eventData: ${eventData}.`);
    }
    function onKiaCompressCallback(eventData: string) {
      console.info(`Succeeded in receiving kia compress eventData: ${eventData}.`);
    }
    function listenKIAEvent() {
      let guard: fileGuard.FileGuard = new fileGuard.FileGuard();
      try {
        guard.on('kiaCopy', onKiaCopyCallback);
        guard.on('kiaRename', onKiaRenameCallback);
        guard.on('kiaCompress', onKiaCompressCallback);
      } catch (e) {
        console.error(`Failed to monitor the kia event. Code: ${e.code}, message: ${e.message}.`);
      }
      try {
        guard.off('kiaCopy');
        guard.off('kiaRename');
        guard.off('kiaCompress');
      } catch (e) {
        console.error(`Failed to cancel monitoring the kia event. Code: ${e.code}, message: ${e.message}.`);
      }
    }
    ```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/fileguard-kia-event*