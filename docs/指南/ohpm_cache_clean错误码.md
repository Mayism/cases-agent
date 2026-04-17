---
title: ohpm cache clean错误码
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-cache-errorcode
category: 指南
updated_at: 2026-03-13T05:24:24.864Z
---

# ohpm cache clean错误码

## 00601001 缓存子命令为空

**错误信息**

Cache Subcommand Is Empty.

**错误描述**

缓存子命令为空。

**可能原因**

缓存子命令缺失或子命令不正确。

**处理步骤**

检查输入的子命令格式，确保输入正确的缓存子命令 ohpm cache clean。

## 00601002 缓存子命令不支持

**错误信息**

Cache Subcommand Not Support.

**错误描述**

不支持缓存子命令。

**可能原因**

输入的命令不支持配置Cache子命令。

**处理步骤**

确认可配置Cache子命令的命令列表（如 clean 或 -h）。

## 00601003 缓存包无效

**错误信息**

Invalid Cache Package.

**错误描述**

缓存包无效。

**可能原因**

因缺少依赖等，导致缓存包不完整/无效。

**处理步骤**

1.  执行ohpm cache clean清理缓存，然后执行ohpm install安装依赖。
2.  检查ohpmrc文件中registry配置是否正确。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-cache-errorcode*