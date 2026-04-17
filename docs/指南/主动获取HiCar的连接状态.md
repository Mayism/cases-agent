---
title: 主动获取HiCar的连接状态
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/car-check-application-start
category: 指南
updated_at: 2026-03-12T14:12:56.572Z
---

# 主动获取HiCar的连接状态

## 场景介绍

生态应用可以通过主动获取智慧出行连接状态接口来获取HiCar的连接状态（如：判断应用是否在HiCar上拉起）。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5b/v3/6LmCLKdsSp-yls07NiMZUw/zh-cn_image_0000002481508418.png?HW-CC-KV=V1&HW-CC-Date=20260312T141216Z&HW-CC-Expire=86400&HW-CC-Sign=3A05D966ABB83C5F15C30DE28DDF8B23D495B3125066D4DA87F493ADD396A157 "点击放大")

## 接口说明

获取HiCar连接状态的接口如下：

| 接口名 | 描述 |
| --- | --- |
| [getSmartMobilityStatus](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/car-smartmobilitycommon#section98392519331) | 获取智慧出行连接状态。 |

### SmartMobilityInfo说明

SmartMobilityInfo状态（status）取值如下：

| 编号 | 状态 | 描述 |
| --- | --- | --- |
| 0 | IDLE | 空闲态。 |
| 1 | RUNNING | 运行态。 |

SmartMobilityInfo业务类型（type）取值如下：

| 编号 | 业务类型 | 描述 |
| --- | --- | --- |
| 0 | HICAR | HiCar。 |
| 1 | SUPER_LAUNCHER | 超级桌面。 |
| 2 | CAR_HOP | 流转。 |

SmartMobilityInfo业务数据（data）参数如下：

| 编号 | 参数 | 描述 |
| --- | --- | --- |
| 0 | DEVICE_TYPE | 设备类型。 |
| 1 | DISPLAY_ID | 业务所在的虚拟屏ID。 |
| 2 | IS_PHONE_DESKTOP | 当前是否在HiCar上显示手机桌面（仅在HiCar业务中展示）。 |

## 开发步骤

1.  导入相关模块。
    
    ```javascript
    import { smartMobilityCommon } from '@kit.CarKit';
    import { UIAbility } from '@kit.AbilityKit';
    import { hilog } from '@kit.PerformanceAnalysisKit'
    ```
    
2.  查询智慧出行连接状态。
    
    应用在适配HiCar时，可以实时查询接口来获取智慧出行连接状态（如：判断应用是否在HiCar上）。
    
    ```typescript
    export default class EntryAbility extends UIAbility {
      isAppOnHiCar(): boolean {
        try {
          // 应用所在的屏幕id
          const currentDisplayId = this.context.config.displayId;
          // 获取SmartMobilityAwareness实例
          let awareness: smartMobilityCommon.SmartMobilityAwareness = smartMobilityCommon.getSmartMobilityAwareness();
          // 获取当前智慧出行连接状态
          let info: smartMobilityCommon.SmartMobilityInfo =
            awareness.getSmartMobilityStatus(smartMobilityCommon.SmartMobilityType.HICAR);
          const deviceDisplayId = Number(info.data["DISPLAY_ID"]);
          if (currentDisplayId === deviceDisplayId) {
            // 表示应用在对应的设备屏幕上
            hilog.info(0x0000, 'testTag', 'app in on device screen');
            return true;
          }
        } catch (e) {
          // 捕获接口调用异常时的错误码并做相应处理
          hilog.error(0x0000, 'testTag', `get smart mobility status error, error code: ${e?.code}`);
        }
        return false;
      }
    }
    ```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/car-check-application-start*