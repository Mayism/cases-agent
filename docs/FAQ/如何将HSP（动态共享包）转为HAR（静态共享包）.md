---
title: 如何将HSP（动态共享包）转为HAR（静态共享包）
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-project-management-6
category: FAQ
updated_at: 2026-03-13T05:25:19.490Z
---

# 如何将HSP（动态共享包）转为HAR（静态共享包）

[HSP](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/in-app-hsp)转换成[HAR](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/har-package)可参考如下步骤：

1.  在HSP下的module.json5中，把"type": "shared"修改为"type": "har"，删除"deliveryWithInstall"、"pages"字段。
2.  删除HSP中的页面。如果需要以页面形式使用，应改为命名路由或导航的写法。
3.  找到HSP下的hvigorfile.ts文件，将里面的hspTasks改为harTasks。
4.  编译该模块。如果编译过程中遇到错误，根据提示修改对应位置。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-project-management-6*