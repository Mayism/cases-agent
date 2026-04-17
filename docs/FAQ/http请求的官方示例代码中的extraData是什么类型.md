---
title: http请求的官方示例代码中的extraData是什么类型
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-network-9
category: FAQ
updated_at: 2026-03-13T04:55:32.706Z
---

# http请求的官方示例代码中的extraData是什么类型

1.  文档中对extraData的定义是“extraData?: string | Object | ArrayBuffer”，也就是extraData支持string、Object和ArrayBuffer三种类型。
2.  有如下三种方法可供选择。
    
    ```plaintext
    1）extraData:"data to send";
    2）extraData:{ data: "data to send", };
    3）extraData:{ data: new ArrayBuffer(1)};
    ```
    
    [ExtraData.txt](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/NetworkKit/entry/src/main/ets/pages/ExtraData.txt#L8-L10)
    

**参考链接**

[HttpRequestOptions](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-http#httprequestoptions)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-network-9*