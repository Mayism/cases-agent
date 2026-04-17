---
title: input开发指导
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-components-input
category: 指南
updated_at: 2026-03-12T09:43:56.670Z
---

# input开发指导

input是交互式组件，用于接收用户数据。其类型可设置为日期、多选框和按钮等。具体用法请参考[input API](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-components-basic-input)。

## 创建input组件

在pages/index目录下的hml文件中创建一个input组件。

```xml
<!-- xxx.hml -->
<div class="container">
  <input type="text">
     Please enter the content
  </input>
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

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/86/v3/tE1pfr4IQvae2d4Slww__g/zh-cn_image_0000002527216832.png?HW-CC-KV=V1&HW-CC-Date=20260312T094334Z&HW-CC-Expire=86400&HW-CC-Sign=71C37FF18060B1FBD12C3A2620974A10C9B46A71932A85208BC7556F7E2CEFA6)

## 设置input类型

通过设置type属性来定义input类型，如将input设置为button、date等。

```xml
<!-- xxx.hml -->
<div class="container">
  <div class="div-button">
    <dialog class="dialogClass" id="dialogId">
      <div class="content">
        <text>this is a dialog</text>
      </div>
    </dialog>
    <input class="button" type="button" value="click" onclick="btnclick"></input>
  </div>
  <div class="content">
    <input onchange="checkboxOnChange" checked="true" type="checkbox"></input>
  </div>
  <div class="content">
    <input type="date" class="flex" placeholder="Enter date"></input>
  </div>
</div>
```

```css
/* xxx.css */
.container {
  width: 100%;
  height: 100%;
  align-items: center;
  flex-direction: column;
  justify-content: center;
  background-color: #F1F3F5 ;
}
.div-button {
  flex-direction: column;
  align-items: center;
}
.dialogClass{
  width:80%;
  height: 200px;
}
.button {
  margin-top: 30px;
  width: 50%;
}
.content{
  width: 90%;
  height: 150px;
  align-items: center;
  justify-content: center;
}
.flex {
  width: 80%;
  margin-bottom:40px;
}
```

```javascript
// xxx.js
export default {
  btnclick(){
    this.$element('dialogId').show()
  },
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/18/v3/0UkKhDj3TVSpxDrbCbeKcQ/zh-cn_image_0000002558376667.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094334Z&HW-CC-Expire=86400&HW-CC-Sign=A50CF1EBD63DEB9B192BCA0E3C6DACBE75E76CC06B8DD9B1E7AE1837177F4D8D)

说明

仅当input类型为checkbox和radio时，当前组件选中的属性是checked才生效，默认值为false。

## 事件绑定

向input组件添加translate事件。

```xml
<!-- xxx.hml -->
<div class="content">
    <text style="margin-left: -7px;">
        <span>Enter text and then touch and hold what you've entered</span>
    </text>
    <input class="input" type="text" ontranslate="translate" placeholder="translate"> </input>
</div>
```

```css
/* xxx.css */
.content {
  width: 100%;
  height: 100%;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color: #F1F3F5;
}
.input {
  margin-top: 50px;
  width: 60%;
  placeholder-color: gray;
}
text{
  width:100%;
  font-size:25px;
  text-align:center;
}
```

```javascript
// xxx.js
import promptAction from '@ohos.promptAction'
export default {
    translate(e) {
        promptAction.showToast({
            message: e.value,
            duration: 3000,
        });
    }
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b9/v3/DN08dSPQTUyOJq4HNLbK9w/zh-cn_image_0000002527376786.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094334Z&HW-CC-Expire=86400&HW-CC-Sign=79B15EA74A73747BA2A13BEF6E058BBC819A32AED5CAF5039BB5E24AB5F65FD1)

## 设置输入提示

通过对input组件添加showError方法来提示输入的错误原因。

```xml
<!-- xxx.hml -->
<div class="content">
  <input id="input" class="input" type="text"  maxlength="20" placeholder="Please input text" onchange="change">
  </input>
  <input class="button" type="button" value="Submit" onclick="buttonClick"></input>
</div>
```

```css
/* xxx.css */
.content {
  width: 100%;
  height: 100%;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color: #F1F3F5;
}
.input {
  width: 80%;
  placeholder-color: gray;
}
.button {
  width: 30%;
  margin-top: 50px;
}
```

```javascript
// xxx.js
import promptAction from '@ohos.promptAction'
 export default {
   data:{
     value:'',
   },
   change(e){
     this.value = e.value;
     promptAction.showToast({
     message: "value: " + this.value,
       duration: 3000,
      });
   },
   buttonClick(e){
     if(this.value.length > 6){
       this.$element("input").showError({
         error:  'Up to 6 characters are allowed.'
       });
      }else if(this.value.length == 0){
        this.$element("input").showError({
          error:this.value + 'This field cannot be left empty.'
        });
      }else{
        promptAction.showToast({
          message: "success "
        });
      }
   },
 }
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8b/v3/40IU3Nu5Q4--vvXUk-lKPw/zh-cn_image_0000002558536565.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094334Z&HW-CC-Expire=86400&HW-CC-Sign=ABB3832139D1755F23288EAC5290CEC2CA7848FC87689DBE22757ED75EC680CB)

说明

该方法在input类型为text、email、date、time、number和password时生效。

## 场景示例

根据场景选择不同类型的input输入框，完成信息录入。

```xml
<!-- xxx.hml -->
<div class="container">
  <div class="label-item">
    <label>memorandum</label>
  </div>
  <div class="label-item">
    <label class="lab" target="input1">content:</label>
    <input class="flex" id="input1" placeholder="Enter content" />
  </div>
  <div class="label-item">
    <label class="lab" target="input3">date:</label>
    <input class="flex" id="input3" type="date" placeholder="Enter date" />
  </div>
  <div class="label-item">
    <label class="lab" target="input4">time:</label>
    <input class="flex" id="input4" type="time" placeholder="Enter time" />
  </div>
  <div class="label-item">
    <label class="lab" target="checkbox1">Complete:</label>
    <input class="flex" type="checkbox" id="checkbox1" style="width: 100px;height: 100px;" />
  </div>
  <div class="label-item">
    <input class="flex" type="button" id="button" value="save" onclick="btnclick"/>
  </div>
</div>
```

```css
/* xxx.css */
.container {
  flex-direction: column;
  background-color: #F1F3F5;
}
.label-item {
  align-items: center;
  border-bottom-width: 1px;border-color: #dddddd;
}
.lab {
  width: 400px;}
label {
  padding: 30px;
  font-size: 30px;
  width: 320px;
  font-family: serif;
  color: #9370d8;
  font-weight: bold;
}
.flex {
  flex: 1;
}
.textareaPadding {
  padding-left: 100px;
}
```

```javascript
// xxx.js
import promptAction from '@ohos.promptAction';
export default {
  data: {
  },
  onInit() {
  },
  btnclick(e) {
    promptAction.showToast({
      message:'Saved successfully!'
    })
  }
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/fa/v3/pVK_JIhRRnKIIU0c9MCZDw/zh-cn_image_0000002527216834.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094334Z&HW-CC-Expire=86400&HW-CC-Sign=D7223701B007924934D83DE7275D158D52AF1AD997346C926B31ED312BD2BA02)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-components-input*