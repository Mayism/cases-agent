---
title: DeQue
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-deque
category: 指南
updated_at: 2026-03-13T01:53:19.358Z
---

# DeQue

## 功能说明

将Tensor从队列中取出，用于后续处理。

## 函数原型

```cpp
template <typename T>
__aicore__ inline LocalTensor<T> DeQue()
```

**图1** 将LocalTensor通过EnQue放入A1/B1的Queue中后再通过DeQue搬出  
![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/be/v3/glUD1ic9R02tozxaHqfGcA/zh-cn_image_0000002496888988.png?HW-CC-KV=V1&HW-CC-Date=20260313T015236Z&HW-CC-Expire=86400&HW-CC-Sign=5B23B5B1ED365C96A80F2064B2FBC4B6E45114DAB935283E622E195F57A7195D "点击放大")

## 参数说明

无

## 支持的型号

Kirin9020系列处理器

KirinX90系列处理器

## 注意事项

无

## 返回值

从队列中取出的[LocalTensor](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-localtensor)。

## 调用示例

```cpp
// 接口: DeQue Tensor
AscendC::TPipe pipe;
AscendC::TQueBind<AscendC::TPosition::VECOUT, AscendC::TPosition::GM, 4> que;
int num = 4;
int len = 1024;
pipe.InitBuffer(que, num, len);
AscendC::LocalTensor<half> tensor1 = que.AllocTensor<half>();
que.EnQue(tensor1);
AscendC::LocalTensor<half> tensor2 = que.DeQue<half>(); // 将tensor从VECOUT的Queue中搬出
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-deque*