---
title: 如何从一个二进制文件中读取其字节数组？通过fs.createStreamSync只能获取到ArrayBuffer，如何转成number[]
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-local-file-manager-28
category: FAQ
updated_at: 2026-03-13T04:36:14.344Z
---

# 如何从一个二进制文件中读取其字节数组？通过fs.createStreamSync只能获取到ArrayBuffer，如何转成number[]

```typescript
@Component
export struct ArrayBufferConversionArray {
  @State fileLength: number = 10;
  private tempData: number[] = [];
  aboutToAppear(): void {
    // Convert ArrayBuffer to a number array
    let arrayBuffer: ArrayBuffer = new ArrayBuffer(this.fileLength);
    let dataView: DataView = new DataView(arrayBuffer);
    for (let index = 0; index < this.fileLength; index++) {
      this.tempData[index] = dataView.getInt8(index);
    }
    console.info(this.tempData.toString());
  }
  build() {
    RelativeContainer() {
      Text(this.tempData.toString())
        .id('ArrayBufferHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}
```

[ReadByte.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/LocationKit/entry/src/main/ets/pages/ReadByte.ets#L21-L51)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-local-file-manager-28*