---
title: @security/no-unsafe-kdf
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unsafe-kdf
category: 指南
updated_at: 2026-03-13T04:29:32.881Z
---

# @security/no-unsafe-kdf

禁止使用不安全的KDF算法，包括PBKDF2|SHA1和HKDF|SHA1。推荐使用PBKDF2|SHA256和HKDF|SHA256，PBKDF2|SHA256算法描述详情参见：[密钥派生算法](https://developer.huawei.com/consumer/cn/doc/AppGallery-connect-Guides/aegis-key-derivation-0000001861059318)。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@security/no-unsafe-kdf": "warn"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```javascript
import cryptoFramework from '@ohos.security.cryptoFramework';
cryptoFramework.createKdf('PBKDF2|SHA256');
import cryptoFramework from '@ohos.security.cryptoFramework';
cryptoFramework.createKdf('HKDF|SHA256');
```

## 反例

```javascript
import cryptoFramework from '@ohos.security.cryptoFramework';
cryptoFramework.createKdf('PBKDF2|SHA1');
import cryptoFramework from '@ohos.security.cryptoFramework';
cryptoFramework.createKdf('HKDF|SHA1');
```

## 规则集

```sql
plugin:@security/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unsafe-kdf*