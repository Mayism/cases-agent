---
title: SharedArrayBuffer对象
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/shared-arraybuffer-object
category: 指南
updated_at: 2026-03-12T06:56:51.756Z
---

# SharedArrayBuffer对象

SharedArrayBuffer内部包含一块Native内存，其JS对象壳被分配在虚拟机本地堆（LocalHeap）。支持跨并发实例间共享Native内存，但是对共享Native内存的访问及修改需要采用Atomics类，防止数据竞争。SharedArrayBuffer可用于多个并发实例间的状态或数据共享。通信过程如下图所示：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ce/v3/-PMKrtzsQjKWJIHsGO1ujA/zh-cn_image_0000002527044752.png?HW-CC-KV=V1&HW-CC-Date=20260312T065623Z&HW-CC-Expire=86400&HW-CC-Sign=765E1F8ACC0230AEF31E96DC88B9091F56B4F80F988088DDE12854F1F05C5BF9)

## 使用示例

使用TaskPool传递Int32Array对象，实现如下：

```typescript
import { taskpool } from '@kit.ArkTS';
@Concurrent
function transferAtomics(arg1: Int32Array) {
  console.info("wait begin::");
  // 使用Atomics进行操作
  let res = Atomics.wait(arg1, 0, 0, 3000);
  return res;
}
// 定义可共享对象
let sab: SharedArrayBuffer = new SharedArrayBuffer(20);
let int32 = new Int32Array(sab);
let task: taskpool.Task = new taskpool.Task(transferAtomics, int32);
taskpool.execute(task).then((res) => {
  console.info("this res is: " + res);
});
setTimeout(() => {
  Atomics.notify(int32, 0, 1);
}, 1000);
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/shared-arraybuffer-object*