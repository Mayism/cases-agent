---
title: 在Web组件的H5页面中，如何使用a标签实现打开各种页面
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkweb-41
category: FAQ
updated_at: 2026-03-13T04:41:53.183Z
---

# 在Web组件的H5页面中，如何使用a标签实现打开各种页面

情况一：跳转本应用的ArkTS页面

实现逻辑是使用Web组件的onLoadIntercept方法来监听Web组件加载的URL，然后通过回调结果判断是否需要跳转到本地ArkTS页面。如果需要跳转，使用router进行跳转。

通过获取URL并进行字符串操作来获取参数。

ArkTS页面一：

```typescript
import { webview } from '@kit.ArkWeb';
@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  build() {
    Column() {
      Column() {
        Web({ src: $rawfile('hello.html'), controller: this.controller })
          .onLoadIntercept((event) => {
            if(event){
              let url = event.data.getRequestUrl();
              console.log(url);
              if(url.indexOf('native://') === 0){
                this.getUIContext().getRouter().pushUrl({ url : url.substring(9)})
                return true;
              }
            }
            return false;
          })
          .width('100%')
          .height('100%')
      }
      .layoutWeight(1)
    }
  }
}
```

[UseLabelAOpenPages\_One.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/ets/pages/UseLabelAOpenPages_One.ets#L21-L48)

ArkTS页面二：

```typescript
@Entry
@Component
struct Second {
  build() {
    Column() {
      Text('This is the second page of this application')
    }
  }
}
```

[UseLabelAOpenPages\_Two.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/ets/pages/UseLabelAOpenPages_Two.ets#L21-L29)

H5侧

```xml
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>Document</title>
</head>
<body>
<div id="bg">
    hello world!<br>
    <a href="native://pages/Second">Jump to the second ads page of this application</a>
</div>
</body>
</html>
```

[UseLabelAOpenPages\_Fragment\_One.html](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/resources/rawfile/UseLabelAOpenPages_Fragment_One.html#L21-L35)

情况二：跳转本应用的H5页面

使用相对路径定位第二个H5页面。

H5侧页面一：

```xml
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>Document</title>
</head>
<body>
<div id="bg">
    hello world!<br>
    <a href="Second.html">Jump to the second H5 page of this application</a>
</div>
</body>
</html>
```

[UseLabelAOpenPages\_Fragment\_Two.html](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/resources/rawfile/UseLabelAOpenPages_Fragment_Two.html#L21-L35)

H5侧页面二：

```xml
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>Document</title>
</head>
<body>
<div id="bg">
    hello world
    <br>
    <br>
    I am the second H5 page of this application
</div>
</body>
</html>
```

[UseLabelAOpenPages\_Fragment\_Three.html](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/resources/rawfile/UseLabelAOpenPages_Fragment_Three.html#L21-L37)

情况三：跳转至系统应用页面

实现逻辑是在a标签的URL中存储系统应用的URL，然后使用startAbility打开系统应用，完成跳转。

ArkTS页面：

```typescript
import { webview } from '@kit.ArkWeb'
import { common } from '@kit.AbilityKit';
import { Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
function startSettingsInfo(context: common.UIAbilityContext,uri : string): void {
  let want: Want = {
    bundleName: 'com.huawei.hmos.settings',
    abilityName: 'com.huawei.hmos.settings.MainAbility',
    uri: uri
  };
  context.startAbility(want)
    .then(() => {
      // ...
    })
    .catch((err: BusinessError) => {
      console.error(`Failed to startAbility. Code: ${err.code}, message: ${err.message}`);
    });
}
@Entry
@Component
struct WebComponent {
  context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
  controller: webview.WebviewController = new webview.WebviewController();
  build() {
    Column() {
      Column() {
        Web({ src: $rawfile('hello.html'), controller: this.controller })
          .onLoadIntercept((event) => {
            if(event){
              let url = event.data.getRequestUrl();
              console.log(url);
              if(url.indexOf('hmos://') === 0){
                startSettingsInfo(this.context,url.substring(7))
                return true;
              }
            }
            return false;
          })
          .width('100%')
          .height('100%')
      }
      .layoutWeight(1)
    }
  }
}
```

[UseLabelAOpenPages\_Three.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/ets/pages/UseLabelAOpenPages_Three.ets#L21-L66)

H5侧：

```xml
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>Document</title>
</head>
<body>
<div id="bg">
    hello world!<br>
    <a href="hmos://volume_settings">Jump to system application (taking sound and vibration as examples)</a>
</div>
</body>
</html>
```

[UseLabelAOpenPages\_Fragment\_Four.html](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/resources/rawfile/UseLabelAOpenPages_Fragment_Four.html#L21-L36)

情况四：跳转至三方应用页面

实现逻辑为：使用Web组件的[onLoadIntercept](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-basic-components-web-events#onloadintercept10)方法监测Web组件加载的URL，获取URL并判断是否需要跳转到三方应用，然后通过startAbility方法打开三方应用，完成跳转。

ArkTS页面

```typescript
import { webview } from '@kit.ArkWeb'
import { common } from '@kit.AbilityKit';
import { Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  build() {
    Column() {
      Column() {
        Web({ src: $rawfile('hello.html'), controller: this.controller })
          .onLoadIntercept((event) => {
            let context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext; // UIAbilityContext
            let want: Want = {
              deviceId: '', // An empty DeviceId indicates that this device
              bundleName: '***', // BundleName of the third-party application you want to jump to
              moduleName: 'entry', // ModuleName is not mandatory
              abilityName: 'EntryAbility',
              parameters: {
                // Customize parameters to transmit page information
                router: 'index'
              }
            }
            context.startAbility(want).then(() => {
              console.log('success')
            }).catch((err: BusinessError) => {
              console.log('error:' + JSON.stringify(err))
            });
            return false;
          })
      }
      .layoutWeight(1)
    }
  }
}
```

[UseLabelAOpenPages\_Four.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/ets/pages/UseLabelAOpenPages_Four.ets#L21-L58)

H5侧：

```xml
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<a  href="">Jump to third-party applications</a>
</body>
</html>
```

[UseLabelAOpenPages\_Fragment\_Five.html](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/resources/rawfile/UseLabelAOpenPages_Fragment_Five.html#L21-L33)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkweb-41*