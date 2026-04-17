---
title: 编译报错“Module 'xxx' has no exported member 'yyy'”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-6
category: FAQ
updated_at: 2026-03-13T05:30:36.418Z
---

# 编译报错“Module 'xxx' has no exported member 'yyy'”

**问题现象**

Stage模板工程编译构建失败，提示 “Module 'xxx' has no exported member 'yyy'” 并且“yyy”符号是由export \* from 'x.js'语法从js文件中导出。

**解决措施**

由于当前Stage工程编译构建期的语法校验工具对js文件不作检查，导致无法正确识别通过export \* from 'x.js'导出的符号，因此在引用这些符号时会提示“Module 'xxx' has no exported member 'yyy'”的错误信息。

如果遇到类似问题，尝试以下解决方法：

-   方法1（推荐使用）： 使用符号显式导出语法，从js文件中re-export符号 。
    
    export { yyy } from 'x.js'
    

-   方法2：新增x.js对应的声明文件（.d.ts），并在引用时不指定后缀。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9f/v3/dk1aEg91QGmTJXYGa9j8Hw/zh-cn_image_0000002229758485.png?HW-CC-KV=V1&HW-CC-Date=20260313T053031Z&HW-CC-Expire=86400&HW-CC-Sign=78B54032FD709084307D700CF28FA128219F304A9AC3C09EA06E9B36EE865A2A)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-6*