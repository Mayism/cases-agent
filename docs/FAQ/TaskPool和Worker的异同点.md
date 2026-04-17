---
title: TaskPool和Worker的异同点
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-27
category: FAQ
updated_at: 2026-03-13T03:11:24.660Z
---

# TaskPool和Worker的异同点

-   不同点：Worker 和 Task 是不同颗粒度的并发 API。Worker 类似于 Thread 或 Service 维度，而 Task 则是单一任务维度。TaskPool 简化了并发程序的开发，支持优先级和任务取消，并通过统一管理节省系统资源，优化调度。
-   相同点：JS相关的线程间交互都基于内存隔离模型，参数与范围值的限制相同，并且都存在开销。

**参考链接**

[TaskPool和Worker的对比 (TaskPool和Worker)](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/taskpool-vs-worker)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-27*