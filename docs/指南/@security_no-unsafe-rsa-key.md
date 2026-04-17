---
title: @security/no-unsafe-rsa-key
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unsafe-rsa-key
category: 指南
updated_at: 2026-03-13T04:29:17.302Z
---

# @security/no-unsafe-rsa-key

该规则禁止使用不安全的RSA密钥，如RSA模数长度小于2048bit。推荐使用Petal Aegis SDK中的安全RSA签名接口，详情参见：[RSA密钥](https://developer.huawei.com/consumer/cn/doc/AppGallery-connect-References/ohaeggeneratersakeypairbase64-0000001864601898)。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@security/no-unsafe-rsa-key": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```javascript
import cryptoFramework from '@ohos.security.cryptoFramework';
cryptoFramework.createAsyKeyGenerator('RSA3072|PRIMES_2');
```

## 反例

```javascript
import cryptoFramework from '@ohos.security.cryptoFramework';
cryptoFramework.createAsyKeyGenerator('RSA512|PRIMES_2');
```

## 规则集

```cangjie
plugin:@security/recommended
plugin:@security/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unsafe-rsa-key*