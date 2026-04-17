---
title: AutoMappingByOpFnDynamic
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-automappingbyopfndynamic
category: 指南
updated_at: 2026-03-13T03:00:39.504Z
---

# AutoMappingByOpFnDynamic

## 函数功能

动态输入/输出算子的自动映射回调函数。

## 函数原型

```cpp
Status AutoMappingByOpFnDynamic(const ge::Operator &op_src, ge::Operator &op, const std::vector<DynamicInputOutputInfo> &dynamic_name_attr_value)
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| op_src | 输入 | [Operator](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-operator-construction-and-destructor) |
| op | 输入 | [Operator](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-operator-construction-and-destructor) |
| dynamic_name_attr_value | 输入 | [DynamicInputOutputInfo数据结构说明](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-automappingbyopfndynamic#zh-cn_topic_0000002119256305_section103745mcpsimp) |

## DynamicInputOutputInfo数据结构说明

```cpp
constexpr int64_t kMaxNameLength = 1048576; // 1M
enum DynamicType : int16_t {
  kInvalid = 0,
  kInput = 1,
  kOutput = 2
};
struct DynamicInputOutputInfo {
  DynamicType type; // input/output
  const char_t *port_name;
  int64_t port_name_len;
  const char_t *attr_name;
  int64_t attr_name_len;
  DynamicInputOutputInfo(const DynamicType type_instance, const char_t *const port_name_instance,
                         const int64_t port_name_len_instance, const char_t *const attr_name_instance,
                         const int64_t attr_name_len_instance)
      : type(type_instance), port_name(port_name_instance), port_name_len(port_name_len_instance),
        attr_name(attr_name_instance), attr_name_len(attr_name_len_instance) {}
  DynamicInputOutputInfo() : DynamicInputOutputInfo(kInvalid, nullptr, 0L, nullptr, 0L) {}
};
```

| 参数 | 说明 |
| --- | --- |
| type | 指定是动态输入或输出。0：无效值1：输入2：输出 |
| port_name | 端口名字，输入或者输出的Name。 |
| port_name_len | 端口名字长度，最大长度为kMaxNameLength。 |
| attr_name | 属性名字。 |
| attr_name_len | 属性名字长度，最大长度为kMaxNameLength。 |

## 调用示例

```cpp
Status QueueDequeueUpToMapping(const  ge::Operator& op_src, ge::Operator& op) {
vector<DynamicInputOutputInfo> dynamic_name_attr_value;
string port_name = "components";
string attr_name = "component_types";
DynamicInputOutputInfo name_attr(kOutput, port_name.c_str(), port_name.size(), attr_name.c_str(), attr_name.size());
dynamic_name_attr_value.push_back(name_attr);
AutoMappingByOpFnDynamic(op_src, op, dynamic_name_attr_value);
return SUCCESS;
}
REGISTER_CUSTOM_OP("QueueDequeueUpTo")
.FrameworkType(TENSORFLOW)
.OriginOpType("QueueDequeueUpToV2")
.ParseParamsByOperatorFn(QueueDequeueUpToMapping)
.ImplyType(ImplyType::AI_CPU);
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-automappingbyopfndynamic*