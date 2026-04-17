---
title: 设置PDF文档预览效果
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/pdf-pdfview-preview-method
category: 指南
updated_at: 2026-03-13T00:46:55.241Z
---

# 设置PDF文档预览效果

pdfViewManager为PDF文档提供了丰富的预览特性。

-   单双页布局，是否连续滚动和页面适配方式。
-   页面跳转，如上一页，下一页，跳转到指定页。
-   页面放大、缩小。

**图1**：提供了双页预览布局，页面宽度适配和连续滚动的预览方式

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c3/v3/M247BIdjTtu1iBG8AUDk4A/zh-cn_image_0000002533661319.jpg?HW-CC-KV=V1&HW-CC-Date=20260313T004614Z&HW-CC-Expire=86400&HW-CC-Sign=A0626FCFD252B89A6AC1FE075B78FF1C72D7E11F91AC137815180D8CC47ABF0C "点击放大")

## 接口说明

| 接口名 | 描述 |
| --- | --- |
| [setPageLayout](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/pdf-arkts-pdfviewmanage#section113581457158) | 设置页面布局模式。其中“columnCount”取值如下：1：单页面2：双页面 |
| [setPageContinuous](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/pdf-arkts-pdfviewmanage#section32161930132611) | 设置页面滚动是否连续排列。 |
| [setPageFit](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/pdf-arkts-pdfviewmanage#section347455378) | 设置页面的适配模式。 |
| [goToPage](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/pdf-arkts-pdfviewmanage#section9554132275317) | 跳转到指定页。 |
| [setPageZoom](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/pdf-arkts-pdfviewmanage#section2693181014192) | 设置视图的缩放比例。 |

## 示例代码

1.  先加载PDF文档。
2.  调用PdfView预览组件，渲染显示。
3.  在按钮【setPreviewMode】里，调用setPageLayout、setPageContinuous等方法，设置文档预览效果。
4.  在按钮【goTopage】里，调用goToPage方法，设置页面跳转。
5.  在按钮【zoomPage2】里，调用setPageZoom方法，将页面放大2倍。

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
      // 注意：这里刚加载文档，请不要在这里立即设置PDF文档的预览方法。
    })()
  }
  build() {
    Column() {
      Row() {
        // 设置预览方式
        Button('setPreviewMode').onClick(() => {
          if (this.loadResult === pdfService.ParseResult.PARSE_SUCCESS) {
            // 单页布局
            this.controller.setPageLayout(pdfService.PageLayout.LAYOUT_SINGLE);
            // 是否连续滚动预览
            this.controller.setPageContinuous(true);
            // 适配页的预览方式
            this.controller.setPageFit(pdfService.PageFit.FIT_PAGE);
          }
        })
        // 跳转到第11页
        Button('goTopage').onClick(() => {
          if (this.loadResult === pdfService.ParseResult.PARSE_SUCCESS) {
            this.controller.goToPage(10);
          }
        })
        // 页面放大2倍
        Button('zoomPage2').onClick(() => {
          if (this.loadResult === pdfService.ParseResult.PARSE_SUCCESS) {
            this.controller.setPageZoom(2);
          }
        })
      }
      PdfView({
        controller: this.controller,
        pageFit: pdfService.PageFit.FIT_WIDTH,
        showScroll: true
      })
        .id('pdfview_app_view')
        .layoutWeight(1);
    }
  }
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/pdf-pdfview-preview-method*