---
title: Canvas对象
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-components-canvas
category: 指南
updated_at: 2026-03-12T09:48:24.597Z
---

# Canvas对象

Canvas组件提供画布，用于自定义绘制图形。具体用法请参考[CanvasRenderingContext2D对象](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-components-canvas-canvasrenderingcontext2d)。

## 创建Canvas组件

在pages/index目录下的hml文件中创建一个Canvas组件。

```xml
<!-- xxx.hml -->
<div class="container">
  <canvas></canvas>
</div>
```

```css
/* xxx.css */
.container {
    width: 100%;
    height: 100%;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: #F1F3F5;
}
canvas {
    background-color: #00ff73;
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6f/v3/1HbG2pEXRKuZDuZfCF0uxw/zh-cn_image_0000002558536593.png?HW-CC-KV=V1&HW-CC-Date=20260312T094824Z&HW-CC-Expire=86400&HW-CC-Sign=D0EE527D09FFE360B6DC75148E931A0266D003CE91BFB0122BB39A4FD426D43B)

说明

-   Canvas组件默认背景色与父组件的背景色一致。
    
-   Canvas默认宽高为width: 300px，height: 150px。
    

## 添加样式

Canvas组件设置宽（width）、高（height）、背景色（background-color）及边框样式（border）。

```xml
<!-- xxx.hml -->
<div class="container">
  <canvas></canvas>
</div>
```

```css
/* xxx.css */
.container {
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: #F1F3F5;
    width: 100%;
    height: 100%;
}
canvas {
    width: 500px;
    height: 500px;
    background-color: #fdfdfd;
    border: 5px solid red;
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9b/v3/qELyqxbhTA-YKlweCCZdvQ/zh-cn_image_0000002527216862.png?HW-CC-KV=V1&HW-CC-Date=20260312T094824Z&HW-CC-Expire=86400&HW-CC-Sign=59465E4AE353461B3EF23C5E1AFEFA138AB1FE2802396C1CCDFB420FA5079CA9)

## 添加事件

Canvas添加长按事件，长按后可获取Canvas组件的dataUrl值（toDataURL方法返回的图片信息），打印在下方文本区域内。

说明

promptAction相关接口参考[弹窗](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-promptaction)。

```xml
<!-- xxx.hml -->
<div class="container">
    <canvas ref="canvas1" onlongpress="getUrl"></canvas>
    <text>dataURL</text>
    <text class="content">{{ dataURL }}</text>
</div>
```

```css
/* xxx.css */
.container {
    width: 100%;
    height: 100%;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: #F1F3F5;
}
canvas {
    width: 500px;
    height: 500px;
    background-color: #fdfdfd;
    border: 5px solid red;
    margin-bottom: 50px;
}
.content {
    border: 5px solid blue;
    padding: 10px;
    width: 90%;
    height: 400px;
    overflow: scroll;
}
```

```javascript
// xxx.js
import promptAction from '@ohos.promptAction';
export default {
    data: {
        dataURL: null,
    },
    onShow() {
        let el = this.$refs.canvas1;
        let ctx = el.getContext("2d");
        ctx.strokeRect(100, 100, 300, 300);
    },
    getUrl() {
        let el = this.$refs.canvas1
        let dataUrl = el.toDataURL()
        this.dataURL = dataUrl;
        promptAction.showToast({ duration: 2000, message: "long press,get dataURL" })
    }
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/21/v3/OMF9yCG4R8SPCjE4hKCKBw/zh-cn_image_0000002558376697.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094824Z&HW-CC-Expire=86400&HW-CC-Sign=CE12950B866DBB985C5E68EC450C2A6953A7984EBDC499DAC85A26657E5705DF)

说明

画布不支持在onInit和onReady中进行创建。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-components-canvas*