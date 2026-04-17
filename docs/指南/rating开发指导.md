---
title: rating开发指导
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-components-rating
category: 指南
updated_at: 2026-03-12T09:46:02.544Z
---

# rating开发指导

rating是评分组件，用于展示用户对某项内容的评价等级。具体用法请参考[rating](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-components-basic-rating)。

## 创建rating组件

在pages/index目录下的hml文件中创建一个rating组件。

```xml
<!-- xxx.hml -->
<div class="container">
  <rating></rating>
</div>
```

```css
/* xxx.css */
.container {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #F1F3F5;
}
.rating {
  width: 80%;
  height: 150px;
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5d/v3/OJq_YfMZRsi82AYCEjVgvQ/zh-cn_image_0000002527376796.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094539Z&HW-CC-Expire=86400&HW-CC-Sign=E5E3587DA2FC22F3B21D75A5ED6D3995A2D767A3BA67EA08DAA2F4E42696FD83)

## 设置评分星级

rating组件通过设置numstars和rating属性设置评分条的星级总数和当前评星数。

```xml
<!-- xxx.hml -->
<div class="container">
  <rating numstars="6" rating="5">
  </rating>
</div>
```

```css
/* xxx.css */
.container {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #F1F3F5;
}
.rating {
  width: 80%;
  height: 150px;
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e5/v3/S__ZXtRLRPC5zPa-cVrlXA/zh-cn_image_0000002558536575.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094539Z&HW-CC-Expire=86400&HW-CC-Sign=88231BC95720D80EEF76B40B0B6B3CEAE568F3652AB72DBCAB7A1B0E3A3B8FC5)

## 设置评分样式

rating组件通过star-background、star-foreground和star-secondary属性设置单个星级未选择、选中和选中的次级背景图片。

```xml
<!-- xxx.hml -->
<div class="container">
  <div style="width: 500px;height: 500px;align-items: center;justify-content: center;flex-direction: column;">
    <rating numstars="5" rating="1" class="myrating" style="width: {{ratewidth}}; height:{{rateheight}};
    star-background: {{backstar}}; star-secondary: {{secstar}};star-foreground: {{forestar}};rtl-flip: true;">
    </rating>
  </div>
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

```javascript
// index.js
export default {
  data: {
    backstar: 'common/love.png',
    secstar: 'common/love.png',
    forestar: 'common/love1.png',
    ratewidth: '400px',
    rateheight: '150px'
  },
  onInit(){
  }
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9a/v3/femYzVXqQaqExrI5hhDVyw/zh-cn_image_0000002527216844.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094539Z&HW-CC-Expire=86400&HW-CC-Sign=84143FDA16FD2DEA2E83012621992003B74DACE54625D0B504950FFEB62166F8)

说明

-   star-background、star-secondary、star-foreground属性的星级图源必须全部设置，否则默认的星级颜色为灰色，提示图源设置错误。
    
-   star-background、star-secondary、star-foreground属性只支持本地路径图片，图片格式为png和jpg。
    

## 绑定事件

向rating组件添加change事件，打印当前评分。

```xml
<!-- xxx.hml -->
<div class="container">
  <rating numstars="5" rating="0" onchange="showrating"></rating>
</div>
```

```css
/* xxx.css */
.container {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #F1F3F5;
}
.rating {
  width: 80%;
  height: 150px;
}
```

```javascript
// xxx.js
import promptAction from '@ohos.promptAction';
export default {
  showrating(e) {
    promptAction.showToast({
      message: '当前评分' + e.rating
    })
  }
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/19/v3/-Gc0_8RwTx2Qifo4AG8l2g/zh-cn_image_0000002558376679.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094539Z&HW-CC-Expire=86400&HW-CC-Sign=CD49BAFDE203CB379751A1A51A109A58B819FED7BF4FA09B8CD687AB0C9081D1)

## 场景示例

开发者可以通过改变开关状态切换星级背景图，通过改变滑动条的值调整星级总数。

```xml
<!-- xxx.hml -->
<div style="width: 100%;height:100%;flex-direction: column;align-items: center;background-color: #F1F3F5;">
    <div style="width: 500px;height: 500px;align-items: center;justify-content: center;flex-direction: column;">
        <rating numstars="{{stars}}" rating="{{rate}}" stepsize="{{step}}" onchange="showrating" class="myrating"
                style="width: {{ratewidth}};height:{{rateheight}};star-background: {{backstar}};star-secondary: {{secstar}};
                        star-foreground: {{forestar}};rtl-flip: true;"></rating>
    </div>
    <div style="flex-direction: column;width: 80%;align-items: center;">
        <div style="width: 100%;height: 100px;align-items: center;justify-content: space-around;">
            <text>替换自定义图片</text>
            <switch checked="false" showtext="true" onchange="setstar"></switch>
        </div>
        <div style="width: 100%;height:120px;margin-top: 50px;margin-bottom: 50px;flex-direction: column;align-items: center;
                justify-content: space-around;">
            <text>numstars   {{stars}}</text>
            <slider id="sli1" min="0" max="10" value="5" step="1" onchange="setnumstars"></slider>
        </div>
        <div style="width: 100%;height:120px;flex-direction: column;align-items: center;justify-content: space-around;">
            <text>rating   {{rate}}</text>
            <slider id="sli2" min="0" max="10" value="{{rate}}" step="0.5" onchange="setrating"></slider>
        </div>
    </div>
</div>
```

```css
/* xxx.css */
.myrating:active {
    width: 500px;
    height: 100px;
}
.switch{
    font-size: 40px;
}
```

```javascript
// xxx.js
import promptAction from '@ohos.promptAction';
export default {
    data: {
        backstar: '',
        secstar: '',
        forestar: '',
        stars: 5,
        ratewidth: '300px',
        rateheight: '60px',
        step: 0.5,
        rate: 0
    },
    onInit(){
    },
    setstar(e) {
        if (e.checked == true) {
            this.backstar = '/common/love.png'
            this.secstar = 'common/love.png'
            this.forestar = 'common/love1.png'
        } else {
            this.backstar = ''
            this.secstar = ''
            this.forestar = ''
        }
    },
    setnumstars(e) {
        this.stars = e.progress
        this.ratewidth = 60 * parseInt(this.stars) + 'px'
    },
    setstep(e) {
        this.step = e.progress
    },
    setrating(e){
        this.rate = e.progress
    },
    showrating(e) {
        this.rate = e.rating
        promptAction.showToast({
            message: '当前评分' + e.rating
        })
    }
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ae/v3/uudutzUjQoO4kTZYZX1dKQ/zh-cn_image_0000002527376798.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094539Z&HW-CC-Expire=86400&HW-CC-Sign=A1CAF7FA4CCA09A1DAC45820EAFA6BD388E387FA6291A9BECF8F5A5CF6252979)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-components-rating*