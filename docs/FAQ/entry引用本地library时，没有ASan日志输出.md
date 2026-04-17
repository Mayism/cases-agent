---
title: entry引用本地library时，没有ASan日志输出
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-18
category: FAQ
updated_at: 2026-03-13T05:57:00.947Z
---

# entry引用本地library时，没有ASan日志输出

**问题现象**

entry引用本地library时，已经勾选ASan选择项，没有ASan日志输出。

**解决措施**

引用本地C++ library时，需在library模块的build-profile.json5文件中，配置arguments字段值为“-DOHOS\_ENABLE\_ASAN=ON”，表示以ASan模式编译so文件。

```json
{
  // ...
      "arguments": "-DOHOS_ENABLE_ASAN=ON",
      // ...
    }
  },
  // ...
}
```

[build-profile.json5](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/Ndk/ndk1/Modulea/build-profile.json5#L3-L47)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/44/v3/q0k4g0yeTB2E-S-OSMB1LA/zh-cn_image_0000002194318360.png?HW-CC-KV=V1&HW-CC-Date=20260313T055655Z&HW-CC-Expire=86400&HW-CC-Sign=74E3D1B92D545FB57F1A67B5620993F619E89A578B8E68ADB97A727A92C1901B)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-18*