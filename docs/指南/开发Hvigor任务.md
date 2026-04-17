---
title: 开发Hvigor任务
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-task
category: 指南
updated_at: 2026-03-13T05:11:19.509Z
---

# 开发Hvigor任务

## 了解任务

任务是Hvigor构建过程中的基本执行单元，通常包含一段可执行代码；一个任务可以依赖其他多个任务。Hvigor任务调度执行时通过解析依赖关系确定任务执行时序。

UP-TO-DATE

任务标识，表示任务未实际执行。Hvigor任务增量跳过机制，在二次执行任务时检测任务输入输出条件未发生变化，则任务跳过执行提高构建效率。

示例：

```vbnet
> hvigor UP-TO-DATE ::PackageApp...
```

Finished

任务执行完成标识，表示任务已执行完成。

示例：

```cangjie
> hvigor Finished ::PackageApp... after 310 ms
```

## 注册任务

使用HvigorNode节点对象注册任务。

1.  编辑工程下hvigorfile.ts文件。
    
    ```javascript
    // 导入模块
    import { getNode, HvigorNode, HvigorTask } from '@ohos/hvigor';
    ```
    
2.  编写任务代码。
    
    ```javascript
    // 获取当前hvigorNode节点对象
    const node: HvigorNode = getNode(__filename);
    // 注册Task
    node.registerTask({
      name: 'customTask',
      run() {
        console.log('this is Task');
      }
    });
    ```
    
3.  执行任务。
    
    使用hvigor命令行工具执行任务：
    
    ```undefined
    hvigorw customTask
    ```
    
4.  查看任务执行结果。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0/v3/MNwSSqYiRAybg0KVQkFNjQ/zh-cn_image_0000002501070050.png?HW-CC-KV=V1&HW-CC-Date=20260313T051039Z&HW-CC-Expire=86400&HW-CC-Sign=AF2D1566D2312104448E3E71C62354D75FA8E53ADF7AC951CD2066E07453FE3F "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-task*