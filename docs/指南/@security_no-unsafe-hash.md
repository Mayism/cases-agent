---
title: @security/no-unsafe-hash
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unsafe-hash
category: 指南
updated_at: 2026-03-13T04:28:45.565Z
---

# @security/no-unsafe-hash

该规则使用禁止不安全的哈希算法，例如MD5、SHA1。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@security/no-unsafe-hash": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```javascript
//正例1
import cryptoFramework from '@ohos.security.cryptoFramework';
cryptoFramework.createMd('SHA256');
//正例2
/**
 * 下载crypto-js依赖：ohpm install @ohos/crypto-js
 */
import { CryptoJS } from '@ohos/crypto-js';
CryptoJS.SHA256('Message').toString();
```

## 反例

```javascript
//反例1.1
import cryptoFramework from '@ohos.security.cryptoFramework';
cryptoFramework.createMd('MD5');
//反例1.2
import cryptoFramework from '@ohos.security.cryptoFramework';
cryptoFramework.createMd('SHA1');
//反例2.1
import { CryptoJS } from '@ohos/crypto-js';
CryptoJS.MD5('Message').toString();
//反例2.2
import { CryptoJS } from '@ohos/crypto-js';
CryptoJS.SHA1('Message').toString();
```

## 规则集

```cangjie
plugin:@security/recommended
plugin:@security/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unsafe-hash*