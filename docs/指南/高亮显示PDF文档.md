---
title: 高亮显示PDF文档
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/pdf-pdfview-highlight
category: 指南
updated_at: 2026-03-13T00:46:56.288Z
---

# 高亮显示PDF文档

PDF文档在预览时，可以对页面的矩形区域或文本设置高亮显示，高亮颜色可以自定义。

[setHighlightText](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/pdf-arkts-pdfviewmanage#section475716341213)可以同时高亮多个不同的文本。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c3/v3/D9tk4OaARLCMCcxz6qOuRg/zh-cn_image_0000002533661317.jpg?HW-CC-KV=V1&HW-CC-Date=20260313T004615Z&HW-CC-Expire=86400&HW-CC-Sign=603B5294D9CC7A0B8D633500C08F73E60E8D09257799DB4F05B755522ADB2E5E)

## 接口说明

| 接口名 | 描述 |
| --- | --- |
| [setHighlightText](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/pdf-arkts-pdfviewmanage#section475716341213) | 高亮指定文本。 |

注意

[setHighlightText](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/pdf-arkts-pdfviewmanage#section475716341213)和[searchKey](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/pdf-arkts-pdfviewmanage#section117864247160)功能互斥。

## 示例代码

1.  加载PDF文档。
2.  调用PdfView预览组件，渲染显示。
3.  在按钮【setHighlightText】里，调用setHighlightText方法，设置单个或多个要高亮的文本。

```typescript
import { pdfService, PdfView, pdfViewManager } from '@kit.PDFKit';
@Entry
@Component
struct PdfPage {
  private controller: pdfViewManager.PdfController = new pdfViewManager.PdfController();
  private context = this.getUIContext().getHostContext() as Context;
  private loadResult: pdfService.ParseResult = pdfService.ParseResult.PARSE_ERROR_FORMAT;
  aboutToAppear(): void {
    // 确保沙箱目录有input.pdf文档
    let filePath = this.context.filesDir + '/input.pdf';
    (async () => {
      this.loadResult = await this.controller.loadDocument(filePath);
    })()
  }
  build() {
    Column() {
      Row() {
        // 设置文本的高亮显示风格
        Button('setHighlightText').onClick(async () => {
          if (this.loadResult === pdfService.ParseResult.PARSE_SUCCESS) {
            this.controller.setHighlightText(0, ['白皮书'], 0xAAF9CC00);
          }
        })
      }
      // 加载PdfView组件进行预览
      PdfView({
        controller: this.controller,
        pageFit: pdfService.PageFit.FIT_WIDTH,
        showScroll: true
      })
        .id('pdfview_app_view')
        .layoutWeight(1);
    }
    .width('100%').height('100%')
  }
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/pdf-pdfview-highlight*