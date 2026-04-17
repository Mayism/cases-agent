---
title: @security/no-unsafe-dh-key
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unsafe-dh-key
category: 指南
updated_at: 2026-03-13T04:28:14.691Z
---

# @security/no-unsafe-dh-key

该规则禁止使用不安全的DH密钥，如DH模数长度小于2048bit。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@security/no-unsafe-dh-key": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```javascript
import cryptoFramework from '@ohos.security.cryptoFramework';
cryptoFramework.createAsyKeyGenerator('DH_modp3072');
```

## 反例

```javascript
import cryptoFramework from '@ohos.security.cryptoFramework';
cryptoFramework.createAsyKeyGenerator('DH_modp1536');
```

## 规则集

```cangjie
plugin:@security/recommended
plugin:@security/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unsafe-dh-key*