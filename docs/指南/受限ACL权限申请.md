---
title: 受限ACL权限申请
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/screentimeguard-permission-application
category: 指南
updated_at: 2026-03-13T01:05:56.964Z
---

# 受限ACL权限申请

1\. 在 [申请调试Profile](https://developer.huawei.com/consumer/cn/doc/app/agc-help-debug-profile-0000002248181278)和[发布Profile文件](https://developer.huawei.com/consumer/cn/doc/app/agc-help-release-profile-0000002248341090)之前，需要申请相应的ACL权限。

2\. 登录[AppGallery Connect](https://developer.huawei.com/consumer/cn/service/josp/agc/index.html#/)，点击“开发与服务”，在项目列表中找到相应的项目，并点击选择您需要申请ACL权限的应用。在“项目设置”页面，选择“ACL权限”页签，开始为应用申请ACL权限。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5e/v3/IKXKnns-QDilYrYERDfWpA/zh-cn_image_0000002504425167.png?HW-CC-KV=V1&HW-CC-Date=20260313T010516Z&HW-CC-Expire=86400&HW-CC-Sign=5D6266D8A705247E8370C4B63AC56EF65F4C0B70E5E36ABEC0F2FF106F9CB245 "点击放大")

3\. 在核对注意事项后，在“未获取权限”区域中勾选“我已知晓”。在权限搜索框中输入"ohos.permission.MANAGE\_SCREEN\_TIME\_GUARD"，查找并勾选权限，提交申请。

4\. 根据实际业务需求填写申请原因并提交，提交后将在1个工作日回复。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f9/v3/3tmREHBjTVeXFdSySu1aTQ/zh-cn_image_0000002471625316.png?HW-CC-KV=V1&HW-CC-Date=20260313T010516Z&HW-CC-Expire=86400&HW-CC-Sign=D36D2C62C030533EB3BA8EF6F1974F71CECEDAAA781935C1083D55CF83B093C1)

5\. 权限申请通过后，在申请profile文件时，在“申请权限”栏选中“受限ACL权限（HarmonyOS API9及以上）”选项，点击“选择”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/57/v3/gm4v9D8lTw6Dtj5XdOZDVg/zh-cn_image_0000002504425161.png?HW-CC-KV=V1&HW-CC-Date=20260313T010516Z&HW-CC-Expire=86400&HW-CC-Sign=48EF8ECAFD62538E30D9EEC045819C97DE9BFA0B98D65E7495EFCC823B61BF0F)

6\. 在弹出的“选择受限ACL权限”窗口可以看到已申请的权限，勾选后点击确定。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/63/v3/213f5_tnTjK1GRKTiN9gWA/zh-cn_image_0000002504465237.png?HW-CC-KV=V1&HW-CC-Date=20260313T010516Z&HW-CC-Expire=86400&HW-CC-Sign=7B669DA23EC952C317A860045FD7E66787CC5D9871D3BF415C6E8FA95F4C19DF "点击放大")

7\. 选择权限后点击“添加”生成新的Profile文件，下载后按[手动配置签名信息](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section297715173233)替换profile文件。

8\. 在工程中entry模块的module.json5文件中添加"ohos.permission.MANAGE\_SCREEN\_TIME\_GUARD"权限，如下所示：

```typescript
"requestPermissions": [{
  "name": "ohos.permission.MANAGE_SCREEN_TIME_GUARD"
}]
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/screentimeguard-permission-application*