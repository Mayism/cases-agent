---
title: text开发指导
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-components-text
category: 指南
updated_at: 2026-03-12T09:43:31.981Z
---

# text开发指导

text是文本组件，用于呈现一段文本信息。具体用法请参考[text API](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-components-basic-text)。

## 创建text组件

在pages/index目录下的hml文件中创建一个text组件。

```xml
<!-- xxx.hml -->
<div class="container" style="text-align: center;justify-content: center; align-items: center;">
  <text>Hello World</text>
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

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9b/v3/4dQ7JiBXTLqU5AzOmSjdtg/zh-cn_image_0000002527376782.png?HW-CC-KV=V1&HW-CC-Date=20260312T094306Z&HW-CC-Expire=86400&HW-CC-Sign=BD099FE7DF987B04DCAF9C74B1BEB16450B51306EA4E959BA526C166D1D39792)

## 设置text组件样式和属性

-   添加文本样式
    
    设置color、font-size、allow-scale、word-spacing、text-align属性分别为文本添加颜色、大小、缩放、文本之间的间距和文本在水平方向的对齐方式。
    
    ```xml
    <!-- xxx.hml -->
    <div class="container" style="background-color:#F1F3F5;flex-direction: column;justify-content: center; align-items: center;">
      <text style="color: blueviolet; font-size: 40px; allow-scale:true">
        This is a passage
      </text>
      <text style="color: blueviolet; font-size: 40px; margin-top: 20px; allow-scale:true;word-spacing: 20px;text-align: center">
        This is a passage
      </text>
    </div>
    ```
    
    ```css
    /* xxx.css */
    .container {
      display: flex;
      width: 100%;
      height: 100%;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      background-color: #F1F3F5;
    }
    ```
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6b/v3/shYgQ8hCR7mj-SE4KDQR2g/zh-cn_image_0000002558536561.png?HW-CC-KV=V1&HW-CC-Date=20260312T094306Z&HW-CC-Expire=86400&HW-CC-Sign=1AE50AD1118269CC7880047A6DE847FEF941147C8D854169D87AC32CCFD0619F)
    
-   添加划线
    
    设置text-decoration和text-decoration-color属性为文本添加划线和划线颜色，text-decoration枚举值请参考 text自有样式。
    
    ```xml
    <!-- xxx.hml -->
    <div class="container" style="background-color:#F1F3F5;">
      <text style="text-decoration:underline">
        This is a passage
      </text>
      <text style="text-decoration:line-through;text-decoration-color: red">
        This is a passage
       </text>
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
    }
    text{
      font-size: 50px;
    }
    ```
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f9/v3/0apCViMJRcKHsPzUsgnG_Q/zh-cn_image_0000002527216830.png?HW-CC-KV=V1&HW-CC-Date=20260312T094306Z&HW-CC-Expire=86400&HW-CC-Sign=36DF5EDE8C2405B013754AEF563860937ABB68308DDDCE66782CD0BDEB3AEA30)
    
-   隐藏文本内容
    
    当文本内容过多而显示不全时，添加text-overflow属性将隐藏内容以省略号的形式展现。
    
    ```xml
    <!-- xxx.hml -->
    <div class="container">
      <text class="text">
        This is a passage
      </text>
    </div>
    ```
    
    ```css
    /* xxx.css */
    .container {
      width: 100%;
      height: 100%;
      flex-direction: column;
      align-items: center;
      background-color: #F1F3F5;
      justify-content: center;
    }
    .text{
      width: 200px;
      max-lines: 1;
      text-overflow:ellipsis;
    }
    ```
    
    说明
    
    -   text-overflow样式需要与max-lines样式配套使用，设置了最大行数的情况下生效。
    -   max-lines属性设置文本最多可以展示的行数。
    
    ​ ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ae/v3/6A0aPEO-SXyzXBdL8iIbDA/zh-cn_image_0000002558376665.png?HW-CC-KV=V1&HW-CC-Date=20260312T094306Z&HW-CC-Expire=86400&HW-CC-Sign=F405C8DD27A8FE1136E74FA12B8D0C257115945973B1C2BBC5CD13D2C6A20516)
    
-   text组件支持[Span](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-components-basic-span)子组件
    
    ```xml
    <!-- xxx.hml -->
    <div class="container" style="justify-content: center; align-items: center;flex-direction: column;background-color: #F1F3F5;  width: 100%;height: 100%;">
      <text style="font-size: 45px;">
        This is a passage
      </text>
      <text style="font-size: 45px;">
        <span style="color: aqua;">This </span><span style="color: #F1F3F5;">      1
        </span>
        <span style="color: blue;"> is a </span>    <span style="color: #F1F3F5;">      1    </span>
        <span style="color: red;">  passage </span>
      </text>
    </div>
    ```
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/10/v3/GLGXZ1mjQreZdOVIPR128g/zh-cn_image_0000002527376784.png?HW-CC-KV=V1&HW-CC-Date=20260312T094306Z&HW-CC-Expire=86400&HW-CC-Sign=81B501F6F5A209777AAC15C6E540469176050C3B1D5688604BE279408BFAABB0)
    
    说明
    
    -   当使用Span子组件组成文本段落时，如果Span属性样式异常（例如：font-weight设置为1000），将导致文本段落显示异常。
        
    -   在使用Span子组件时，注意text组件内不能存在文本内容，如果存在文本内容也只会显示子组件Span里的内容。
        
    

## 场景示例

text组件通过数据绑定展示文本内容，Span组件通过设置show属性来实现文本内容的隐藏和显示。

```xml
<!-- xxx.hml -->
<div class="container">
  <div style="align-items: center;justify-content: center;">
    <text class="title">
      {{ content }}
    </text>
    <switch checked="true" onchange="test"></switch>
  </div>
  <text class="span-container" style="color: #ff00ff;">
    <span show="{{isShow}}">  {{ content  }}  </span>
    <span style="color: white;">
        1
    </span>
    <span style="color: #f76160">Hide clip </span>
  </text>
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
  background-color: #F1F3F5;
}
.title {
  font-size: 26px;
  text-align:center;
  width: 200px;
  height: 200px;
}
```

```javascript
// xxx.js
export default {
  data: {
    isShow:true,
    content: 'Hello World'
  },
  onInit(){    },
  test(e) {
    this.isShow = e.checked
  }
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/61/v3/WNPzTjhvRIqTpJgKlsL64g/zh-cn_image_0000002558536563.gif?HW-CC-KV=V1&HW-CC-Date=20260312T094306Z&HW-CC-Expire=86400&HW-CC-Sign=D4D8FD5D72F8C53315FF27FA0D44CE4E45227B1FA2B80FE886A1C848BD050E87)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-components-text*