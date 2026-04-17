---
title: Instrument Test
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-instrument-test
category: 指南
updated_at: 2026-03-13T05:01:42.722Z
---

# Instrument Test

## 创建ArkTS测试用例

### 创建默认测试用例

1.  在工程目录下打开待测试模块（支持HAP、HAR、HSP模块）下的ets文件，将光标置于代码中任意位置，单击**右键 > Show Context Actions** **> Create Instrument Test**或快捷键**Alt+Enter** **（macOS为Option+Enter）> Create Instrument Test**创建测试类。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b6/v3/ko2F8KMgTYqBBBdL1UibkA/zh-cn_image_0000002532750253.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=86B8689D23B05D9DEAC10377A5768DDDF244A56593C221B13FEB77ECD6142755)
    
2.  在弹出的Create Instrument Test窗口，输入或选择如下参数。
    
    -   **Testing library**：测试类型，默认为DECC-ArkTSUnit，JS语言默认为DECC-JSUnit。
    -   **ArkTS name**：创建的测试文件名称，测试文件中包含了测试用例。测试文件名称要求在工程目录范围内具有唯一性，仅支持字母、数字、下划线（\_）和点（.）。
    -   **Destination package**：测试文件存放的位置，建议存放在待测试模块的test目录下。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/fe/v3/i84Q1eA7ReyL8agoqgmwPA/zh-cn_image_0000002532750239.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=24F6ED02F7AEE369EE1B550F3BD1ED0F95F049D1FC06D5D3AE6DF3BAB1874A04)
    
3.  DevEco Studio在ohosTest/ets/test目录下自动生成对应的测试类。在测试类中，DevEco Studio会生成对应方法的用例模板，具体测试代码需要开发者根据业务逻辑进行开发，具体请参考[自动化测试框架使用指导](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkxtest-guidelines)。
    
    说明
    
    -   您也可以手动在ohosTest > ets > test文件夹下创建测试用例，手动创建后，需要在List.test.ets文件中添加创建的用例类。手动创建的工程或历史工程，ohosTest > ets > test文件夹下所有文件的文件名必须以.test.ets结尾，否则将在运行时弹窗提示“Error: Test files must end with '.test.ets'.”请点击**Fix**按钮，DevEco Studio将自动对ohosTest > ets > test目录下的文件名进行修改。
    -   首次在HarmonyOS设备上运行UI测试框架需要使用命令“hdc -n shell param set persist.ace.testmode.enabled 1”使能UiTest测试能力。
    

### 自定义Ability和Resources

从5.0.3.403版本开始，新创建的工程/模块的ohosTest目录下默认不创建testability、testrunner和resources目录，历史工程仍保留这些目录，如果新工程需要使用ability或resources能力，需要开发者自行创建。

说明

如果需要使用ability能力，需要同时创建testrunner目录及OpenHarmonyTestRunner.ets文件。

**表1** **新旧版本ohosTest目录对比**

| 新版本 | 历史版本 |
|  |  |

1.  创建以下目录或文件，文件内容示例可在[运行Instrument Test测试用例](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-instrument-test#section1574003717165)后，在对应模块的build/{productName}/intermediates/src/ohosTest下查看，其中productName是当前生效的product，可以通过点击DevEco Studio右上方![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ab/v3/0hFXc9b5T1i5ANSPl2vjlw/zh-cn_image_0000002532750215.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=6D222FC8F341FBBA1F6E831298F14B097AEAED24EF10E159584437337FB68C19)图标进行查看。
    
    -   testability目录 > TestAbility.ets文件
    -   testability目录 > pages目录 > Index.ets文件
    -   testrunner目录 > OpenHarmonyTestRunner.ets文件
    -   resources目录 > base目录 > element目录 > color.json文件
    -   resources目录 > base目录 > element目录 > string.json文件
    -   resources目录 > base目录 > profile目录 > test\_pages.json文件
    
2.  在module.json5文件中补充ability配置字段mainElement、pages、abilities，关于字段的具体说明请参考[module.json5配置文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file)。
    
    ```cangjie
    {
      "module": {
        "name": "entry_test",
        "type": "feature",
        "description": "$string:module_test_desc",
        "mainElement": "TestAbility",                                   // 对应下方abilities中的ability name。
        "deviceTypes": [
          "phone",
          "tablet",
          "2in1"
        ],
        "deliveryWithInstall": true,
        "installationFree": false,
        "pages": "$profile:test_pages",                                 // 对应resources目录 > base目录 > profile目录 > test_pages.json文件。
        "abilities": [                                                  // 添加的ability的配置信息。
          {
            "name": "TestAbility",
            "srcEntry": "./ets/testability/TestAbility.ets",
            "description": "$string:TestAbility_desc",
            "icon": "$media:icon",    // 确保引用的资源都存在
            "label": "$string:TestAbility_label",
            "exported": true,
            "startWindowIcon": "$media:icon",
            "startWindowBackground": "$color:start_window_background"
          }
        ]
      }
    }
    ```
    

## 运行测试用例

### 运行模式

使用DevEco Studio运行测试用例前，需要将设备与电脑进行连接，将工程编译成带签名信息的HAP，再安装到真机设备或模拟器上运行，具体请参考[使用本地真机运行应用](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-run-device)或[使用模拟器运行应用](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-run-emulator)。

可以采用运行工程目录（test）、测试文件（如Ability.test.ets）、测试套件（describe）、测试方法（it）的方式来运行测试用例：

-   在工程目录中，单击**右键 > Run'测试文件名称'**，执行测试。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/17/v3/XakmXWTWSFum3YQvHvc0Ng/zh-cn_image_0000002532750237.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=6655B97B60365E78553460AE884A670D20B057C8D638CC3E68AA2FDBC1B80DB4)
    
-   打开测试文件，单击测试套件左侧按钮。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/50/v3/wKWst2nuSfiDe0q2MXfoJw/zh-cn_image_0000002501070232.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=E66CE1FF079C0CA5BBAF6AAC8ECA441836217C39C45DEF1E8563CFB52320DF8B)
    
-   如果要根据自定义的配置执行Instrument Test，在[创建测试用例运行任务](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-instrument-test#section65264166107)后，通过如下方式的其中之一，执行Instrument Test：
    -   在工具栏主菜单单击**Run > Run'测试名称'**。
    -   在DevEco Studio的右上角，选择测试任务，然后单击右侧的![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ca/v3/q3VO6kXTQ7SxFOxPo2Lvbg/zh-cn_image_0000002532670291.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=D7FD9176DD45017E2725A81EC4F9728868380E6B3EA466E79F1AA3100DF4D26C)按钮，执行Instrument Test。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/52/v3/AJSc2sg2T8GZiY0VaKw7KA/zh-cn_image_0000002532670289.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=2DD46553C90939F35B45C1044742AD1A9118CDDE0DC10307BE346D14F078872F)
        

执行完测试任务后，查看测试结果。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b5/v3/o1VdTlvTToCs0uv9RrS_QA/zh-cn_image_0000002532750225.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=99D94761D41BC198AC352D7D984031C6C8BCA0F013325F0A0967CEF24E8937B5)

### 调试模式

调试模式相比运行模式增加了断点管理功能。在断点命中时，可以选择单步执行、步入步出、进入下个断点等方式进行调试，另外可以使用线程堆栈可视化、变量和表达式可视化功能，快速定位问题。

以文件级别为例，在添加断点之后，在工程目录中，选中文件，单击**右键 > Debug'测试文件名称'**，以调试模式执行测试任务。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/42/v3/6I5Iok_QQBq7ayQd2qb7Pg/zh-cn_image_0000002501070196.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=78D9C26499A2E8036ED352FC1D96034914D085671E17900972D6D77A01405552)

在断点命中时，下方将出现Debug窗口。开发者可在该窗口中进行断点管理与基础调试能力的可视化操作，在断点命中时可查看当前线程的变量和堆栈信息。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5a/v3/WNf3YQdQQ7yDLvjvTB1uyQ/zh-cn_image_0000002500910386.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=C6C37038C435F151E3F75DEFCFD9EACABC846706615D93C2EA7FD83E4CDD09A7)

断点命中时，在代码编辑器窗口单击右键，在弹出的菜单中将出现调试模式特有功能，如计算表达式、添加变量监视等。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/10/v3/T884q2JiRuiJpeqoRIyHnA/zh-cn_image_0000002500910348.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=ACFA0A126C892D1A4C458E6BF2306C6173DAC5CAF9FBE0D608F50AE532E25F12)

在跳出所有断点后，测试结束，与运行模式相同，在测试窗口查看测试结果。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1c/v3/5rP-h8VaSxqJJvmvUC6_TQ/zh-cn_image_0000002500910346.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=8A3834188FB19CA282E838F36BAB07FC0898A6940E97BA18361DD49693797CD1)

说明

DevEco Studio支持设置调试代码类型，具体请参考[设置调试代码类型](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-instrument-test#section0164586312)。

### 覆盖率统计模式

在Instrument Test运行的基础上支持代码覆盖率统计。

开发者可以自定义需要参与覆盖率测试的文件，具体配置方法请参考[配置覆盖率过滤文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ui-test#section13756446154)。

可以采用运行工程目录（test）、测试文件（如Ability.test.ets）、测试套件（describe）、测试方法（it）的方式来启动代码覆盖率的统计。

以文件级别为例，有两种方式启动测试：

-   方式一：在工程目录中，选中文件，单击**右键 > Run '测试文件名称' with Coverage**，执行测试。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c1/v3/syg1R9IGS5K_V0RlxlijJw/zh-cn_image_0000002501070206.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=56BD707BE35C36E488D64AEC61C29A5FDE5EA0F260DF4B9D0958D7ADC82F93DC)
    
-   方式二：在DevEco Studio的右上角，选择测试任务，然后单击右侧的![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/22/v3/jiE-4nzXSX6vaYoIs-OJzQ/zh-cn_image_0000002501070202.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=1256D188DFEB43026B5010054F5D370C1DA23F49DD937760DF3346829ABA93BC)按钮，执行测试。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ae/v3/1E7H1yILTdK0Uu3xe5SuEw/zh-cn_image_0000002501070222.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=B6FAB832BFE8D286283987DEA367D06A9C6CDAA134F927CB0716ABC3DCD0DB57)
    

启动测试后，进行编译构建，底部将出现Cover窗口，构建结束后自动拉起Cover窗口，测试任务结束后，窗口中会打印测试报告的路径。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f3/v3/mqFBDRpETi2omv2dT4b3Ew/zh-cn_image_0000002532670305.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=1AA5C3F29E236CF56CDDA7CE054171079A0D43F399558454C1FFCC39B3A18D8A)

点击链接可打开报告，查看ArkTS代码覆盖率详情，关于覆盖率的计算方式请参考[查看覆盖率报告](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ui-test#section10394362109)。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a3/v3/L4lzwSjeTaW1lf_GydpdCQ/zh-cn_image_0000002532750259.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=A14B178B7F074AF5FE6B1EBEFB123654E9F1E2290974E9D56C87B018C70ACF5A)

在Cover窗口中，单击rerun按钮可以按照之前的设置，重新执行覆盖率用例。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a8/v3/7TDz0YnfRtW2BbcBz9HQGw/zh-cn_image_0000002532670303.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=1C723954303D58B6EF08E8AFDB31ADC98ACEC36AE90435C0B493855D6BE842D9)

## （可选）自定义测试用例运行任务

默认情况下，测试用例可直接运行，如果需要自定义测试用例运行任务，可通过如下方法进行设置。

1.  在工具栏主菜单单击**Run** > **Edit Configurations**进入Run/Debug Configurations界面。
2.  在**Run/Debug Configurations**界面，单击+按钮，在弹出的下拉菜单中，单击Instrument Test。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f0/v3/_V_AGwToTYS48o-yhKVs4w/zh-cn_image_0000002501070230.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=363DECF10F3F268DF51967A88FD10512907ABF557399DB09DB91713E75198A92)
    
3.  根据实际情况，配置Instrument Test的运行参数。然后单击**OK**，完成配置。
    
    -   如果模块依赖共享包，请提前设置HAP安装方式，勾选“**Keep Application Data**”，则表示采用覆盖安装方式，保留应用/元服务缓存数据。
    -   如果工程中HAP/HSP模块直接依赖其他HSP模块（如entry模块依赖HSP模块）或间接依赖其他模块（如entry模块依赖HAR模块，HAR又依赖HSP模块）时，在测试阶段需要同时安装模块包及其所有依赖模块的包到设备中。此时，可以勾选“**Auto Dependencies**”，测试时会自动将所有依赖的模块都安装到设备上。该选项默认勾选。
    -   如果不涉及UI测试，勾选“**Only OhosTest Package**”，则只会推送OhosTest测试包到设备上，不会推送HAP/HSP包，可以缩短推包时间。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e2/v3/xtRbSkJCRlW_aEl6UJSt8w/zh-cn_image_0000002501070218.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=1688A1B5829665405B27FBCBC07746C76E7ED8055150695BCC46E43B2DC140DE)
    

### 使用过滤条件筛选待运行的测试用例

1.  在用例编写时，通过配置it的第二个入参，为每个用例添加过滤参数。此参数用于为测试用例添加标注，不添加则参数默认为0表示未被标注。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ab/v3/E_mcv3evQHu-ggVEAN8K8g/zh-cn_image_0000002501070220.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=EE1F4766B66981231AE02690557F63D923A11756EF3D7931D467D443EC11EC41)
    
2.  打开**Run/Debug Configurations**窗口，点击Test Args![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/03/v3/JrZ9s4EXTdKH4t6v5oVHbQ/zh-cn_image_0000002500910370.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=7702FCF3BB1C599A8A8D528637BB0C2A80BB933DB28A5F1C8EDF9C8F364D6D85)，打开**Test Args**界面，添加命令行参数。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/03/v3/GIepApMeTE22g8enOF-VmQ/zh-cn_image_0000002532670295.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=B1DDB0DDFC94CDC1051CEC997DA236BD6B0E3E75FF9630E8CE240BAC20162937)
    
    例如将测试参数配置为level=1, size=medium
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a1/v3/aK3g01_YSBmjZiOM1vlG2A/zh-cn_image_0000002501070216.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=23552433AF75813502E689C45F57FB9DFBC5BC68B7E042A5B3F08561B7F61BA7)
    
    **表2** 参数规则参考
    
    | Key | 含义说明 | Value取值范围 |
    | --- | --- | --- |
    | level | 用例级别 | "0","1","2","3","4", 例如：-s level 1 |
    | size | 用例粒度 | "small","medium","large", 例如：-s size small |
    | testType | 用例测试类型 | "function","performance","power","reliability","security","global","compatibility","user","standard","safety","resilience", 例如：-s testType function |
    
3.  完成以上配置后，在运行此项配置对应的测试任务时，只运行过滤后的测试用例。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/62/v3/hfJNrvBBQOO4uZGeAjUdsQ/zh-cn_image_0000002501070204.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=4E486EFB13F797E26714195780CD47452168D55F4AC623DC396A6982391FE19D)
    

### 设置调试代码类型

点击**Run > Edit Configurations**，打开**Run/Debug Configurations**窗口，选择Instrument Test，点击**Debugger**页签，设置Debug type。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f8/v3/nEblIBOhQm69TwP2B6nLRA/zh-cn_image_0000002501070198.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=21E3657358ACD572CFEC8DC929E0A470C7ED04287C34BF39BB97D7AFAAAD6935)

调试类型Debug type默认为Detect Automatically，关于各调试类型的说明如下表所示：

| 调试类型 | 调试代码 |
| --- | --- |
| Detect Automatically | 自动检测。根据工程模块及其依赖的模块涉及的编程语言，自动启动对应的调试器。如果检测到是Native模块，出现两个调试窗口（PandaDebugger、Native）；如果不是Native模块，只出现PandaDebugger调试窗口。 |
| ArkTS/JS | 只调试ArkTS/JS，只出现PandaDebugger调试窗口。 |
| Native | 单独调试C++，只出现Native调试窗口。 |
| Dual(ArkTS/JS + Native) | 支持ArkTS/JS和C++混合调试，出现两个调试窗口（PandaDebugger、Native）。 |

说明

调试C++代码时，当前模块及所有依赖的HSP模块的[Address Sanitizer配置](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-instrument-test#section8352185341915)要保持一致，若不一致，可能无法进入C++代码的断点处。

### ASan检测

Instrument Test针对C/C++方法提供ASan检测能力，关于ASan的介绍请参考[ASan检测](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-asan)，当前不支持JS语言。

1.  在运行/调试配置窗口，选择对应的Instrument Test，点击**Diagnostics**页签，勾选**Address Sanitizer**选项，勾选后，测试包和源码包均开启ASan能力。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2e/v3/QrmCQRuKS66mviyB7QSZhQ/zh-cn_image_0000002532670293.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=3DC39D35B6B6D96D91AA407DF68AFDD89226DD2BA6C1DA61A791A66A64427E9B)
    
2.  如果有引用本地library，需在library模块的build-profile.json5文件中，配置arguments字段值为“-DOHOS\_ENABLE\_ASAN=ON”，表示以ASan模式编译so文件。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d5/v3/w_AOWcBvRpWNH3137UfV2A/zh-cn_image_0000002532750249.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=9C83657820518DEB973C0A945BAE9945B79452062D3E7B7159E5E0477FAC4186)
    
3.  运行测试用例。
4.  当程序出现内存错误时，弹出ASan log信息，点击信息中的链接即可跳转至引起内存错误的代码处。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d3/v3/p8nv3v5kTTmI6wYiTcbevA/zh-cn_image_0000002532670299.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=52BFCE0C6895B91F15E2E874958440861FBD1910D0530C724CED678CC5B09F85)
    

## 测试C++代码

从DevEco Studio 6.0.0 Beta5版本开始，支持对C++代码进行测试，包括运行/调试C++测试代码、对C++代码进行覆盖率统计。

由于C++的测试so无法直接在设备上运行，需要通过Node-API的方式拉起，即通过ArkTS/JS语言拉起C/C++测试用例。

### 运行C++测试代码

1.  创建cpp测试目录，鼠标右键单击ohosTest目录，选择**New > C/C++ File(Napi)**，在ohosTest下生成cpp测试目录，以entry模块为例，目录结构如下。
    
    -   **src > ohosTest > cpp > types**：用于存放C++的API接口描述文件。
    -   **src > ohosTest > cpp > types** **\> libentry\_test > index.d.ts**：描述C++ API接口行为，如接口名、入参、返回参数等。
    -   **src > ohosTest > cpp > types** **\> libentry\_test > oh-package.json5**：配置.so三方包声明文件的入口及包名。
    -   **src > ohosTest > cpp > CMakeLists.txt**：CMake配置文件，提供CMake构建脚本。
    -   **src > ohosTest > cpp > napi\_init.cpp：**定义C++ API接口的文件**。**
    
    说明
    
    DevEco Studio生成的cpp测试目录中不包含C++测试框架，需要开发者自行选择开源测试框架使用。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/80/v3/S75U2rm-TxqR4v-QtK6CZg/zh-cn_image_0000002532670307.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=714B09429B73CBF0B49300951942AF11E8DAAC2339940261379F22D36799ED7E)
    
2.  通过ArkTS测试用例拉起C++测试，示例如下。
    
    ```javascript
    // ArkTS测试文件Ability.test.ets
    import entryTest from 'libentry_test.so';
    export default function abilityTest() {
      describe('ActsAbilityTest', () => {
        ...
        it('testNative', 0, () => {
          hilog.info(0x0000, 'testTag', '%{public}s', 'testNative it begin');
          let result = entryTest.runNativeTest();
          hilog.info(0x0000, 'testTag', '%{public}s', result)
          expect(result).assertContain("ended");
        })
      })
    }
    ```
    
3.  运行testNative测试用例，查看测试结果。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/23/v3/TB3z0VweRJuGiExrGnDf0A/zh-cn_image_0000002500910382.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=2AA6C3560CBFD83437A51ACE02A9D362D2827B821CDB1B79E96ABD79B5BE6556)
    

### 收集代码覆盖率

DevEco Studio默认不收集C++代码覆盖率，需要通过以下方式开启。

1.  在测试目录下的CMakeLists.txt中添加以下代码，开启覆盖率编译插桩能力。
    
    ```bash
    // DevEco Studio 6.0.2 Beta1之前版本
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fprofile-instr-generate -fcoverage-mapping")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fprofile-instr-generate -fcoverage-mapping")
    // DevEco Studio 6.0.2 Beta1及以上版本，OHOS_TEST_COVERAGE在覆盖率模式下为true，在调试/运行模式下为false
    if(OHOS_TEST_COVERAGE)
      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fprofile-instr-generate -fcoverage-mapping")
      set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fprofile-instr-generate -fcoverage-mapping")
    endif()
    ```
    
2.  在napi\_init.cpp文件的RunNativeTest方法中，调用\_\_llvm\_profile\_write\_file方法，将覆盖率数据保存到设备的/data/storage/el2/base路径下的c++\_coverage.profraw文件中，该路径和文件名不可修改，示例代码如下。
    
    ```cpp
    extern "C" {
        void __llvm_profile_set_filename(char *);
        int __llvm_profile_write_file(void);
    }
    static napi_value RunNativeTest(napi_env env, napi_callback_info info)
    {
        char filename[256];
        snprintf(filename, sizeof(filename), "/data/storage/el2/base/c++_coverage.profraw"); // 覆盖率报告文件路径和文件名，不可修改
        __llvm_profile_set_filename(filename);
        // 开启测试
        ...
        // 结束测试，保存数据
         __llvm_profile_write_file();
        ...
    }
    ```
    
3.  运行覆盖率测试，选中ArkTS测试文件，单击**右键 >** **Run '测试文件名称' with Coverage**，执行测试。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/65/v3/2m3cQvehS3aEBp8wGiiP9Q/zh-cn_image_0000002501070194.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=9917041D67628EADF9F9591C9BAA4F45076A89F0EB69D86CA4B6EEEFB81356AD)
    
    启动测试后，进行编译构建，底部将出现Cover窗口，构建结束后自动拉起Cover窗口，测试任务结束后，窗口中会打印测试报告的路径。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/36/v3/SlywO5KLS2mzWUWeHnWWgA/zh-cn_image_0000002532750217.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=023D6C9843F98AD68B4AF33EEEAB59EEB4D3B499B4D12910BB3F44CA291C16E9)
    
    点击链接可打开报告，查看C++代码覆盖率详情。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2d/v3/ZXRkfrYZThSLJyLzbgKhZw/zh-cn_image_0000002501070208.png?HW-CC-KV=V1&HW-CC-Date=20260313T050100Z&HW-CC-Expire=86400&HW-CC-Sign=96CA5A746432269B72C0AE25B9B420720817E39E74E7C2211561C6D32170FD34)
    

## 使用命令行执行测试Instrument Test

通过命令行方式执行Instrument Test，在工程根目录下执行命令：

```lua
hvigorw onDeviceTest -p module={moduleName} -p coverage={true|false} -p scope={suiteName}#{methodName} -p ohos-debug-asan={true|false}
```

-   module：执行测试的模块，缺省默认是执行所有模块的用例。
-   coverage：是否生成覆盖率报告，缺省默认是true，在<module-path>/.test/default/outputs/ohosTest/reports路径下生成两份报告，一份是html格式（index.html），一份是json格式（coverageReport.json），具体参考[查看覆盖率报告](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ui-test#section10394362109)。
    
    如果开启了C++代码覆盖率测试，会生成C++代码的覆盖率报告，路径：<module-path>/.test/default/outputs/ohosTest/cpp\_reports/index.html
    
-   scope：格式为{suiteName}#{methodName}或{suiteName}，分别表示测试用例级别或测试套件级别的测试，缺省默认是执行当前模块的所有用例。
-   ohos-debug-asan：是否启用ASan检测，缺省默认是false。从DevEco Studio 5.1.1 Beta1版本开始支持。
    
    ASan日志路径：<module-path>/.test/default/intermediates/ohosTest/coverage\_data
    

说明

-   通过命令行执行测试时，不支持配置product，默认为default。
-   多个module和scope之间用逗号隔开。

测试结果文件：<module-path>/.test/default/intermediates/ohosTest/coverage\_data/test\_result.txt

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-instrument-test*