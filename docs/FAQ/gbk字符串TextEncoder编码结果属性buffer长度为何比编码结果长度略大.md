---
title: gbk字符串TextEncoder编码结果属性buffer长度为何比编码结果长度略大
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-137
category: FAQ
updated_at: 2026-03-13T03:08:47.837Z
---

# gbk字符串TextEncoder编码结果属性buffer长度为何比编码结果长度略大

**问题现象**

TextEncoder编码字符串“你好abc”，格式是gbk，分别获取编码结果长度和编码结果属性buffer的长度。如下图显示：

TextEncoder编码结果属性buffer的长度比编码结果的长度略大。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a2/v3/Y1hKDCtNToWO0rWjTb_qQw/zh-cn_image_0000002194318536.png?HW-CC-KV=V1&HW-CC-Date=20260313T030841Z&HW-CC-Expire=86400&HW-CC-Sign=AE54329E0CBA2C80AE3A756E3C3E03BA2ED499FC7E8DB2555199F286A575A552 "点击放大")

**原因解释**

在TextEncoder编码底层代码逻辑中，需要创建arraybuffer，通过分析创建的arraybuffer长度就是编码结果buffer属性的长度。

其创建的arraybuffer是用来存放编码结果的，在编码结果未解析时需要提前创建arraybuffer，而创建arraybuffer的长度是未知的，为了保证arraybuffer长度能够存放编码结果，其长度是取编码字符串中单个字符占用的最大字节数乘以字符串长度来设置的，因此导致了TextEncoder编码结果buffer属性的byteLength比编码结果的长度略大。

**解决措施**

如果需要使用TextEncoder编码结果属性buffer的byteLength准确长度，可以通过buffer自带函数slice，依据TextEncoder编码结果长度获取buffer的byteLength准确长度。示例如下：

```typescript
let textEncoder = util.TextEncoder.create('gbk');
let rstEncodeData: Uint8Array = textEncoder.encodeInto('你好abc');
let length = rstEncodeData.length;
console.info("rstEncodeData.length = " + length);
let byteLength = rstEncodeData.buffer.byteLength;
console.info("rstEncodeData.buffer.byteLength = " + byteLength);
console.info("rstEncodeData.buffer.slice(0, length).byteLength = " + rstEncodeData.buffer.slice(0, length).byteLength);
// rstEncodeData.buffer.slice(0, length).byteLength = 7
```

[GBKStringBufferLength.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/GBKStringBufferLength.ets#L22-L29)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-137*