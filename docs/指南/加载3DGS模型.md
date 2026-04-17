---
title: 加载3DGS模型
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/spatial-recon-load
category: 指南
updated_at: 2026-03-12T19:52:47.353Z
---

# 加载3DGS模型

## 适用场景

支持的3DGS模块格式包括：MP4、PLY、GLB三种格式。

效果如下图所示：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/63/v3/0HtWSM3uQ6WrahL-oHZ57g/zh-cn_image_0000002485417565.png?HW-CC-KV=V1&HW-CC-Date=20260312T195137Z&HW-CC-Expire=86400&HW-CC-Sign=94391928E6E58345E635076FD3B904DD2BAA59EA8004D8432729DD670A258830 "点击放大")

## 接口说明

以下仅列出demo中调用的部分主要接口，具体API说明详见[API参考](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/spatial-recon-arkts)。

| 接口名 | 描述 |
| --- | --- |
| [Scene](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-inner-scene) | 加载3DGS模型。 |

## 开发步骤

1.  从entry目录进入/src/main/ets/entryability/EntryAbility.ets文件，导入空间建模模块。
    
    ```typescript
    import { spatialRender } from '@kit.SpatialReconKit';
    import { Scene, RenderContext } from '@kit.ArkGraphics3D'
    ```
    
2.  加载当前场景的上下文。
    
    ```typescript
    let renderContext: RenderContext | null = Scene.getDefaultRenderContext();
    ```
    
3.  调用加载3DGS模型接口。
    
    ```cangjie
    if (renderContext != null) {
      renderContext.loadPlugin(spatialRender.GSPlugin.PLUGIN_ID);
      let scene = Scene.load().then(async (scene: Scene) => {
        let uri = "OhosRawFile://assets/gltf/model.glb"; //3DGS模型的uri，根据实际情况修改
        let offset = 0;
        let gsNodeext: spatialRender.GSNode = await spatialRender.GSPlugin.loadGSNode(scene, {uri, offset}, scene.root);
      });
    }
    ```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/spatial-recon-load*