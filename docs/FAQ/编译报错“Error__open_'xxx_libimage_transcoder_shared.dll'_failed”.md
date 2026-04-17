---
title: 编译报错“Error: open 'xxx\libimage_transcoder_shared.dll' failed”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-181
category: FAQ
updated_at: 2026-03-13T05:46:56.990Z
---

# 编译报错“Error: open 'xxx\libimage_transcoder_shared.dll' failed”

**问题现象**

Windows下编译工程出现错误，提示“Error: open 'xxx\\deveco-studio\\sdk\\default\\hms\\toolchains\\lib\\libimage\_transcoder\_shared.dll' failed”，加载dll失败。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bd/v3/w7ElC3CAQJWmaao8deXt4g/zh-cn_image_0000002194158948.png?HW-CC-KV=V1&HW-CC-Date=20260313T054652Z&HW-CC-Expire=86400&HW-CC-Sign=846E221B1771F30813BB8BD8C3B754909863ED8656C6CC04A3CAA0198CEF8FD7)

**可能原因**

1、系统在环境变量中找不到libimage\_transcoder\_shared.dll及其依赖的第三方库路径。

2、用户环境变量或系统环境变量中的某些路径包含权限受限或损坏的文件，这些文件无法被正常访问。如果这些路径在环境变量中的顺序排在libimage\_transcoder\_shared.dll之前，系统在加载 DLL 时会按顺序搜索环境变量，并首先访问这些出错的文件。

例如，用户环境变量中包含%USERPROFILE%\\AppData\\Local\\Microsoft\\WindowsApps。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/35/v3/BDqFyCB-SpuAwWZW1VpzmA/zh-cn_image_0000002229758829.png?HW-CC-KV=V1&HW-CC-Date=20260313T054652Z&HW-CC-Expire=86400&HW-CC-Sign=610B471AFE1C25C97E35713BD1D3271B14084345FA0D383EEEF89BF66925F96F)

该路径的文件无法访问。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c0/v3/23trCXXKRmSiSna6E0a9Rg/zh-cn_image_0000002194158944.png?HW-CC-KV=V1&HW-CC-Date=20260313T054652Z&HW-CC-Expire=86400&HW-CC-Sign=21EF934C3574F38CD9C4319B87BB306DAE5887541457D4E3BAAE7B1DD50731DF)

**解决措施**

1、将报错的路径xxx\\deveco-studio\\sdk\\default\\hms\\toolchains\\lib和xxx\\deveco-studio\\sdk\\default\\openharmony\\previewer\\common\\bin手动添加到系统环境变量的最前面。

2、检查用户环境变量和系统环境变量中的所有路径，确保这些路径下的文件均可访问。可以通过尝试修改文件（如覆盖、压缩等）来观察是否有报错。将无法访问的路径从环境变量中删除。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-181*