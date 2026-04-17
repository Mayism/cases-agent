---
title: Intents Kit接入流程
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/intents-access-flow
category: 指南
updated_at: 2026-03-13T03:22:12.057Z
---

# Intents Kit接入流程

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1d/v3/nyGMZRIMQ3GBdT9XFX6MvQ/zh-cn_image_0000002402161841.png?HW-CC-KV=V1&HW-CC-Date=20260313T032131Z&HW-CC-Expire=86400&HW-CC-Sign=0D98896CB5F966E872F33E66059E11EFD390BDEBECDD9D66BBFA3B8BAA510D8B "点击放大")

| 阶段 | 任务 | 任务描述 | 示例 | 指导文档 |
| --- | --- | --- | --- | --- |
| 意向 | 选择特性确定意图 | 开发者在已发布的特性列表中根据想达成的用户体验选择特性，根据特性来确定需实现的意图。 | 开发者想实现“歌曲续听推荐”的特性，则根据智慧分发特性描述，需要实现“播放歌曲”意图。 | [歌曲续听推荐](https://developer.huawei.com/consumer/cn/doc/service/intents-ai-distribution-characteristic-0000001901922213) |
| 开发 | 调试白名单申请 | 确定开发意向后，开发者发送邮件到邮箱（hagservice@huawei.com）或者联系华为意图框架接口同事，向华为提供测试应用的信息，用于申请调试白名单。 | 应用名称：华为音乐。应用包名：com.xxxx。接入意图名称：“播放歌曲”。应用图标：jpg、png……。APP ID：1234567。Client ID：1234567。华为账号（UID）：1234567、7654321……。 | [开发者测试](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/intents-habit-rec-dp-self-validation) |
| 意图声明文件中注册意图 | 在DevEco Studio中开发时，注册对应的意图。 | 注册“播放歌曲”意图。 | [意图注册](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/intents-habit-rec-access-programme#section12621163216260) |
| 开发实现意图调用/意图共享 | 开发应用/元服务的意图共享接口，使其可以通过HarmonyOS接口完成意图数据共享。 | 开发“播放歌曲”意图中的意图共享接口。 | [端侧意图共享](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/intents-habit-rec-access-programme#section14210125472916) |
| 开发应用/元服务的意图调用接口，使其可以通过HarmonyOS接口被正确调用。 | 开发“播放歌曲”意图中的意图调用接口。 | [端侧意图调用](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/intents-habit-rec-access-programme#section9408948143016) |
| 验证 | 端到端验证特性 | 使用华为侧提供的测试能力完成目标特性的端到端联调测试，联调测试完成后，提交智慧分发配置至审核。 | 在设备上对应入口进行“华为音乐-歌曲续听推荐”的特性端到端测试，测试完成后点击提交智慧分发配置。 | / |
| 上架 | 应用市场上架软件包（应用/元服务） | 开发完成并打包好软件包后，在应用市场上传软件包。 | 打包“华为音乐”软件包并通过应用市场上架。 | [应用市场上架流程](https://developer.huawei.com/consumer/cn/doc/app/agc-help-release-0000002235870050) |
| 意图框架注册 | 在小艺开放平台进行意图注册配置并提交审核。由华为工程师审核，一般情况在3个工作日内完成。 | 注册“播放歌曲”意图。 | [意图标准协议上架指导](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/intents-kit-listing-standard-protocol) |

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/intents-access-flow*