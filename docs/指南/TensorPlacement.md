---
title: TensorPlacement
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensorplacement
category: 指南
updated_at: 2026-03-13T02:41:55.228Z
---

# TensorPlacement

```cpp
enum TensorPlacement {
    kOnDeviceHbm,  // < Tensor位于Device上的HBM内存
    kOnHost,       // < Tensor位于Host
    kFollowing,    // < Tensor位于Host，且数据紧跟在结构体后面
    kOnDeviceP2p,  // < Tensor位于Device上的P2p内存, 指的是HBM透到PCIE BAR空间上,可以让NPU跨PCIE能访问的地址空间
    kTensorPlacementEnd
};
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensorplacement*