---
title: JS语法参考
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/js-framework-syntax-js
category: 指南
updated_at: 2026-03-12T09:34:41.756Z
---

# JS语法参考

JS文件用来定义HML页面的业务逻辑，支持ECMA规范的JavaScript语言。基于JavaScript语言的动态化能力，可以使应用更加富有表现力，具备更加灵活的设计能力。下面讲述JS文件的编译和运行的支持情况。

## 语法

支持ES6语法。

-   模块声明
    
    使用import方法引入功能模块：
    
    ```javascript
    import router from '@ohos.router';
    ```
    
-   代码引用
    
    使用import方法导入js代码：
    
    ```javascript
    import utils from '../../common/utils.js';
    ```
    

## 对象

-   应用对象
    
    | 属性 | 类型 | 描述 |
    | --- | --- | --- |
    | $def | Object | 使用this.$app.$def获取在app.js中暴露的对象。说明：应用对象不支持数据绑定，需主动触发UI更新。 |
    
    示例代码
    
    ```javascript
    // app.js
    export default {
      onCreate() {
        console.info('Application onCreate');
      },
      onDestroy() {
        console.info('Application onDestroy');
      },
      globalData: {
        appData: 'appData',
        appVersion: '2.0',
      },
      globalMethod() {
        console.info('This is a global method!');
        this.globalData.appVersion = '3.0';
      }
    };
    ```
    
    ```javascript
    // index.js页面逻辑代码
    export default {
      data: {
        appData: 'localData',
        appVersion:'1.0',
      },
      onInit() {
        this.appData = this.$app.$def.globalData.appData;
        this.appVersion = this.$app.$def.globalData.appVersion;
      },
      invokeGlobalMethod() {
        this.$app.$def.globalMethod();
      },
      getAppVersion() {
        this.appVersion = this.$app.$def.globalData.appVersion;
      }
    }
    ```
    
-   页面对象
    
    | 属性 | 类型 | 描述 |
    | --- | --- | --- |
    | data | Object/Function | 页面的数据模型，类型是对象或者函数，如果类型是函数，返回值必须是对象。属性名不能以$或_开头，不要使用保留字for, if, show, tid。data字段不可与private/public字段同时使用。 |
    | $refs | Object | [获取DOM元素](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/js-framework-syntax-js#获取dom元素) |
    | private | Object | 页面的数据模型，private下的数据属性只能由当前页面修改。 |
    | public | Object | 页面的数据模型，public下的数据属性的行为与data保持一致。 |
    | props | Array/Object | [Props](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-components-custom-props#props) |
    | computed | Object | [computed](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-components-custom-props#computed) |
    

## 方法

-   数据方法
    
    | 方法 | 参数 | 描述 |
    | --- | --- | --- |
    | $set | key: string, value: any | 添加新的数据属性或者修改已有数据属性。用法：this.$set('key',value)：添加数据属性。 |
    | $delete | key: string | 删除数据属性。用法：this.$delete('key')：删除数据属性。 |
    
    示例代码
    
    ```javascript
    // index.js
    export default {
      data: {
        keyMap: {
          OS: 'OS',
          Version: '2.0',
        },
      },
      getAppVersion() {
        this.$set('keyMap.Version', '3.0');
        console.info("keyMap.Version = " + this.keyMap.Version); // keyMap.Version = 3.0
        this.$delete('keyMap');
        console.info("keyMap.Version = " + this.keyMap); // log print: keyMap.Version = undefined
      }
    }
    ```
    
-   公共方法
    
    | 方法 | 参数 | 描述 |
    | --- | --- | --- |
    | $element | id: string | [获取DOM元素](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/js-framework-syntax-js#获取dom元素) |
    | $rootElement | 无 | 获取根组件对象。用法：this.$rootElement().scrollTo({ duration: 500, position: 300 }), 页面在500ms内滚动300px。 |
    | $root | 无 | [获取ViewModel](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/js-framework-syntax-js#获取viewmodel) |
    | $parent | 无 | [获取ViewModel](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/js-framework-syntax-js#获取viewmodel) |
    | $child | id: string | [获取ViewModel](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/js-framework-syntax-js#获取viewmodel) |
    
-   事件方法
    
    | 方法 | 参数 | 描述 |
    | --- | --- | --- |
    | $watch | data: string, callback: string | Function | [$watch感知数据改变](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-components-custom-props#watch感知数据改变) |
    
-   页面方法
    
    | 方法 | 参数 | 描述 |
    | --- | --- | --- |
    | scrollTo6+ | scrollPageParam: ScrollPageParam | 将页面滚动到目标位置，可以通过ID选择器指定或者滚动距离指定。 |
    
    **表1** ScrollPageParam6+
    
    | 名称 | 类型 | 默认值 | 描述 |
    | --- | --- | --- | --- |
    | position | number | - | 指定滚动位置。 |
    | id | string | - | 指定需要滚动到的元素id。 |
    | duration | number | 300 | 指定滚动时长，单位为毫秒。 |
    | timingFunction | string | ease | [动画样式animation-timing-function](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-components-common-animation) |
    | complete | () => void | - | 指定滚动完成后需要执行的回调函数。 |
    
    示例：
    
    ```javascript
    this.$rootElement().scrollTo({ position: 0 });
    this.$rootElement().scrollTo({ id: 'id', duration: 200, timingFunction: 'ease-in', complete: () => {
        console.info('滚动已完成');
    } });
    ```
    

## 获取DOM元素

1.  通过$refs获取DOM元素
    
    ```xml
    <!-- index.hml -->
    <div class="container">
      <image-animator class="image-player" ref="animator" images="{{images}}" duration="1s" onclick="handleClick"></image-animator>
    </div>
    ```
    
    ```javascript
    // index.js
    export default {
      data: {
        images: [
          { src: '/common/frame1.png' },
          { src: '/common/frame2.png' },
          { src: '/common/frame3.png' }
        ]
      },
      handleClick() {
        const animator = this.$refs.animator; // 获取ref属性为animator的DOM元素
        const state = animator.getState();
        if (state === 'Paused') {
          animator.resume();
        } else if (state === 'Stopped') {
          animator.start();
        } else {
          animator.pause();
        }
      },
    };
    ```
    
2.  通过$element获取DOM元素
    
    ```xml
    <!-- index.hml -->
    <div class="container" style="width:500px;height: 700px; margin: 100px;">
      <image-animator class="image-player" id="animator" images="{{images}}" duration="1s" onclick="handleClick"></image-animator>
    </div>
    ```
    
    ```javascript
    // index.js
    export default {
      data: {
        images: [
          { src: '/common/frame1.png' },
          { src: '/common/frame2.png' },
          { src: '/common/frame3.png' }
        ]
      },
      handleClick() {
        const animator = this.$element('animator'); // 获取id属性为animator的DOM元素
        const state = animator.getState();
        if (state === 'Paused') {
          animator.resume();
        } else if (state === 'Stopped') {
          animator.start();
        } else {
          animator.pause();
        }
      },
    };
    ```
    

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5a/v3/ONjLCocCSc2889bRS-srjw/zh-cn_image_0000002526885344.gif?HW-CC-KV=V1&HW-CC-Date=20260312T093441Z&HW-CC-Expire=86400&HW-CC-Sign=741A4797222AF94A3B4B226E4860F3165D3C7559FBC26401DCFC73D11E97BB5B)

## 获取ViewModel

根节点所在页面：

```xml
<!-- root.hml -->
<element name='parentComp' src='../../common/component/parent/parent.hml'></element>
<div class="container">
  <div class="container">
    <text>{{text}}</text>
    <parentComp></parentComp>
  </div>
</div>
```

```javascript
// root.js
export default {
  data: {
    text: 'I am root!',
  },
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/eb/v3/ruCFCQO6SKKFuriMxNsg_Q/zh-cn_image_0000002557925191.png?HW-CC-KV=V1&HW-CC-Date=20260312T093441Z&HW-CC-Expire=86400&HW-CC-Sign=8FFBE1796C673C5E4B9A1CE867367A0468F76A957B14D21D722DB17FE3973F8A)

自定义parent组件：

```xml
<!-- parent.hml -->
<element name='childComp' src='../child/child.hml'></element>
<div class="item" onclick="textClicked">
  <text class="text-style" onclick="parentClicked">parent component click</text>
  <text class="text-style" if="{{showValue}}">hello parent component!</text>
  <childComp id = "selfDefineChild"></childComp>
</div>
```

```javascript
// parent.js
export default {
  data: {
    showValue: false,
    text: 'I am parent component!',
  },
  parentClicked () {
    this.showValue = !this.showValue;
    console.info('parent component get parent text');
    console.info(`${this.$parent().text}`);
    console.info("parent component get child function");
    console.info(`${this.$child('selfDefineChild').childClicked()}`);
  },
}
```

自定义child组件：

```xml
<!-- child.hml -->
<div class="item" onclick="textClicked">
  <text class="text-style" onclick="childClicked">child component clicked</text>
  <text class="text-style" if="{{isShow}}">hello child component</text>
</div>
```

```javascript
// child.js
export default {
  data: {
    isShow: false,
    text: 'I am child component!',
  },
  childClicked () {
    this.isShow = !this.isShow;
    console.info('child component get parent text');
    console.info('${this.$parent().text}');
    console.info('child component get root text');
    console.info('${this.$root().text}');
  },
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f7/v3/5uXmtZogTG-VT8NoUjDD9g/zh-cn_image_0000002527045276.gif?HW-CC-KV=V1&HW-CC-Date=20260312T093441Z&HW-CC-Expire=86400&HW-CC-Sign=B7F2BBCE17CE7739B9BF09D1FE6801FE2946840844D2FC914CA8C794D488591F)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/js-framework-syntax-js*