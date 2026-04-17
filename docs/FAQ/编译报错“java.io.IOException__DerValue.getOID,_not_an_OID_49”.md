---
title: 编译报错“java.io.IOException: DerValue.getOID, not an OID 49”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-115
category: FAQ
updated_at: 2026-03-13T05:40:48.791Z
---

# 编译报错“java.io.IOException: DerValue.getOID, not an OID 49”

**问题现象**

编译构建时出现错误：java.io.IOException: DerValue.getOID, not an OID 49。

```plaintext
hap-sign-tool: error: ACCESS_ERROR, code: 109. Details: java.io.IOException: DerValue.getOID, not an OID 49 Detail: Please check the message from tools
```

**报错原因**

证书文件解析失败，找不到OID。

**场景**

1.  证书遭篡改。
2.  appCertPath参数传入了非证书文件。

**解决方案**

检查证书文件的正确性。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-115*