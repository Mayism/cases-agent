---
title: 代码检查工具（codelinter）
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-command-line-codelinter
category: 指南
updated_at: 2026-03-13T05:18:59.930Z
---

# 代码检查工具（codelinter）

codelinter同时支持使用命令行执行代码检查与修复，可将codelinter工具集成到门禁或持续集成环境中。

codelinter命令行格式为：

```css
codelinter [options] [dir]
```

options：可选配置，请参考[表1](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-command-line-codelinter#table25697717185)。

dir：待检查的工程根目录；为可选参数，如不指定，默认为当前上下文目录。

**表1** codelinter命令行配置

| 指令 | 说明 |
| --- | --- |
| --config/-c <filepath> | 指定执行codelinter检查的规则配置文件，<filepath>指定执行检查的规则配置文件位置。 |
| --fix | 设置codelinter检查同时执行QuickFix。 |
| --format/-f | 设置检查结果的输出格式。目前支持default/json/xml/html四种格式；不指定时，默认是default格式（文本格式）。 |
| --output/-o <filepath> | 指定检查结果保存位置，且命令行窗口不展示检查结果。<filepath>指定存放代码检查结果的文件路径，支持使用相对/绝对路径。不使用--output指令时，检查结果默认会显示在命令行窗口中。 |
| --version/-v | 查看codelinter版本。 |
| --product/-p <productName> | 指定当前生效的product。 <productName> 为生效的product名称。 |
| --incremental/-i | 对Git工程中的增量文件（包含新增/修改/重命名的文件）执行Code Linter检查。 |
| --help/-h | 查询codelinter命令行帮助。 |
| --exit-on/-e <levels> | 指定哪些告警级别需要返回非零退出码，告警级别包括：error、warn和suggestion。若需要指定多个告警级别，级别间需要用英文逗号分开。退出码的计算方式为：用一个3位的二进制数从高到低分别表示error、warn、suggestion告警级别。若在命令行中配置告警级别，并且代码检查结果中也包含该告警级别，则该二进制值为1，否则均为0。将二进制数转换为十进制数，则是退出码。例如：命令配置为--exit-on error，代码检查结果包括error、warn、suggestion三类告警，则退出码的二进制数为100，十进制数为4。命令配置为--exit-on error，代码检查结果包括warn、suggestion两类告警，则退出码的二进制数为000，十进制数为0。 |

1.  进行codelinter代码检查与修复。若您的工程存在多个product，请使用--product/-p指令，指定生效的product和执行检查的工程根目录。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e7/v3/rUR-QclSTgKsi0qAXUut_A/zh-cn_image_0000002501070348.png?HW-CC-KV=V1&HW-CC-Date=20260313T051819Z&HW-CC-Expire=86400&HW-CC-Sign=49A569F3A7D871BED11954597370379B98D565275044B79EE979689DB50AB4C5)
    
    -   在工程根目录下使用命令行工具：
        1.  直接执行 **codelinter** 指令。此时根据默认codelinter检查规则，对该工程中的TS/ArkTS文件进行代码检查。默认的规则清单可在检查完成后，根据命令行提示，查看相应位置的code-linter.json5文件。
            
            ```cpp
            codelinter // 进行codelinter检查
            ```
            
            ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ce/v3/CKwQmZenSGCsa1BzkFsapQ/zh-cn_image_0000002500910510.png?HW-CC-KV=V1&HW-CC-Date=20260313T051819Z&HW-CC-Expire=86400&HW-CC-Sign=3109E30AB62A618CB8FD93AE933774A4642A15F684CB66E1C0DF342405F79922 "点击放大")
            
        2.  执行如下命令，指定codelinter检查所使用的code-linter.json5规则配置文件，并进行代码检查。
            
            ```cpp
            codelinter -c filepath // 指定执行检查的规则配置文件位置
            ```
            
            ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d7/v3/QF9m-xQFQYGbHMEjD2lUmw/zh-cn_image_0000002532750373.png?HW-CC-KV=V1&HW-CC-Date=20260313T051819Z&HW-CC-Expire=86400&HW-CC-Sign=21C26D6FEB8C7E577B072716FDF3C621924C64499186FCA5ED0F1E52217C0EBF "点击放大")
            
        3.  执行如下命令，对指定工程将根据指定的规则配置文件执行codelinter检查，并对部分支持修复的告警信息进行自动修复。
            
            ```scss
            codelinter -c filepath --fix // 对工程中的告警进行修复
            ```
            
            ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bf/v3/vJkdbzVRTT2pS7PQalfPqw/zh-cn_image_0000002542181027.png?HW-CC-KV=V1&HW-CC-Date=20260313T051819Z&HW-CC-Expire=86400&HW-CC-Sign=7D332CD86E8BA5E48BDB17E1FFD89325E1A9642C096D28203688013FC7F60EDA)
            
    -   在非工程根目录下使用命令行工具：
        1.  执行如下命令，指定需要进行检查的工程目录或文件路径。此时根据默认codelinter检查规则，对该工程中的TS/ArkTS文件进行代码检查。默认的规则清单可在检查完成后，根据命令行提示，查看相应位置的code-linter.json5文件。
            
            ```less
            codelinter dir [filepath] [dir1] // 指定执行检查的工程目录或文件路径。支持同时配置多个文件/文件夹路径。 filepath为待检查的文件所在位置，dir、dir1指定待检查的工程目录
            ```
            
            ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1b/v3/ielZiFLaR7idnE_yF0mbbQ/zh-cn_image_0000002500910512.png?HW-CC-KV=V1&HW-CC-Date=20260313T051819Z&HW-CC-Expire=86400&HW-CC-Sign=CC19561B818FE08527B84C83D12A4DC1556B5DC8C0C5299E9133E6BAC6FC31E0 "点击放大")
            
        2.  在指定的工程目录下，根据指定的codelinter规则配置文件进行代码检查。
            
            ```bash
            codelinter -c filepath dir // filepath为指定的规则配置文件所在位置，dir指定执行检查的工程根目录
            ```
            
        3.  执行如下命令，对指定工程重新执行codelinter检查，并对部分支持修复的告警进行自动修复。
            
            ```scss
            codelinter -c filepath dir --fix // 对指定工程中的告警进行修复。支持配置同时多个工程路径
            ```
            
            ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4d/v3/imD_2cnmQ-aMZsQmsoZdfA/zh-cn_image_0000002532750377.png?HW-CC-KV=V1&HW-CC-Date=20260313T051819Z&HW-CC-Expire=86400&HW-CC-Sign=14A031ABE593E9472E7D1B8ED4E24614AC2A4542F3858F183773BC4CB123934E "点击放大")
            
    
2.  如需指定检查结果输出格式（以json格式为例），执行如下指令。检查结果将在命令行窗口展示。
    
    ```bash
    codelinter [dir] -f json  //[dir]为待检查的工程根目录
    ```
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5b/v3/4WRQFxmURcOa3eR3XQs8Lw/zh-cn_image_0000002500910516.png?HW-CC-KV=V1&HW-CC-Date=20260313T051819Z&HW-CC-Expire=86400&HW-CC-Sign=462D74B3F692C77AE2A6E3324E185F43095FEA35F362560EC8D34243261C2A81)
    
3.  执行如下指令，指定代码检查输出格式及结果保存位置。此时将不在命令行窗口中打印检查结果，可在指定的文件存放路径下查看。
    
    ```bash
    codelinter [dir] -f json -o filepath2     // [dir]为待检查的工程根目录，filepath2为指定存放代码检查结果的文件路径
    ```
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/88/v3/VQJI5MfOQRyQ8QLcvw4GaQ/zh-cn_image_0000002501070360.png?HW-CC-KV=V1&HW-CC-Date=20260313T051819Z&HW-CC-Expire=86400&HW-CC-Sign=55814B7EE4387371453EC49C5FF0186518AFE1C6FE0FA4C956E415DAD264ACCF)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-command-line-codelinter*