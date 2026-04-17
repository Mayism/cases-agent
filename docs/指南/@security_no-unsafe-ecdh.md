---
title: @security/no-unsafe-ecdh
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unsafe-ecdh
category: 指南
updated_at: 2026-03-13T04:30:06.121Z
---

# @security/no-unsafe-ecdh

此规则禁止使用不安全的非对称密钥类型ECC。推荐使用ECC256算法，详情参见：[密钥生成算法](https://developer.huawei.com/consumer/cn/doc/AppGallery-connect-Guides/aegis-key-generation-0000001819355432)。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@security/no-unsafe-ecdh": "warn"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```javascript
import cryptoFramework from '@ohos.security.cryptoFramework';
cryptoFramework.createAsyKeyGenerator('ECC256');
```

## 反例

```javascript
import cryptoFramework from '@ohos.security.cryptoFramework';
cryptoFramework.createAsyKeyGenerator('ECC');
```

## 规则集

```sql
plugin:@security/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unsafe-ecdh*