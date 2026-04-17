---
title: @security/no-unsafe-mac
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unsafe-mac
category: 指南
updated_at: 2026-03-13T04:28:46.286Z
---

# @security/no-unsafe-mac

该规则禁止在[MAC消息认证算法](https://developer.huawei.com/consumer/cn/doc/AppGallery-connect-Guides/aegis-message-authentication-code-calculation-0000001907018769)中使用不安全的哈希算法，例如SHA1。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@security/no-unsafe-mac": "warn"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```javascript
import cryptoFramework from '@ohos.security.cryptoFramework';
import { CryptoJS } from '@ohos/crypto-js';
cryptoFramework.createMac('SHA256');
CryptoJS.HmacSHA256('Message').toString();
```

## 反例

```javascript
import cryptoFramework from '@ohos.security.cryptoFramework';
import { CryptoJS } from '@ohos/crypto-js';
cryptoFramework.createMac('SHA1');
CryptoJS.HmacSHA1('Message').toString();
```

## 规则集

```cangjie
plugin:@security/recommended
plugin:@security/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unsafe-mac*