---
title: 通过API获取系统信息属性
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/scenario-fusion-api-system-info
category: 指南
updated_at: 2026-03-13T00:59:58.000Z
---

# 通过API获取系统信息属性

## 场景介绍

Scenario Fusion Kit提供获取系统信息属性API，调用该接口可以获取设备、网络状态、屏幕、语言、主题等系统信息属性。

## 约束和限制

场景化API支持Phone、Tablet和2in1设备，并且从5.1.0(18)版本开始，新增支持Wearable和TV设备。

## 接口说明

以下是获取系统信息属性的接口说明，更多接口及使用方法请参见[atomicService（融合场景化API）](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/scenario-fusion-atomicservice)。

| 接口名 | 描述 |
| --- | --- |
| [getSystemInfoSync](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/scenario-fusion-atomicservice#section1465318121834) | [getSystemInfo](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/scenario-fusion-atomicservice#section17779133174510) |

## 开发步骤

1.  导入Scenario Fusion Kit模块以及相关公共模块。
    
    ```typescript
    import { atomicService } from '@kit.ScenarioFusionKit';
    import { hilog } from '@kit.PerformanceAnalysisKit';
    ```
    
2.  传入属性参数，调用接口获取对应属性值，代码如下：
    
    ```typescript
    let stateArray: Array<atomicService.SystemInfoType> =
      ['brand', 'deviceModel', 'screenWidth', 'screenHeight', 'language', 'osFullName', 'fontSizeSetting',
        'sdkApiVersion', 'bluetoothEnabled', 'wifiEnabled', 'locationEnabled', 'deviceOrientation', 'theme'];
    try {
      let data = atomicService.getSystemInfoSync(stateArray);
      hilog.info(0x0000, 'testTag', 'succeeded in getting system info');
      let brand: string | undefined = data.brand;
      let deviceModel: string | undefined = data.deviceModel;
      let screenWidth: number | undefined = data.screenWidth;
      let screenHeight: number | undefined = data.screenHeight;
      let language: string | undefined = data.language;
      let osFullName: string | undefined = data.osFullName;
      let fontSizeSetting: number | undefined = data.fontSizeSetting;
      let sdkApiVersion: number | undefined = data.sdkApiVersion;
      let bluetoothEnabled: boolean | undefined = data.bluetoothEnabled;
      let wifiEnabled: boolean | undefined = data.wifiEnabled;
      let locationEnabled: boolean | undefined = data.locationEnabled;
      let deviceOrientation: string | undefined = data.deviceOrientation;
      let theme: ColorMode | undefined = data.theme;
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'failReason: %{public}d %{public}s', error.code, error.message);
    }
    ```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/scenario-fusion-api-system-info*