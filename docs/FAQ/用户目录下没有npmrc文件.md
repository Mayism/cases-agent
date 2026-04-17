---
title: 用户目录下没有npmrc文件
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-121
category: FAQ
updated_at: 2026-03-13T05:41:30.105Z
---

# 用户目录下没有npmrc文件

**问题现象**

新建项目时出现错误：Error: The hvigor depends on the npmrc file. Configure the npmrc file first. 请先配置npmrc文件。

**问题原因**

用户目录下不存在 .npmrc 文件。

**解决措施**

在用户目录下创建.npmrc文件，配置以下信息：

```ruby
registry=https://repo.huaweicloud.com/repository/npm/
@ohos:registry=https://repo.harmonyos.com/npm/
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-121*