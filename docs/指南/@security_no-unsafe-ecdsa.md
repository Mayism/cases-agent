---
title: @security/no-unsafe-ecdsa
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unsafe-ecdsa
category: 指南
updated_at: 2026-03-13T04:28:43.797Z
---

# @security/no-unsafe-ecdsa

该规则禁止在ECDSA签名算法中使用不安全的SHA1摘要算法。推荐使用Petal Aegis SDK中的安全ECDSA接口，详情参见： [ECDSA签名验签](https://developer.huawei.com/consumer/cn/doc/AppGallery-connect-Guides/aegis-signature-verification-0000001866035345)。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@security/no-unsafe-ecdsa": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```javascript
import cryptoFramework from '@ohos.security.cryptoFramework';
cryptoFramework.createSign('ECC256|SHA256');
cryptoFramework.createVerify('ECC256|SHA256');
```

## 反例

```javascript
import cryptoFramework from '@ohos.security.cryptoFramework';
cryptoFramework.createSign('ECC224|SHA1');
cryptoFramework.createVerify('ECC224|SHA1');
```

## 规则集

```cangjie
plugin:@security/recommended
plugin:@security/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unsafe-ecdsa*