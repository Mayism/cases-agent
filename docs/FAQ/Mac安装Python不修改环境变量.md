---
title: Mac安装Python不修改环境变量
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-test-11
category: FAQ
updated_at: 2026-03-13T06:03:19.648Z
---

# Mac安装Python不修改环境变量

1\. 下载官方Python Mac系统安装包，推荐使用 [3.11.7](https://mirrors.huaweicloud.com/python/3.11.7/python-3.11.7-macos11.pkg)。

2\. Mac版本自定义安装可以不修改环境变量，请查看文档：[在 macOS 上使用 Python](https://docs.python.org/zh-cn/3/using/mac.html)不勾选UNIX command-line tools和shell profile updater。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ef/v3/mxsiV8D_T66qvW8FzNf9cA/zh-cn_image_0000002498271829.png?HW-CC-KV=V1&HW-CC-Date=20260313T060314Z&HW-CC-Expire=86400&HW-CC-Sign=7DC270D6D3C453AF54C183C6038F5D2BC183F5E208B03D60F8C58AAE21BFE7AE)

3\. 关闭DevEco Studio修改other.xml配置 。

```bash
cd ~/Library/Application\ Support/Huawei/DevEcoStudio6.0/options
```

```undefined
vi other.xml
```

输入： /python，定位到location.python.path这一行, 修改后面的python路径为/Library/Frameworks/Python.framework/Versions/3.11/bin

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/fd/v3/Tw0hsbzVRqOUl8gMLWelCQ/zh-cn_image_0000002465312430.png?HW-CC-KV=V1&HW-CC-Date=20260313T060314Z&HW-CC-Expire=86400&HW-CC-Sign=B05CFF0BDD19F7291A658B62F56C6EB523AE82BFC4C815FD3448AF09E4184FF7)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-test-11*