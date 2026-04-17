---
title: form开发指导
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-components-form
category: 指南
updated_at: 2026-03-12T09:41:22.801Z
---

# form开发指导

form是一个表单容器，支持容器内[Input](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-components-basic-input)组件内容的提交和重置。具体用法请参考[form API](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-components-container-form)。

## 创建form组件

在pages/index目录下的hml文件中创建一个form组件。

```xml
<!-- xxx.hml -->
<div class="container">
  <form style="width: 100%; height: 20%">
    <input type="text" style="width:80%"></input>
  </form>
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
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6d/v3/qPjXwAWXRDmwuBlKmEKrSA/zh-cn_image_0000002527216820.png?HW-CC-KV=V1&HW-CC-Date=20260312T094058Z&HW-CC-Expire=86400&HW-CC-Sign=F93400D5BF1AB26E615B8BCAD7ADB2FCC9BE688F1B6C88459932F69467EDDB37)

## 实现表单缩放

为form组件添加click-effect属性，实现点击表单后的缩放效果，click-effect枚举值请参考[通用属性](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-components-common-attributes)。

```xml
<!-- xxx.hml -->
<div class="container">
  <form  id="formId" class="formClass" click-effect="spring-large">
    <input type="text"></input>
  </form>
</div>
```

## 设置form样式

通过为form添加background-color和border属性，来设置表单的背景颜色和边框。

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
.formClass{
  width: 80%;
  height: 100px;
  padding: 10px;
  border: 1px solid #cccccc;
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/93/v3/SGUb7fFPQ7Wy8YpdRiIenw/zh-cn_image_0000002558376655.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094058Z&HW-CC-Expire=86400&HW-CC-Sign=0B37B6095994B686CB772413883BDF231A5C581475088B5955B3667C0AD31266)

## 添加响应事件

为form组件添加submit和reset事件，来提交表单内容或重置表单选项。

```xml
<!-- xxx.hml -->
<div class="container">
  <form onsubmit='onSubmit' onreset='onReset' class="form">
    <div style="width: 100%;justify-content: center;">
      <label>Option 1</label>
      <input type='radio' name='radioGroup' value='radio1'></input>
      <label>Option 2</label>
      <input type='radio' name='radioGroup' value='radio2'></input>
    </div>
    <div style="width: 100%;justify-content: center; margin-top: 20px">
      <input type="submit" value="Submit" style="width:120px; margin-right:20px;" >
      </input>
      <input type="reset" value="Reset" style="width:120px;"></input>
    </div>
  </form>
</div>
```

```css
/* index.css */
.container{
  width: 100%;
  height: 100%;
  flex-direction: column;
  justify-items: center;
  align-items: center;
  background-color: #F1F3F5;
}
.form{
  width: 100%;
  height: 30%;
  margin-top: 40%;
  flex-direction: column;
  justify-items: center;
  align-items: center;
}
```

```javascript
// xxx.js
import promptAction from '@ohos.promptAction';
export default{
  onSubmit(result) {
    promptAction.showToast({
      message: result.value.radioGroup
    })
  },
  onReset() {
    promptAction.showToast({
      message: 'Reset All'
    })
  }
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/44/v3/LlzZvJcTRNWSS0UrrVUjSg/zh-cn_image_0000002527376774.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094058Z&HW-CC-Expire=86400&HW-CC-Sign=14A167DAE8AEF0AFB44526CF7EB82524A2AA4EB7449543A46D0F705EFF2325FC)

## 场景示例

在本场景中，开发者可以选择相应选项并提交或重置数据。

创建[Input](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-components-basic-input)组件，分别设置type属性为checkbox（多选框）和radio（单选框），再使用form组件的onsubmit和onreset事件实现表单数据的提交与重置。

```xml
<!-- xxx.hml -->
<div class="container">
   <form onsubmit="formSubmit" onreset="formReset">
 <text style="font-size: 30px; margin-bottom: 20px; margin-top: 100px;">
      <span > Form </span>
  </text>
    <div style="flex-direction: column;width: 90%;padding: 30px 0px;">
     <text class="txt">Select 1 or more options</text>
      <div style="width: 90%;height: 150px;align-items: center;justify-content: space-around;">
        <label target="checkbox1">Option 1</label>
        <input id="checkbox1" type="checkbox" name="checkbox1"></input>
        <label target="checkbox2">Option 2</label>
        <input id="checkbox2" type="checkbox" name="checkbox2"></input>
       </div>
       <divider style="margin: 20px 0px;color: pink;height: 5px;"></divider>
       <text class="txt">Select 1 option</text>
       <div style="width: 90%;height: 150px;align-items: center;justify-content: space-around;">
         <label target="radio1">Option 1</label>
         <input id="radio1" type="radio" name="myradio"></input>
         <label target="radio2">Option 2</label>
         <input id="radio2" type="radio" name="myradio"></input>
       </div>
       <divider style="margin: 20px 0px;color: pink;height: 5px;"></divider>
       <text class="txt">Text box</text>
       <input type="text" placeholder="Enter content." style="margin-top: 50px;"></input>
       <div style="width: 90%;align-items: center;justify-content: space-between;margin: 40px;">
         <input type="submit">Submit</input>
         <input type="reset">Reset</input>
       </div>
    </div>
  </form>
</div>
```

```css
/* index.css */
.container {
  width: 100%;
  height: 100%;
  flex-direction:column;
  align-items:center;
  background-color:#F1F3F5;
}
.txt {
  font-size:33px;
  font-weight:bold;
  color:darkgray;
}
label{
  font-size: 20px;
}
```

```javascript
// xxx.js
import promptAction from '@ohos.promptAction';
export default {
  formSubmit() {
    promptAction.showToast({
      message: 'Submitted.'
    })
  },
  formReset() {
    promptAction.showToast({
      message: 'Reset.'
    })
  }
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/67/v3/EwOS6KEOTA-Ezk2jbVThEA/zh-cn_image_0000002558536553.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094058Z&HW-CC-Expire=86400&HW-CC-Sign=914B9E01F1CC368DFBB28097B44E88B118C81A5F670E355552D98DEDCAD9277D)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-components-form*