---
title: 如何把ImageReceiver收到的视频帧数据保存到本地
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-image-11
category: FAQ
updated_at: 2026-03-13T05:10:33.502Z
---

# 如何把ImageReceiver收到的视频帧数据保存到本地

如示例代码所示，保存接收到的前3帧数据，可根据业务需求进行调整。

```typescript
let size: image.Size = {
  width: 640,
  height: 480
}
let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
receiver.on('imageArrival', () => {
  console.info("imageArrival callback");
  receiver.readNextImage((err: BusinessError, nextImage: image.Image) => {
    if (err || nextImage === undefined) {
      console.error("receiveImage -error:" + err + " nextImage:" + nextImage);
      return;
    }
    nextImage.getComponent(image.ComponentType.JPEG, (err: BusinessError, imgComponent: image.Component) => {
      if (err || imgComponent === undefined) {
        console.error("receiveImage--getComponent -error:" + err + " imgComponent:" + imgComponent);
        return;
      }
      if (imgComponent.byteBuffer as ArrayBuffer) {
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: 8,
          sourceSize: {
            height: 1080,
            width: 1920
          },
        }
        let imageResource = image.createImageSource(imgComponent.byteBuffer, sourceOptions);
        let imagePackerApi = image.createImagePacker();
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 90 };
        const filePath: string = context.getHostContext()!.cacheDir + "/image.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        imagePackerApi.packToFile(imageResource, file.fd, packOpts).then(() => {
          console.error('pack success: ' + filePath);
        }).catch((error: BusinessError) => {
          console.error('Failed to pack the image. And the error is: ' + error);
        })
        imageResource.createPixelMap({}).then((res) => {
          this.imgUrl = res;
        });
      } else {
        return;
      }
      nextImage.release();
    });
  });
});
```

[SaveVideoFrameDataLocally.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ImageKit/entry/src/main/ets/pages/SaveVideoFrameDataLocally.ets#L31-L77)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-image-11*