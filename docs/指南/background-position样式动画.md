---
title: background-position样式动画
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-animate-background-position-style
category: 指南
updated_at: 2026-03-12T09:53:55.175Z
---

# background-position样式动画

通过改变background-position属性（第一个值为X轴的位置，第二个值为Y轴的位置）移动背景图片位置，若背景图位置超出组件则超出部分的背景图不显示。

```xml
<!-- xxx.hml -->
<div class="container">
  <div class="content"></div>
  <div class="content1"></div>
</div>
```

```css
/* xxx.css */
.container {
  height: 100%;
  background-color:#F1F3F5;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 100%;
}
.content{
  width: 400px;
  height: 400px;
  /* 不建议图片长宽比为1:1 */
  background-image: url('common/images/bg-tv.jpg');
  background-size: 100%;
  background-repeat: no-repeat;
  animation: change 3s infinite;
  border: 1px solid black;
}
.content1{
  margin-top:50px;
  width: 400px;
  height: 400px;
  background-image: url('common/images/bg-tv.jpg');
  background-size: 50%;
  background-repeat: no-repeat;
  animation: change1 5s infinite;
  border: 1px solid black;
}
/* 背景图片移动出组件 */
@keyframes change{
  0%{
    background-position:0px top;
  }
  25%{
    background-position:400px top;
  }
  50%{
    background-position:0px top;
  }
  75%{
    background-position:0px bottom;
  }
  100%{
    background-position:0px top;
  }
}
/* 背景图片在组件内移动 */
@keyframes change1{
  0%{
    background-position:left top;
  }
  25%{
    background-position:50% 50%;
  }
  50%{
    background-position:right bottom;
  }
  100%{
    background-position:left top;
  }
}
```

说明

background-position仅支持背景图片的移动，不支持背景颜色（background-color）。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/84/v3/NQtyxdGZRKOr7MXNMKx4vQ/zh-cn_image_0000002558376711.gif?HW-CC-KV=V1&HW-CC-Date=20260312T095333Z&HW-CC-Expire=86400&HW-CC-Sign=0AD4F669194AAB001E4331B23A17B021FF88124DA0CA2647064BF8AB561AD0E7)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-js-animate-background-position-style*