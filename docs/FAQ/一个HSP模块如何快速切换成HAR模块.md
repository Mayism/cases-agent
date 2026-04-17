---
title: 一个HSP模块如何快速切换成HAR模块
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-package-structure-49
category: FAQ
updated_at: 2026-03-13T02:45:17.802Z
---

# 一个HSP模块如何快速切换成HAR模块

**解决方案**

1.在HSP下的module.json5中，把"type": "shared"修改为"type": "har"，删除"deliveryWithInstall"、"pages"字段；

2.删除HSP下的oh-package.json5中"packageType"字段；

3.删除HSP中的页面，如果要以页面的形式使用到的话，就需要改为命名路由的写法；

4.然后再找到HSP下的hvigorfile.ts文件，将里面的hspTasks改为harTasks；

5.最后编译该模块即可。

编译过程中遇到其他错误时，根据提示找到对应位置并进行修改。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-package-structure-49*