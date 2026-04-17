---
title: qrcode开发指导
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-components-qrcode
category: 指南
updated_at: 2026-03-12T09:48:16.834Z
---

# qrcode开发指导

生成并显示二维码，具体用法请参考[qrcode](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-components-basic-qrcode)。

## 创建qrcode组件

在pages/index目录下的hml文件中创建一个qrcode组件。

```xml
<!-- xxx.hml-->
<div class="container">
  <qrcode value="Hello"></qrcode>
</div>
```

```css
/* xxx.css */
.container {
  width: 100%;
  height: 100%;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color: #F1F3F5;
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/fd/v3/9cY5DfCBT22PzuzHrIqg-Q/zh-cn_image_0000002527376810.png?HW-CC-KV=V1&HW-CC-Date=20260312T094816Z&HW-CC-Expire=86400&HW-CC-Sign=02FEF7123735862FD224B6B1EB10CA28144C14831A338B99FD2FF96B12C81EE2)

说明

qrcode组件在创建的时候value的值为必填项。

## 设置组件类型

通过设置qrcode的type属性来选择按钮类型，如定义qrcode为矩形二维码、圆形二维码。

```xml
<!-- xxx.hml-->
<div class="container">
  <select onchange="settype">
    <option for="{{bcol_list}}" value="{{$item}}">{{$item}}</option>
  </select>
  <qrcode value="Hello" type="{{qr_type}}"></qrcode>
</div>
```

```css
/* xxx.css */
.container {
  width: 100%;
  height: 100%;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color: #F1F3F5;
}
select{
  margin-top: 50px;
  margin-bottom: 50px;
}
```

```javascript
// index.js
export default {
  data: {
    qr_type: 'rect',
    bcol_list: ['rect','circle']
  },
  settype(e) {
    this.qr_type = e.newValue
  },
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d0/v3/wWf8zQwDTLuvKerDK8hx9Q/zh-cn_image_0000002558536589.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094816Z&HW-CC-Expire=86400&HW-CC-Sign=58456B981B1B956943E22910B63CD89FA79BFD2AC78F38ED3795C82217AF4F5A)

## 设置样式

通过color和background-color样式为二维码设置显示颜色和背景颜色。

```xml
<!-- xxx.hml-->
<div class="container">
  <qrcode value="Hello" type="rect"></qrcode>
</div>
```

```css
/* xxx.css */
.container {
  width: 100%;
  height: 100%;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color: #F1F3F5;
}
qrcode{
  width: 300px;
  height: 300px;
 color: blue;  background-color: #ffffff;
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/db/v3/8GQFNfzcTD-tIQzVm7IkHw/zh-cn_image_0000002527216858.png?HW-CC-KV=V1&HW-CC-Date=20260312T094816Z&HW-CC-Expire=86400&HW-CC-Sign=618F23C62420E9D1E5620B1BADFDFFE27606ADF958CEAE955099BB116A67DD87)

说明

-   width和height不一致时，取二者较小值作为二维码的边长，且最终生成的二维码居中显示。
    
-   width和height只设置一个时，取设置的值作为二维码的边长。都不设置时，使用200px作为默认边长。
    

## 场景示例

在本场景中将二维码与输入框绑定，通过改变输入框的内容改变二维码。

```xml
<!-- xxx.hml-->
<div class="container">
  <input style="margin-bottom: 100px;" onchange="change"></input>
  <qrcode value="{{textVal}}"></qrcode>
</div>
```

```css
/* xxx.css */
.container {
  width: 100%;
  height: 100%;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color: #F1F3F5;
}
qrcode{
  width: 400px;
  height: 400px;
}
```

```javascript
// index.js
export default{
  data: {
    textVal: ''
  },
  change(e){
    this.textVal = e.value
  }
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/fa/v3/ym_s12O2Qe2BPYFj0raBWQ/zh-cn_image_0000002558376693.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094816Z&HW-CC-Expire=86400&HW-CC-Sign=7DA4BBE5DE84603EF09D646C8607F08A70F33320568563DA8C52516919775EB8)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-components-qrcode*