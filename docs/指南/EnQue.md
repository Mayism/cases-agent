---
title: EnQue
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-enque
category: 指南
updated_at: 2026-03-13T01:53:19.741Z
---

# EnQue

## 功能说明

将Tensor push到队列。

## 函数原型

```cpp
template <typename T>
__aicore__ inline bool EnQue(const LocalTensor<T>& tensor)
```

## 参数说明

**表1** bool EnQue(LocalTensor<T>& tensor)原型定义参数说明

| 参数名称 | 输入/输出 | 含义 |
| --- | --- | --- |
| tensor | 输入 | 指定的Tensor。 |

**图1** 将LocalTensor通过EnQue放入A1/B1的Queue中  
![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7c/v3/zUO_QxNJTeawVfDqAsZd9g/zh-cn_image_0000002528649027.png?HW-CC-KV=V1&HW-CC-Date=20260313T015235Z&HW-CC-Expire=86400&HW-CC-Sign=49D6F68D762DDC5AE3D47F974F976BCA320887401AEA965BB1A81562B7FBC8E4)

## 支持的型号

Kirin9020系列处理器

KirinX90系列处理器

## 注意事项

无

## 返回值

-   true：表示Tensor加入Queue成功。
-   false：表示Queue已满，入队失败。

## 调用示例

```cpp
// 接口: EnQue Tensor
AscendC::TPipe pipe;
AscendC::TQueBind<AscendC::TPosition::VECOUT, AscendC::TPosition::GM, 4> que;
int num = 4;
int len = 1024;
pipe.InitBuffer(que, num, len);
AscendC::LocalTensor<half> tensor1 = que.AllocTensor<half>();
que.EnQue(tensor1);// 将tensor加入VECOUT的Queue中
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-enque*