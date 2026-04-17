---
title: 自定义界面扫码如何连续扫码（customScan.rescan）
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/scan-faq-10
category: 指南
updated_at: 2026-03-12T17:51:34.255Z
---

# 自定义界面扫码如何连续扫码（customScan.rescan）

**问题现象**

自定义界面扫码扫到码值后，如何连续扫码？

**解决措施**

customScan.[rescan](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/scan-customscan-api#section19244173211169)可以重新触发一次扫码，必须在customScan.[start](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/scan-customscan-api#section747366165913)(viewControl, callback)方法Callback接口回调中有效，Promise方式无效。

示例：

```typescript
import { AsyncCallback, BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { customScan, scanBarcode } from '@kit.ScanKit';
@Entry
@Component
struct Index {
  private callback: AsyncCallback<Array<scanBarcode.ScanResult>> =
    (error: BusinessError, result: Array<scanBarcode.ScanResult>) => {
      if (error) {
        hilog.error(0x0001, '[Scan Sample]',
          `Failed to get ScanResult by callback. Code: ${error.code}, message: ${error.message}`);
        return;
      }
      hilog.info(0x0001, '[Scan Sample]',
        `Succeeded in getting ScanResult by callback, result is ${JSON.stringify(result)}`);
      try {
        // 重新触发扫码：不需要重启相机并重新触发一次扫码，可以在start接口的Callback异步回调中，调用rescan接口。
        customScan.rescan();
      } catch (error) {
        hilog.error(0x0001, '[Scan Sample]', `Failed to rescan. Code: ${error.code}, message: ${error.message}`);
      }
    }
  build() {
  }
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/scan-faq-10*