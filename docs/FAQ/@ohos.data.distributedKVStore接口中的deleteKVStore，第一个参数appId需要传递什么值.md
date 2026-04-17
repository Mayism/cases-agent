---
title: @ohos.data.distributedKVStore接口中的deleteKVStore，第一个参数appId需要传递什么值
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-local-database-management-46
category: FAQ
updated_at: 2026-03-13T04:32:41.844Z
---

# @ohos.data.distributedKVStore接口中的deleteKVStore，第一个参数appId需要传递什么值

appId是调用方应用的包名。通过调用[bundleManager.getBundleInfoForSelf()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-bundlemanager#bundlemanagergetbundleinfoforself)获取BundleInfo，然后通过BundleInfo对象的signatureInfo属性获取appId。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-local-database-management-46*