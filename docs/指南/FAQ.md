---
title: FAQ
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/agc-harmonyos-clouddev-faq
category: 指南
updated_at: 2026-03-13T04:06:43.031Z
---

# FAQ

## 使用DevEco Studio打开端云一体化项目文件夹，左侧的项目列表不显示云侧工程

**问题现象**

开发者使用DevEco Studio打开端云一体化项目文件夹，左侧的项目列表不显示云侧工程“CloudProgram”。

**解决措施**

端云一体化工程根目录下只允许有“Application”与“CloudProgram”文件夹，不能有其他文件。否则，DevEco Studio会把该工程当成纯端侧工程，不显示云侧工程“CloudProgram”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9e/v3/afcs35zGREWGK_V1NIg6SQ/zh-cn_image_0000002313987669.png?HW-CC-KV=V1&HW-CC-Date=20260313T040602Z&HW-CC-Expire=86400&HW-CC-Sign=FEC456196FE1617416134E6E82DA283FD85991F531DF80721DD3755338BBD1EE)

## 部署云数据库时，提示“clouddb deploy failed. Reason is the number of CloudDBZone exceeds the limit.”

**问题现象**

部署云数据库失败，提示“clouddb deploy failed. Reason is the number of CloudDBZone exceeds the limit.”

**解决措施**

出现此错误，表示AGC云端的存储区数量超过最大限制。

部署到AGC云端的存储区数量不得超过4个，否则会导致部署失败。如AGC云端当前已存在4个存储区，请将数据部署到已有的存储区，或者删除已有存储区后再部署新的存储区。

**需要注意的是，删除存储区，该存储区内的数据也将一并删除，且不可恢复。**

## 部署云数据库时，提示“clouddb deploy failed. Reason is existing fields cannot be modified.”

**问题现象**

部署云数据库失败，提示“clouddb deploy failed. Reason is existing fields cannot be modified.”

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7a/v3/0olsbOIZRhCZa_7f-nSSvQ/zh-cn_image_0000002179338656.png?HW-CC-KV=V1&HW-CC-Date=20260313T040602Z&HW-CC-Expire=86400&HW-CC-Sign=6BF307C7711F4652D855D783A23921E3D250585F4F0F3D6ED506BCE9BC3C575B)

**解决措施**

出现此错误，可能是您在本地对象类型内做了与云端不兼容的修改。

对象类型中的fieldType等字段信息，部署到AGC云端后，请勿在本地再做修改。例如，fieldType设置为String，对象类型部署成功后，又在本地修改fieldType为Integer，再次部署将失败，提示“clouddb deploy failed. Reason is existing fields cannot be modified.”错误。如需更改fieldType等字段信息，请先删除云端部署的对象类型。

**需要注意的是，删除云端对象类型，对象类型内添加的数据也将一并删除，且不可恢复。**

## 体验端云一体化模板APP功能时，云存储上传图片失败，Hilog中打印“on response {"version":"HTTP/1.1","statusCode":403,"reason":"Forbidden","headers":{}}”

**问题现象**

体验端云一体化模板APP功能时，云存储上传图片失败，Hilog中打印“on response {"version":"HTTP/1.1","statusCode":403,"reason":"Forbidden","headers":{}}”。

**解决措施**

出现此错误，原因是访问权限不足，可采用以下任一方法解决：

-   [将云存储的安全策略配置为始终可读写](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/agc-harmonyos-clouddev-emptyability#li1693311281068)
-   参考[AuthProvider](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/cloudfoundation-cloudcommon#section136610231214)获取用户凭据

## 体验端云一体化模板APP功能时，云数据库界面不展示数据，Hilog中打印“schemaJson\_ is empty”

**问题现象**

体验端云一体化模板APP功能时，云数据库界面不展示数据，Hilog中打印“schemaJson\_ is empty”。

**解决措施**

请检查resources/rawfile目录下是否存在schema文件。schema文件是云数据库功能依赖的必要文件，部署云数据库成功时会自动产生。如schema文件不存在，请重新部署云数据库，或[从AGC控制台导出](https://developer.huawei.com/consumer/cn/doc/AppGallery-connect-Guides/agc-clouddb-agcconsole-objecttypes-0000001127675459#section1558018208151)。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/24/v3/htJp01xDRQ-lcQBGI19Xzg/zh-cn_image_0000002179338664.png?HW-CC-KV=V1&HW-CC-Date=20260313T040602Z&HW-CC-Expire=86400&HW-CC-Sign=04279CE428C73CA9CC5373B3EDE42AC3DF62DB276E5C3C1888BB707F7ACA16E0)

## 云数据库无法新建数据条目，Hilog中打印“2001015:permission denied”

**问题现象**

云数据库无法新建数据条目，Hilog中打印“2001015:permission denied”。

**解决措施**

出现此错误，是因为APP操作者的角色权限不足，请检查[操作的对象类型的权限配置](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/agc-harmonyos-clouddev-objecttype#li01856582915)。

## 云函数调用失败，error message包含“404:160404:Trigger not exist”

**问题现象**

云函数调用失败，error message包含“404:160404:Trigger not exist”。

**解决措施**

出现此错误，是因为云函数未部署。error message中的404是服务端返回的HTTP状态码，表示找不到对应的函数。

## 云函数调用失败，error message包含“hmos auth app doesn't have permission”

**问题现象**

云函数调用失败，error message包含“hmos auth app doesn't have permission”。

**解决措施**

出现此错误，是因为选择的签名方式有误。推荐您使用[关联注册应用进行签名](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section20943184413328)方式，或者使用[手动签名](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section297715173233)。

## 云函数部署失败，提示“The function type cannot be changed”

**问题现象**

云函数部署失败，错误信息中提示“The function type cannot be changed”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/55/v3/6HcUv7X_RHqN5a1mJKwkng/zh-cn_image_0000002214858977.png?HW-CC-KV=V1&HW-CC-Date=20260313T040602Z&HW-CC-Expire=86400&HW-CC-Sign=990C418DB0137D56951C886EB15B95B2AE727D59A6F2842F835A73A663326B84)

**解决措施**

出现此错误，是因为云函数分为传统云函数类型和云对象类型。一种类型的云函数在部署到AGC云端后，不允许再变更成另一种类型。您可以前往AGC控制台的云函数服务页面，手动删除之前已部署的同名云函数/云对象，然后重新在DevEco Studio执行部署操作。

## 部署云工程失败，提示“Remote host terminated the handshake”

**问题现象**

部署云工程失败，错误信息中提示“Remote host terminated the handshake”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/76/v3/VcQN8G1KRKS7RF14MsESlg/zh-cn_image_0000002279650126.png?HW-CC-KV=V1&HW-CC-Date=20260313T040602Z&HW-CC-Expire=86400&HW-CC-Sign=2F6F5D96BDF59D44CB8CDA4A84EF89871774DF0CA79DA5296CB4B6F1F1CBDE2F)

**解决措施**

出现此错误，是因为网络连接SSL/TLS握手失败。建议检查[DevEco Studio Proxy代理配置](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-environment-config#section10369436568)或本地网络防火墙/安全配置。

## 在云函数中调用云函数失败，提示“mismatched authType”

**问题现象**

在云函数中调用云函数失败，错误信息中提示“mismatched authType”。

**解决措施**

出现此错误，是因为被调用的云函数的HTTP触发器的认证类型须配置为云侧网关认证，即“authType”字段须配置为“cloudgw-client”。修改被调用云函数的“function-config.json”文件中的“authType”字段值，然后重新部署被调用的云函数即可。

## 端云一体化开发工程同步失败，失败步骤为npm install failed

**问题现象**

端云一体化开发工程同步失败，失败步骤是npm install failed。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e8/v3/XM2Lb4MaTJug0ckF1LgQYQ/zh-cn_image_0000002279546734.png?HW-CC-KV=V1&HW-CC-Date=20260313T040602Z&HW-CC-Expire=86400&HW-CC-Sign=6CE589934736B411BCAA4BED8134779CC6A763AAD5F8922AB7217AD2B9AD331D)

**解决措施**

出现此错误，是因为端云一体化开发的云侧工程是通过npm管理依赖，同步时需要通过npm去下载对应依赖。请参考[配置NPM代理](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-environment-config#section197296441787)检查npm代理和网络情况。

## 使用云存储上传文件失败，提示“404:Product does not exist”

**问题现象**

使用云存储上传文件失败，HiLog提示“404:Product does not exist”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7b/v3/83nfkjlOQhWXJxOTDn9ypA/zh-cn_image_0000002214704601.png?HW-CC-KV=V1&HW-CC-Date=20260313T040602Z&HW-CC-Expire=86400&HW-CC-Sign=BF129694315CAD4B1EBF1F01CA7D05D7072B406085464736566620B59EB64DC0)

**解决措施**

云存储服务端返回的错误，出现此错误是因为云存储服务未开通。请在顶部菜单栏选择“Tools > CloudDev”，进入CloudDev云开发管理面板，点击“Cloud Storage”服务下的“Go to console”快捷进入AGC服务菜单进行手动开通。

## 使用云存储上传文件失败，app日志提示“"state":65”，upload进程日志提示“403 Forbidden”

**问题现象**

使用云存储上传文件失败，出现如下错误提示：

-   app日志提示“"state":65”
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/08/v3/K0Mt2KLSSXis1FAVKZj3Lw/zh-cn_image_0000002179498352.png?HW-CC-KV=V1&HW-CC-Date=20260313T040602Z&HW-CC-Expire=86400&HW-CC-Sign=1447F270BCC7229ADD208F2647D5A661872FB564DBDE0E7C0F39BD7F29409DB3)
    
-   upload进程的日志提示“403 Forbidden”（通过设置“No filters”模式、过滤“C01C50”关键字查找）
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/86/v3/zx7EHCeOQESzBxGpCYhE9A/zh-cn_image_0000002214858989.png?HW-CC-KV=V1&HW-CC-Date=20260313T040602Z&HW-CC-Expire=86400&HW-CC-Sign=F50BCE88D97F78FC99EA8FA227450F5372118F1D26EF46D226236F8B8046D87F)
    

**解决措施**

出现此问题，可按照如下步骤排查和解决：

-   请确认应用的签名方式正确。当前支持[关联注册应用进行自动签名](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section20943184413328)和[手动签名](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section297715173233)两种方式。
-   [将云存储的安全策略配置为始终可读写](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/agc-harmonyos-clouddev-emptyability#li1693311281068)
-   参考[AuthProvider](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/cloudfoundation-cloudcommon#section136610231214)获取用户凭据

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/agc-harmonyos-clouddev-faq*