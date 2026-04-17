---
title: slider开发指导
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-components-slider
category: 指南
updated_at: 2026-03-12T09:46:29.784Z
---

# slider开发指导

slider为滑动条组件，用来快速调节音量、亮度等。具体用法请参考[slider](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-components-basic-slider)。

## 创建slider组件

在pages/index目录下的hml文件中创建一个slider组件。

```xml
<!-- xxx.hml -->
<div class="container">
  <slider></slider>
</div>
```

```css
/* xxx.css */
.container {
  width: 100%;
  height: 100%;
  background-color: #F1F3F5;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0a/v3/vxwNvNaESB-OMVI70uoHRA/zh-cn_image_0000002558536577.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094604Z&HW-CC-Expire=86400&HW-CC-Sign=2679627154982EE0774EAA8ABA61DB23854CD698127C4657B071119774ED6767)

## 设置样式和属性

slider组件通过color、selected-color、block-color样式分别为滑动条设置背景颜色、已选择颜色和滑块颜色。

```xml
<!-- xxx.hml -->
<div class="container">
  <slider class= "sli"></slider>
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
.sli{
  color: #fcfcfc;
  scrollbar-color: aqua;
  background-color: #b7e3f3;
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/75/v3/l0eos73bS5e2Ei-mOTbV_g/zh-cn_image_0000002527216846.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094604Z&HW-CC-Expire=86400&HW-CC-Sign=03DDF0C810918237747EA134122E968198EA4BFC8F6DECC1352DAAC5B5F676F0)

通过添加min、max、value、step、mode属性分别为滑动条设置最小值、最大值、初始值、滑动步长和滑动条样式。

```xml
<!-- xxx.hml -->
<div class="container">
  <slider min="0" max="100" value="1" step="2" mode="inset" showtips="true"></slider>
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
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b9/v3/s5P3V1H6RZqkFhd3mxxgsQ/zh-cn_image_0000002558376681.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094604Z&HW-CC-Expire=86400&HW-CC-Sign=FBD1648D9A2EE757EC4B5B452B7BFFA49FC2829F0695D2ECB57B5E6ED9861AE7)

说明

mode属性为滑动条样式，可选值为：

-   outset：滑块在滑杆上。
    
-   inset：滑块在滑杆内。
    

## 绑定事件

向slider组件添加change事件，添加时需要传入ChangeEvent参数。

```xml
<!-- xxx.hml -->
<div class="container">
  <text>slider start value is {{startValue}}</text>
  <text>slider current value is {{currentValue}}</text>
  <text>slider end value is {{endValue}}</text>
  <slider min="0" max="100" value="{{value}}" onchange="setValue"></slider>
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
```

```javascript
// xxx.js
export default {
  data: {
    value: 0,
    startValue: 0,
    currentValue: 0,
    endValue: 0,
  },
  setValue(e) {
    if (e.mode === "start") {
      this.value = e.value;
      this.startValue = e.value;
    } else if (e.mode === "move") {
      this.value = e.value;
      this.currentValue = e.value;
    } else if (e.mode === "end") {
      this.value = e.value;
      this.endValue = e.value;
    }
  }
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2a/v3/-O0FT50kSdqWHBrNqTdhOQ/zh-cn_image_0000002527376800.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094604Z&HW-CC-Expire=86400&HW-CC-Sign=5FF9C8DD20849063584F6212AA3B0E4920BDB76FDB23ED3B42268E7E55DD4F5E)

## 场景示例

开发者可以通过调整滑动条的值来改变图片大小，并且动态打印当前图片的宽和高。

```xml
<!-- xxx.hml -->
<div class="container">
  <image src="common/landscape3.jpg" style=" width: {{WidthVal}}px;height:{{HeightVal}}px;margin-top: -150px;"></image>
  <div class="txt">
    <slider min="0" max="100" value="{{value}}" onchange="setValue"></slider>
    <text>The width of this picture is {{WidthVal}}</text>
    <text>The height of this picture is {{HeightVal}}</text>
  </div>
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
.text{
  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: fixed;
  top: 65%;
}
.text{
  margin-top: 30px;
}
```

```javascript
// xxx.js
export default{
  data: {
    value: 0,
    WidthVal: 200,
    HeightVal: 200
  },
  setValue(e) {
    this.WidthVal = 200 + e.value;
    this.HeightVal = 200 + e.value
  }
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f5/v3/Vdi8DIZITqiWXGI8PIwvtw/zh-cn_image_0000002558536579.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094604Z&HW-CC-Expire=86400&HW-CC-Sign=53AC32807DF04CCF77D9C02DDA40F21DF9407A1EAB594DFC0D4B3526B577A7FD)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-components-slider*