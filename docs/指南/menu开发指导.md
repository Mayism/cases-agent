---
title: menu开发指导
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-components-menu
category: 指南
updated_at: 2026-03-12T09:48:11.857Z
---

# menu开发指导

提供菜单组件，作为临时性弹出窗口，用于展示用户可执行的操作，具体用法请参考[menu](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-components-basic-menu)。

## 创建menu组件

在pages/index目录下的hml文件中创建一个menu组件，添加target、type、title属性。

```xml
<!-- xxx.hml-->
<div class="container">
  <text class="title-text" id="textId">show menu</text>
  <menu target="textId" type="click" title="title">
    <option value="Item 1">Item 1</option>
    <option value="Item 2">Item 2</option>
    <option value="Item 3">Item 3</option>
  </menu>
</div>
```

```css
/* xxx.css */
.container{
  width: 100%;
  height: 100%;
  flex-direction: column;
  background-color: #F1F3F5;
  align-items: center;
  justify-content: center;
  width: 100%;
}
.title-text{
  font-size: 35px;
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1e/v3/pJvARDPBTretSshdMcBEnA/zh-cn_image_0000002558536585.png?HW-CC-KV=V1&HW-CC-Date=20260312T094748Z&HW-CC-Expire=86400&HW-CC-Sign=AE9465A2A3455DDE99E4BC442130E7E3F8EB235421CD6FA1D2A3A4F598D6F2A1)

说明

-   menu仅支持[option](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-components-basic-option)子组件。
    
-   menu组件不支持focusable、disabled属性。
    

## 设置样式

为menu组件设置样式，例如字体颜色、大小、字符间距等。

```xml
<!-- xxx.hml-->
<div class="container">
  <text class="title-text" id="textId">show menu</text>
  <menu target="textId" type="click" title="title">
    <option value="Item 1">Item 1</option>
    <option value="Item 2">Item 2</option>
    <option value="Item 3">Item 3</option>
  </menu>
</div>
```

```css
/* xxx.css */
.container{
  width: 100%;
  height: 100%;
  flex-direction: column;
  background-color: #F1F3F5;
  align-items: center;
  justify-content: center;
  width: 100%;
}
.title-text{
  font-size: 35px;
  background-color: #5a5aee;
  color: white;
  width: 70%;
  text-align: center;
  height: 85px;
  border-radius: 12px;
}
.menu{
  text-color: blue;
  font-size: 35px;
  letter-spacing: 2px;
}
option{
  color: #6a6aef;
  font-size: 30px;
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/71/v3/qUCovWbNTNGqsnnnTR8-_A/zh-cn_image_0000002527216854.png?HW-CC-KV=V1&HW-CC-Date=20260312T094748Z&HW-CC-Expire=86400&HW-CC-Sign=98CFEC9454F34D7984E8AC31DE8BAF9D08196B3D226AE8F5F8FEF5ED3B34DA20)

## 绑定事件

为menu组件绑定oncancel事件（取消操作时触发）。

```xml
<!-- xxx.hml-->
<div class="container">
  <text  class="title-text" id="textId" onclick="textClick">show menu</text>
  <menu  title="title" oncancel="cancel" id="menuId">
    <option value="Item 1">Item 1</option>
    <option value="Item 2">Item 2</option>
    <option value="Item 3">Item 3</option>
  </menu>
</div>
```

```css
/* xxx.css */
.container{
  width: 100%;
  height: 100%;
  flex-direction: column;
  background-color: #F1F3F5;
  width: 100%;
}
.title-text{
  font-size: 35px;
  background-color: #5a5aee;
  color: white;
  width: 70%;
  text-align: center;
  height: 85px;
  border-radius: 12px;
  margin-top: 500px;
  margin-left: 15%;
}
menu{
  text-color: blue;
  font-size: 35px;
  letter-spacing: 2px;
}
option{
  color: #6a6aef;
  font-size: 30px;
}
```

```javascript
// xxx.js
import promptAction from '@ohos.promptAction';
export default {
  cancel() {
    promptAction.showToast({
      message: "cancel"
    })
  },
  textClick() {
    this.$element("menuId").show({ x: 175,y: 590 });
  }
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/49/v3/peVAp7O9QX62WnE1IHgWtw/zh-cn_image_0000002558376689.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094748Z&HW-CC-Expire=86400&HW-CC-Sign=39D05B5A82171ED420277688B49B406614509B600F0AA35382E7C3BB012E4AAF)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-components-menu*