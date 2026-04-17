---
title: 视频播放 (Video)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-video-player
category: 指南
updated_at: 2026-03-12T08:42:30.554Z
---

# 视频播放 (Video)

Video组件用于播放视频文件并控制其播放状态，常用于短视频和应用内部视频的列表页面。当视频完整出现时会自动播放，用户点击视频区域则会暂停播放，同时显示播放进度条，通过拖动播放进度条指定视频播放到具体位置。具体用法请参考[Video](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-media-components-video)。

## 创建视频组件

Video通过调用接口来创建，接口调用形式如下：

Video(value: VideoOptions)

## 加载视频资源

Video组件支持加载本地视频和网络视频。具体的数据源配置请参考[VideoOptions对象说明](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-media-components-video#videooptions对象说明)。

### 加载本地视频

-   普通本地视频。
    
    加载本地视频时，首先在本地rawfile目录指定对应的文件，如下图所示。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c5/v3/DzdDrxGSQIikiHiJFpGGng/zh-cn_image_0000002557924977.png?HW-CC-KV=V1&HW-CC-Date=20260312T084206Z&HW-CC-Expire=86400&HW-CC-Sign=76B3A87CAA121C41995B9A72DAE45DBAEF0373AEB2B1C97B3181F63CECA9ECB8)
    
    再使用资源访问符$rawfile()引用视频资源。
    
    ```TypeScript
    // xxx.ets
    // ···
    @Component
    export struct LocalVideo {
      private controller: VideoController = new VideoController();
      private previewUris: Resource = $r('app.media.preview');
      private innerResource: Resource = $rawfile('videoTest.mp4');
      build() {
        Column() {
          Video({
            src: this.innerResource,  // 设置视频源
            previewUri: this.previewUris, // 设置预览图
            controller: this.controller //设置视频控制器，可以控制视频的播放状态
          })
        }
      }
    }
    ```
    
    [LocalVideo.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/VideoPlayer/entry/src/main/ets/pages/LocalVideo.ets#L16-L37)
    
-   [Data Ability](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/dataability-overview)提供的视频路径带有dataability://前缀，使用时确保对应视频资源存在。
    
    ```TypeScript
    // xxx.ets
    // ···
    @Component
    export struct LocalVideoTwo {
      private controller: VideoController = new VideoController();
      private previewUris: Resource = $r('app.media.preview');
      private videoSrc: string = 'dataability://device_id/com.domainname.dataability.videodata/video/10';
      build() {
        Column() {
          Video({
            src: this.videoSrc,
            previewUri: this.previewUris,
            controller: this.controller
          })
        }
      }
    }
    ```
    
    [DataAbility.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/VideoPlayer/entry/src/main/ets/pages/DataAbility.ets#L16-L39)
    

### 加载沙箱路径视频

支持file://路径前缀的字符串，用于读取应用沙箱路径内的资源，需要确保应用沙箱目录路径下的文件存在并且有可读权限。

```TypeScript
// xxx.ets
// ···
@Component
export struct Sandbox {
  private controller: VideoController = new VideoController();
  private videoSrc: string = 'file:///data/storage/el2/base/haps/entry/files/show.mp4';
  build() {
    Column() {
      Video({
        src: this.videoSrc,
        controller: this.controller
      })
    }
  }
}
```

[Sandbox.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/VideoPlayer/entry/src/main/ets/pages/Sandbox.ets#L16-L36)

### 加载网络视频

加载网络视频时，需要申请ohos.permission.INTERNET权限，具体申请方式请参考[声明权限](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/declare-permissions)。此时，Video的src属性为网络视频的链接。

```TypeScript
// xxx.ets
// ···
@Component
export struct OnlineVideo {
  private controller: VideoController = new VideoController();
  private previewUris: Resource = $r('app.media.preview');
  private videoSrc: string = 'www.example.com/example.mp4'; // 使用时请替换为实际视频加载网址
  build() {
    Column() {
      Video({
        src: this.videoSrc,
        previewUri: this.previewUris,
        controller: this.controller
      })
    }
  }
}
```

[OnlineVideo.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/VideoPlayer/entry/src/main/ets/pages/OnlineVideo.ets#L16-L39)

## 添加属性

Video组件[属性](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-media-components-video#属性)主要用于设置视频的播放形式。例如设置视频播放是否静音、播放是否显示控制条等。

```TypeScript
// xxx.ets
// ···
@Component
export struct AttributeVideo {
  private controller: VideoController = new VideoController();
  build() {
    Column() {
      Video({
        controller: this.controller
      })
        .muted(false) // 设置是否静音
        .controls(false) // 设置是否显示默认控制条
        .autoPlay(false) // 设置是否自动播放
        .loop(false) // 设置是否循环播放
        .objectFit(ImageFit.Contain) // 设置视频填充模式
    }
  }
}
```

[AttributeVideo.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/VideoPlayer/entry/src/main/ets/pages/AttributeVideo.ets#L16-L41)

## 事件调用

Video组件回调事件主要包括播放开始、播放暂停、播放结束、播放失败、播放停止、视频准备和操作进度条等事件，除此之外，Video组件也支持通用事件的调用，如点击、触摸等事件的调用。详细事件请参考[事件说明](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-media-components-video#事件)。

```TypeScript
// xxx.ets
@Entry
@Component
struct EventCall {
  private controller: VideoController = new VideoController();
  private previewUris: Resource = $r('app.media.preview');
  private innerResource: Resource = $rawfile('videoTest.mp4');
  build() {
    Column() {
      Video({
        src: this.innerResource,
        previewUri: this.previewUris,
        controller: this.controller
      })
        .onUpdate((event) => { // 更新事件回调
        })
        .onPrepared((event) => { // 准备事件回调
        })
        .onError(() => { // 失败事件回调
        })
        .onStop(() => { // 停止事件回调
        })
    }
  }
}
```

[EventCall.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/VideoPlayer/entry/src/main/ets/pages/EventCall.ets#L16-L43)

## Video控制器使用

Video控制器主要用于控制视频的状态，包括播放、暂停、停止以及设置进度等，详细使用请参考[VideoController使用说明](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-media-components-video#videocontroller)。

-   默认控制器
    
    默认的控制器支持视频的开始、暂停、进度调整、全屏显示四项基本功能。
    
    ```TypeScript
    // xxx.ets
    @Entry
    @Component
    struct VideoGuide {
      @State videoSrc: Resource = $rawfile('videoTest.mp4');
      @State previewUri: string = 'common/videoIcon.png';
      @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X;
      build() {
        Row() {
          Column() {
            Video({
              src: this.videoSrc,
              previewUri: this.previewUri,
              currentProgressRate: this.curRate // 设置视频播放倍速
            })
          }
          .width('100%')
        }
        .height('100%')
      }
    }
    ```
    
    [VideoControl.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/VideoPlayer/entry/src/main/ets/pages/VideoControl.ets#L16-L39)
    
-   自定义控制器
    
    使用自定义的控制器，先关闭默认控制器，然后使用[Button](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-button)以及[Slider](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-slider)等组件进行自定义的控制与显示，适合自定义较强的场景下使用。
    
    ```TypeScript
    // xxx.ets
    @Entry
    @Component
    struct CustomizedControl {
      @State videoSrc: Resource = $rawfile('videoTest.mp4');
      @State previewUri: string = 'common/videoIcon.png';
      @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X;
      // 初始化当前时间为0
      @State currentTime: number = 0;
      // 初始化持续时间为0
      @State durationTime: number = 0;
      controller: VideoController = new VideoController();
      build() {
        Row() {
          Column() {
            Video({
              src: this.videoSrc,
              previewUri: this.previewUri,
              currentProgressRate: this.curRate,
              controller: this.controller
            })
              .controls(false)
              .autoPlay(true)
              .onPrepared((event) => {
                if (event) {
                  this.durationTime = event.duration
                }
              })
              .onUpdate((event) => {
                if (event) {
                  this.currentTime = event.time
                }
              })
            Row() {
              Text(JSON.stringify(this.currentTime) + 's')
              Slider({
                value: this.currentTime,
                min: 0,
                max: this.durationTime
              })
                .onChange((value: number, mode: SliderChangeMode) => {
                  this.controller.setCurrentTime(value); // 设置视频播放的进度跳转到value处
                })
                .width('90%')
              Text(JSON.stringify(this.durationTime) + 's')
            }
            .opacity(0.8)
            .width('100%')
          }
          .width('100%')
        }
        .height('40%')
      }
    }
    ```
    
    [CustomizedControl.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/VideoPlayer/entry/src/main/ets/pages/CustomizedControl.ets#L16-L72)
    

## 其他说明

Video组件已经封装好了视频播放的基础能力，开发者无需进行视频实例的创建，视频信息的设置获取，只需要设置数据源以及基础信息即可播放视频，相对扩展能力较弱。如果开发者想自定义视频播放，请参考[视频播放](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/video-playback)。

## 示例代码

-   [媒体库视频](https://gitcode.com/harmonyos_samples/video-show)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-video-player*