---
title: 视频场景ROM低功耗建议
source: https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-video-rom
category: 最佳实践
updated_at: 2026-03-13T02:36:58.414Z
---

# 视频场景ROM低功耗建议

## 建议

视频和小视频在线播放时，不建议将片源全部下载到ROM中。下载到ROM的功耗比仅加载到DDR中高100mA以上。因此，应避免将片源全部下载到ROM。

## 开发步骤

推荐使用异步接口fileIo.write()写文件到ROM，函数的返回值number为实际写入的数据长度（单位：字节）。统计返回值的累计值，该累计值表示应用在一段时间内写入ROM的文件总大小。为确保视频和小视频在线播放时，文件下载速率不超过20MB/min。

```typescript
let filePath: string = pathDir + "/test.txt";
let file: fileIo.File = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
let str: string = "hello, world";
// Use asynchronous methods to write files to the ROM
fileIo.write(file.fd, str).then((writeLen: number) => {
  hilog.info(0x0000, 'Sample', 'write data to file succeed and size is:' + writeLen);
}).catch((err: BusinessError) => {
  hilog.error(0x0000, 'Sample', 'write data to file failed with error message: ' + err.message + ', error code: ' + err.code);
}).finally(() => {
  fileIo.closeSync(file);
});
```

[VideoScenesROMRule.ets](https://gitcode.com/harmonyos_samples/BestPracticeSnippets/blob/master/RationalUseOfFrontEndResources/entry/src/main/ets/pages/VideoScenesROMRule.ets#L26-L36)

## 调测验证

通过查看storage\_info节点的信息，如下所示：Total Host Write Data表示整机下载文件的总大小（单位为100MB）。建议文件下载的总速率不超过20MB/min。以视频播放10分钟为例，测试前后的Total Host Write Data节点差值应小于或等于2，符合要求。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/18/v3/sumfhwTBQkqaqWFlYAlGzA/zh-cn_image_0000002229337325.png?HW-CC-KV=V1&HW-CC-Date=20260313T023651Z&HW-CC-Expire=86400&HW-CC-Sign=D4D070503A45B5495251769E1EA2FEED63CCAC6CE0D907E10CACE7C724F5397F "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-video-rom*