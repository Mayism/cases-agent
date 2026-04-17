---
title: stepper开发指导
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-components-stepper
category: 指南
updated_at: 2026-03-12T09:41:50.083Z
---

# stepper开发指导

当一个任务需要多个步骤时，可以使用stepper组件展示当前进展。具体用法请参考[stepper API](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-components-container-stepper)。

## 创建stepper组件

在pages/index目录下的hml文件中创建一个stepper组件。

```xml
<!-- xxx.hml -->
<div class="container">
 <stepper>
   <stepper-item>
     <text>Step 1</text>
   </stepper-item>
   <stepper-item>
     <text>Step 2</text>
   </stepper-item>
 </stepper>
</div>
```

```css
/* xxx.css */
.container {
  width:100%;
  height:100%;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background-color: #F1F3F5;
}
text{
  width: 100%;
  height: 100%;
  text-align: center;
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1e/v3/UujUPno6RveqrEjXhVe4qQ/zh-cn_image_0000002527216822.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094124Z&HW-CC-Expire=86400&HW-CC-Sign=0351186765B364BA47AF5C1E06D568821CCB09679B946EF185F060601AA22355)

## 设置index属性

页面默认显示索引值为index的步骤。

```xml
<!-- xxx.hml -->
<div class="container">
 <stepper index="2">
   <stepper-item>
     <text>stepper-item1</text>
   </stepper-item>
   <stepper-item>
     <text>stepper-item2</text>
   </stepper-item>
   <stepper-item>
     <text>stepper-item3</text>
   </stepper-item>
  </stepper>
</div>
```

```css
/* xxx.css */
.container {
  width:100%;
  height:100%;
  flex-direction: column;
  background-color: #F1F3F5;
}
text{
  width: 100%;
  height: 100%;
  text-align: center;
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/82/v3/qmLGHmuJRR25k3coxlyy1w/zh-cn_image_0000002558376657.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094124Z&HW-CC-Expire=86400&HW-CC-Sign=F2111376D53499A3AFFF33EE4A7F597A6CBF6521A5BC7505056E7C1B77215FEC)

通过设置label属性，自定义stepper-item的提示按钮。

```xml
<!-- xxx.hml -->
<div class="container">
 <stepper index="1">
   <stepper-item label="{{label_1}}">
     <text>stepper-item1</text>
   </stepper-item>
   <stepper-item label="{{label_2}}">
     <text>stepper-item2</text>
   </stepper-item>
   <stepper-item label="{{label_3}}">
     <text>stepper-item3</text>
   </stepper-item>
   <stepper-item>
     <text>stepper-item4</text>
   </stepper-item>
 </stepper>
</div>
```

```css
/* xxx.css */
.container {
  width:100%;
  height:100%;
  flex-direction: column;
  background-color: #F1F3F5;
}
text{
  width: 100%;
  height: 100%;
  text-align: center;
}
```

```javascript
// xxx.js
export default {
  data: {
    label_1:{
      nextLabel: 'NEXT',
      status: 'normal'
    },
    label_2:{
      prevLabel: 'BACK',
      nextLabel: 'NEXT',
      status: 'normal'
    },
    label_3:{
      prevLabel: 'BACK',
      nextLabel: 'END',
      status: 'disabled'
    },
  },
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/85/v3/JU-HOqIQRPqqYkJr7LceAg/zh-cn_image_0000002527376776.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094124Z&HW-CC-Expire=86400&HW-CC-Sign=D73A312242624FE6B94D8B60868D0D032E0E2DF3CA0E3ADDF2E08463C8492107)

## 设置样式

stepper组件默认填充父容器，通过border和background-color设置边框、背景色。

```xml
<!-- xxx.hml -->
<div class="container" >
  <div class="stepperContent">
    <stepper class="stepperClass">
      <stepper-item>
        <text>stepper-item1</text>
      </stepper-item>
    </stepper>
  </div>
</div>
```

```css
/* xxx.css */
.container {
  width:100%;
  height:100%;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color:#F1F3F5;
}
.stepperContent{
  width: 300px;
  height: 300px;
}
.stepperClass{
  border:1px solid silver ;
  background-color: white;
}
text{
  width: 100%;
  height: 100%;
  text-align: center;
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/61/v3/bTfZ_SHtQZWiHdUYLonsiA/zh-cn_image_0000002558536555.png?HW-CC-KV=V1&HW-CC-Date=20260312T094124Z&HW-CC-Expire=86400&HW-CC-Sign=8D078F117A72AEEF4D82D99DD3704D70EE56FC1DBF5853B22E4DB28AD28E6F24)

## 添加事件

stepper分别添加finish，change，next，back，skip事件。

-   当change与next或back同时存在时，会先执行next或back事件再去执行change事件。
    
-   重新设置index属性值时要先清除index的值再重新设置，否则检测不到值的改变。
    

```xml
<!-- xxx.hml -->
<div class="container"  style="background-color:#F1F3F5;">
  <div >
    <stepper onfinish="stepperFinish" onchange="stepperChange" onnext="stepperNext" onback="stepperBack" onskip="stepperSkip" id="stepperId" index="{{index}}">
      <stepper-item>
        <text>stepper-item1</text>
        <button value="skip" onclick="skipClick"></button>
      </stepper-item>
      <stepper-item>
         <text>stepper-item2</text>
         <button value="skip" onclick="skipClick"></button>
      </stepper-item>
      <stepper-item>
        <text>stepper-item3</text>
      </stepper-item>
    </stepper>
  </div>
</div>
```

```css
/* xxx.css */
.doc-page {
  width:100%;
  height:100%;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}
stepper-item{
  width: 100%;
  flex-direction: column;
  align-self: center;
  justify-content: center;
}
text{
  margin-top: 45%;
  justify-content: center;
  align-self: center;
  margin-bottom: 50px;
}
button{
  width: 80%;
  height: 60px;
  margin-top: 20px;
}
```

```javascript
// xxx.js
import promptAction from '@ohos.promptAction';
export default {
  data: {
    index:0,
  },
   stepperSkip(){
    this.index=2;
  },
   skipClick(){
    this.$element('stepperId').setNextButtonStatus({status: 'skip', label: 'SKIP'});
  },
  stepperFinish(){
    promptAction.showToast({
      message: 'All Finished'
    })
  },
  stepperChange(e){
    console.info("stepperChange"+e.index)
    promptAction.showToast({
      // index表示当前步骤的序号
      message: 'Previous step: '+e.prevIndex+"-------Current step:"+e.index
    })
  },
  stepperNext(e){
    console.info("stepperNext"+e.index)
    promptAction.showToast({
      // pendingIndex表示将要跳转的序号
      message: 'Current step:'+e.index+"-------Next step:"+e.pendingIndex
    })
    var index = {pendingIndex:e.pendingIndex }
    return index;
  },
  stepperBack(e){
    console.info("stepperBack"+e.index)
    var index = {pendingIndex: e.pendingIndex }
    return index;
  }
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cc/v3/-yIMCj0sRdyky5w1LBP_dw/zh-cn_image_0000002527216824.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094124Z&HW-CC-Expire=86400&HW-CC-Sign=41C6D64B8A28CE5B70C7FF3FD08CD8B67C6CD7BE33F885517354C444C7E0799B)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-components-stepper*