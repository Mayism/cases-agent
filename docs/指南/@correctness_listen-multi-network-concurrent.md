---
title: @correctness/listen-multi-network-concurrent
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_listen-multi-network-concurrent
category: 指南
updated_at: 2026-03-13T04:46:29.922Z
---

# @correctness/listen-multi-network-concurrent

建议应用订阅连接迁移通知，可在WiFi/蜂窝连接切换前后获取切换状态通知。

该规则仅在联网类应用检查整个工程时才生效。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@correctness/listen-multi-network-concurrent": "suggestion"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```javascript
// With the ohos.permission.GET_NETWORK_INFO permission configured
import { netHandover } from '@kit.NetworkBoostKit';
import { BusinessError } from '@kit.BasicServicesKit';
try {
  netHandover.on('handoverChange', (info: netHandover.HandoverInfo) => {
    if (info.handoverStart) {
      console.info('handover start');
    } else if (info.handoverComplete) {
      console.info('handover complete');
    }
  });
} catch (err) {
  console.error('errCode: ' + (err as BusinessError).code + ', errMessage: ' + (err as BusinessError).message);
}
try {
  netHandover.off('handoverChange');
} catch (err) {
  console.error('errCode: ' + (err as BusinessError).code + ', errMessage: ' + (err as BusinessError).message);
}
```

## 反例

```bash
// With the ohos.permission.GET_NETWORK_INFO permission configured
// The `on(type: 'handoverChange', callback: Callback<HandoverInfo>)` function is not called.
```

## 规则集

```sql
plugin:@correctness/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_listen-multi-network-concurrent*