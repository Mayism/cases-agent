---
title: 编译报错“Property xxx does not exist on type 'typeof BuildProfile'.”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-11
category: FAQ
updated_at: 2026-03-13T05:30:57.162Z
---

# 编译报错“Property xxx does not exist on type 'typeof BuildProfile'.”

**问题现象****1**

使用自定义参数BuildProfile时，编译过程中未出现异常，但编译构建失败，提示“Property xxx does not exist on type 'typeof BuildProfile'”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0d/v3/S3DcI-aGQLq0Cm4hFz2s0g/zh-cn_image_0000002229604165.png?HW-CC-KV=V1&HW-CC-Date=20260313T053050Z&HW-CC-Expire=86400&HW-CC-Sign=C29406A67F81AF63FB7BA3F2CF83A089224D58F2B88CA26BA5CD03FE73099D60)

**解决措施**

检查当前模块下build-profile.json5文件中targets>buildProfileFields配置的自定义参数的key值是否一致。如果不一致，请将targets内所有buildProfileFields的key值统一。

以下为导致编译报错的配置示例：

```json
"targets": [
  {
    "name": "default",
    "config": {
      "buildOption": {
        "arkOptions": {
          "buildProfileFields": {
            "targetName": "default"
          }
        }
      }
    }
  },
  {
    "name": "default1",
    "config": {
      "buildOption": {
        "arkOptions": {
          "buildProfileFields": {
            "targetName1": "default1"
          }
        }
      }
    }
  }
]
```

将targets内所有buildProfileFields的key值修改为一致，例如都修改为targetName。

**问题现象2**

使用了自定义参数BuildProfile并且编译器标红且构建失败，提示“Property xxx does not exist on type 'typeof BuildProfile'.”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/88/v3/lSQfLwFhSICJw1OWOfsy4w/zh-cn_image_0000002194318396.png?HW-CC-KV=V1&HW-CC-Date=20260313T053050Z&HW-CC-Expire=86400&HW-CC-Sign=75A73B64EF7FB4B19A41ED0CAD4AF4D33C75F7430D8BD62E88AD90CDB0857A5B)

**解决措施**

检查当前模块下的 build-profile.json5文件，确保buildProfileFields中已添加所使用的自定义参数。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-11*