---
title: 如何生成带logo的二维码
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-image-23
category: FAQ
updated_at: 2026-03-13T05:11:33.900Z
---

# 如何生成带logo的二维码

1.  使用Canvas组件绘制二维码图片和logo图片。
    
    ```typescript
    Canvas(this.context)
      .width(300)
      .height(300)
      .onReady(() => {
        this.createQRCode();
      })
    ```
    
    [GenerateQrCode.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/MediaKit/entry/src/main/ets/pages/GenerateQrCode.ets#L67-L72)
    
2.  首先调用createBarcode接口生成码图pixelMap，再调用drawImage接口绘制码图pixelMap，最后再次调用drawImage接口绘制logo叠加到码图之上。
    
    ```typescript
    let options: generateBarcode.CreateOptions = {
      scanType: scanCore.ScanType.QR_CODE,
      height: this.QRCodeWidth,
      width: this.QRCodeWidth
    };
    generateBarcode.createBarcode(content, options).then((pixelMap: image.PixelMap) => {
      this.pixelMap = pixelMap;
      this.context.drawImage(this.pixelMap, 0, 0, 300, 300, 0, 0, 300, 300);
      this.context.drawImage(this.img, 0, 0, 80, 80, 110, 110, 80, 80);
    }).catch((error: BusinessError) => {
      hilog.error(0x0001, '[generateBarcode]', 'promise error : %{public}s', JSON.stringify(error));
    })
    ```
    
    [GenerateQrCode.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/MediaKit/entry/src/main/ets/pages/GenerateQrCode.ets#L49-L60)
    

示例代码如下：

```typescript
import { image } from '@kit.ImageKit';
import { generateBarcode, scanCore } from '@kit.ScanKit';
import { BusinessError, deviceInfo } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
@Entry
@Component
struct Index {
  @State pixelMap: image.PixelMap | undefined = undefined;
  private setting: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.setting);
  private img: ImageBitmap = new ImageBitmap('common/startIcon.png');
  private QRCodeWidth: number = 300;
  private QRCodeHeight: number = 300;
  aboutToAppear(): void {
    let sdkApiVersionInfo: number = deviceInfo.sdkApiVersion;
    // The API version is greater than or equal to API18.
    if(sdkApiVersionInfo >= 18){
      this.QRCodeWidth = this.getUIContext().vp2px(this.QRCodeWidth);
      this.QRCodeHeight = this.getUIContext().vp2px(this.QRCodeHeight);
    }
  }
  createQRCode() {
    this.pixelMap = undefined;
    let content: string = 'helloWorld';
    let options: generateBarcode.CreateOptions = {
      scanType: scanCore.ScanType.QR_CODE,
      height: this.QRCodeWidth,
      width: this.QRCodeWidth
    };
    generateBarcode.createBarcode(content, options).then((pixelMap: image.PixelMap) => {
      this.pixelMap = pixelMap;
      this.context.drawImage(this.pixelMap, 0, 0, 300, 300, 0, 0, 300, 300);
      this.context.drawImage(this.img, 0, 0, 80, 80, 110, 110, 80, 80);
    }).catch((error: BusinessError) => {
      hilog.error(0x0001, '[generateBarcode]', 'promise error : %{public}s', JSON.stringify(error));
    })
  }
  build() {
    Column() {
      Canvas(this.context)
        .width(300)
        .height(300)
        .onReady(() => {
          this.createQRCode();
        })
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.Start)
  }
}
```

[GenerateQrCode.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/MediaKit/entry/src/main/ets/pages/GenerateQrCode.ets#L21-L80)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-image-23*