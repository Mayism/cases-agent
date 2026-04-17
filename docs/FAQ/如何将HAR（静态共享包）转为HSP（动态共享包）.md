---
title: 如何将HAR（静态共享包）转为HSP（动态共享包）
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-project-management-7
category: FAQ
updated_at: 2026-03-13T05:25:25.685Z
---

# 如何将HAR（静态共享包）转为HSP（动态共享包）

[HAR](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/har-package)转换成[HSP](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/in-app-hsp)可参考如下步骤：

1.  新建一个HSP，将HAR包拷贝到lib目录，并在HSP的oh-package.json5文件的dependencies下配置HAR包。
    
    ```json
    "dependencies": {
      "myhar": "file:./lib/myHar.har" // MyHar.Har path: oh-package.json5 file in the same directory as the lib folder
    },
    ```
    
    [oh-package.json5](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ProjectManager/library/oh-package.json5#L14-L16)
    
2.  在HSP的Index.ets中直接导出HAR内容。
    
    ```typescript
    export * as myhar from 'myhar';
    ```
    
    [Index.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ProjectManager/library/Index.ets#L6-L6)
    
3.  最后编译该HSP。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-project-management-7*