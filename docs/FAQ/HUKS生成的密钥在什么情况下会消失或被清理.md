---
title: HUKS生成的密钥在什么情况下会消失或被清理
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-universal-keystore-1
category: FAQ
updated_at: 2026-03-13T04:52:38.942Z
---

# HUKS生成的密钥在什么情况下会消失或被清理

应用中调用 \`huks.deleteKeyItem\` 接口可以删除指定别名的密钥。应用卸载后，存储在设备安全环境中的密钥将自动销毁。

**参考链接**

[huks.deleteKeyItem](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-huks#huksdeletekeyitem9)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-universal-keystore-1*