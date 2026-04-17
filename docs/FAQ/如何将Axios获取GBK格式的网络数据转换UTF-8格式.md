---
title: 如何将Axios获取GBK格式的网络数据转换UTF-8格式
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-network-59
category: FAQ
updated_at: 2026-03-13T05:00:33.456Z
---

# 如何将Axios获取GBK格式的网络数据转换UTF-8格式

通过[@ohos.util (util工具函数)](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-util)实现GBK转换UTF-8格式，实现思路如下：

1\. 引入axios和util。

2\. 使用axios获取网络数据，并将数据类型设置为ARRAY\_BUFFER。

3\. 使用util.TextDecoder方法进行解码。

4\. 将解码后的数据通过LazyForEach循环显示在列表中。

参考代码如下：

```typescript
import { util } from '@kit.ArkTS';
import axios, { AxiosResponse } from '@ohos/axios';
const URL: string = 'xxx';
@Entry
@Component
struct FriendsBook {
  build() {
  }
  aboutToAppear() {
    axios<string, AxiosResponse<string>, null>({
      method: 'get',
      url: URL,
      // When using the util.TextDecoder method, the encoding and decoding formats must be consistent,
      // so the data type needs to be set to ARRAY_BUFFER when retrieving, otherwise garbled characters will appear.
      responseType: 'ARRAY_BUFFER'
    })
      .then((res: AxiosResponse) => {
        // First, use create to construct a TextDecoder instance and set the encoding format to gbk.
        const textDecoder = util.TextDecoder.create('gbk', { ignoreBOM: true });
        // Next, use the decodeWithStream method to decode the input parameters and output the corresponding UTF-8 formatted text string.
        // The parameters passed in must be in Uint8Array format, so the obtained data needs to be converted to an array type using the Uint8Array method.
        const result = new Uint8Array(res.data);
        const resultString = textDecoder.decodeToString(result, { stream: false });
        // Parse JSON strings.
        const jsonResult = JSON.parse(resultString) as string;
      })
  }
}
```

[GetAxiosUTF.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/NetworkKit/entry/src/main/ets/pages/GetAxiosUTF.ets#L21-L52)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-network-59*