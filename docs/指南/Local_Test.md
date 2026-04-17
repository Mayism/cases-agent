---
title: Local Test
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-local-test
category: 指南
updated_at: 2026-03-13T05:02:03.810Z
---

# Local Test

说明

当前不支持测试C/C++方法及系统API。

## 创建Local Test测试用例

1.  在工程目录下打开待测试模块（支持HAP、HAR、HSP模块）下的ets文件，将光标置于代码中任意位置，单击**右键 > Show Context Actions** **> Create Local Test**或快捷键**Alt+Enter****（macOS为Option+Enter） > Create Local Test**创建测试类。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/65/v3/D_ba3n2JRfO4ABd68c3Zmg/zh-cn_image_0000002500910558.png?HW-CC-KV=V1&HW-CC-Date=20260313T050124Z&HW-CC-Expire=86400&HW-CC-Sign=F90472B2C6739A6B3EFADDF6B006854C82C7E835578EA493B2EB7E6D40207384)
    
2.  在弹出的Create Local Test窗口，输入或选择如下参数。
    
    -   **Testing library**：测试类型，默认为DECC-ArkTSUnit。
    -   **ArkTS name**：创建的测试文件名称，测试文件中包含了测试用例。测试文件名称要求在工程目录范围内具有唯一性，仅支持字母、数字、下划线（\_）和点（.）。
    -   **Destination package**：测试文件存放的位置，建议存放在待测试模块的test目录下。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2c/v3/qyvO1YMcRo64USaZkZRxKQ/zh-cn_image_0000002500910544.png?HW-CC-KV=V1&HW-CC-Date=20260313T050124Z&HW-CC-Expire=86400&HW-CC-Sign=B1511B8829695DDB1D73448654EB0B3DD0788F173C0BAD149944784489458E28)
    
3.  DevEco Studio在test目录下自动生成对应的测试类。在测试类中，DevEco Studio会生成对应方法的用例模板，具体测试代码需要开发者根据业务逻辑进行开发，具体请参考[单元测试框架](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/unittest-guidelines)。
    
    说明
    
    您也可以手动在test文件夹下创建测试用例，手动创建后，需要在List.test.ets文件中添加创建的用例类。
    

## 运行Local Test测试用例

### 运行模式

可以采用运行工程目录（test）、测试文件（如Index.test.ets）、测试套件（describe）、测试方法（it）的方式来执行Local Test，各级别测试执行入口如下。

|  |  |
| 目录级 | 文件级 |
|  |  |
| 套件级 | 方法级 |

以文件级别为例，在工程目录中，选中文件，单击**右键 > Run'测试文件名称'**，执行测试。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4d/v3/LdxhZ69PQyK9z1_yYzCc-w/zh-cn_image_0000002500910550.png?HW-CC-KV=V1&HW-CC-Date=20260313T050124Z&HW-CC-Expire=86400&HW-CC-Sign=E379C5437151D148B76BF8345ECB86F7FE49C386E9A94A35699BC4EE989032CF)

也可以通过如下方式，执行Local Test：

-   在工具栏主菜单单击**Run > Run'测试名称'**。
-   在DevEco Studio的右上角，选择一项测试任务的配置，然后单击右侧的![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ef/v3/otCqvW8pR0mayzxVPHcaUQ/zh-cn_image_0000002501070408.png?HW-CC-KV=V1&HW-CC-Date=20260313T050124Z&HW-CC-Expire=86400&HW-CC-Sign=3AFA4E3642633E5CDA18A6BE36F2EADF1F05700A320EE7C0B903A0A297950688)按钮，执行Local Test。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/de/v3/sbrNLP5mRwWYdA1caVB-0Q/zh-cn_image_0000002532670461.png?HW-CC-KV=V1&HW-CC-Date=20260313T050124Z&HW-CC-Expire=86400&HW-CC-Sign=C9D0DF265CCF2151E548DA599A727D56B6BA95F7027B4B123381E632D27C0D19)
    

执行完测试任务后，查看测试结果。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ee/v3/2GC7QWzWRm6f38_x_5ob7g/zh-cn_image_0000002532750423.png?HW-CC-KV=V1&HW-CC-Date=20260313T050124Z&HW-CC-Expire=86400&HW-CC-Sign=E5575DC13325975BBF5D14CA68B276B94EEA6EF2D9831E9159E488BC40375071)

### 调试模式

调试模式相比运行模式增加了断点管理功能。在断点命中时，可以选择单步执行、步入步出、进入下个断点等方式进行调试，另外可以使用线程堆栈可视化、变量和表达式可视化功能，快速定位问题。

以文件级别为例，在添加断点之后，在工程目录中，选中文件，单击**右键 > Debug'测试文件名称'**，以调试模式执行测试任务。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/34/v3/g-PTNJXbSvGXCIFaLC681g/zh-cn_image_0000002532750413.png?HW-CC-KV=V1&HW-CC-Date=20260313T050124Z&HW-CC-Expire=86400&HW-CC-Sign=FB2678B15680655B3E917B7A1B2154538C4C10F2A99FCE82F7A7291C127525EB)

在断点命中时，下方将出现Debug窗口。开发者可在该窗口中进行断点管理与基础调试能力的可视化操作，在断点命中时可查看当前线程的变量和堆栈信息。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8e/v3/sp8CYfL4Qxana3xkC86Trw/zh-cn_image_0000002500910546.png?HW-CC-KV=V1&HW-CC-Date=20260313T050124Z&HW-CC-Expire=86400&HW-CC-Sign=094D6A0BF8A1AA974E1CACDC4F8FA52B12B2252B6A0CF03FE20721212E732900)

断点命中时，在代码编辑器窗口单击右键，在弹出的菜单中将出现调试模式特有功能，如计算表达式、添加变量监视等。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d7/v3/PEd0WkZTRAS1eO-jKVgH_g/zh-cn_image_0000002500910566.png?HW-CC-KV=V1&HW-CC-Date=20260313T050124Z&HW-CC-Expire=86400&HW-CC-Sign=063A170326576C8F7F266D7FE11C7DC3C60463F7D38862B2515A743DAF039107)

在跳出所有断点后，测试结束，与运行模式相同，在测试窗口查看测试结果。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/28/v3/gZD-WssDTYyuhKW-N4P-_A/zh-cn_image_0000002532750425.png?HW-CC-KV=V1&HW-CC-Date=20260313T050124Z&HW-CC-Expire=86400&HW-CC-Sign=4A8BC1855694E8BDF94EEBA4923908558DB2DEBA889AC38B34A51ADD073BC60A)

### 覆盖率统计模式

在LocalTest运行的基础上支持代码覆盖率统计，当前仅支持ArkTS工程。

开发者可以自定义需要参与覆盖率测试的文件，具体配置方法请参考[配置覆盖率过滤文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ui-test#section13756446154)。

如前所述，覆盖率统计模式也有多级别入口，以文件级别为例，有两种方式启动测试：

-   方式一：在工程目录中，选中文件，单击**右键 > Run '测试文件名称' with Coverage**，以覆盖率统计模式执行测试任务。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2b/v3/_diCGaTORO6fZLkHWlHqtQ/zh-cn_image_0000002532670485.png?HW-CC-KV=V1&HW-CC-Date=20260313T050124Z&HW-CC-Expire=86400&HW-CC-Sign=197F1DA86DC1405A861B6D311F0B2A4EF079E8756B6F63D6F37C15A5ADD4EE67)
    

-   方式二：在DevEco Studio的右上角，选择测试任务，然后单击右侧的![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c9/v3/5N8SU9GoQOW0vDaqZPqtVQ/zh-cn_image_0000002532750427.png?HW-CC-KV=V1&HW-CC-Date=20260313T050124Z&HW-CC-Expire=86400&HW-CC-Sign=3176F5DCCBDFE29293DE01FC0379B4BE0C3BBC02AB703D4A91563DC14BE55C0B)按钮，执行测试。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f1/v3/Q-zXyZ7dS2CeD9Ztc5Nq3w/zh-cn_image_0000002532670475.png?HW-CC-KV=V1&HW-CC-Date=20260313T050124Z&HW-CC-Expire=86400&HW-CC-Sign=BFF668176C7ABBD37F492E1D217A22CB7903D643E1C0FD3D63538E0705734512)
    

启动测试后，进行编译构建，底部将出现Cover窗口，构建结束后自动拉起Cover窗口，测试任务结束后，窗口中会打印测试报告的路径。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ef/v3/Aa1Z22ngRH-ltwtZHhsZYA/zh-cn_image_0000002532750417.png?HW-CC-KV=V1&HW-CC-Date=20260313T050124Z&HW-CC-Expire=86400&HW-CC-Sign=81C8A35DCA6BD9180608575E3ED80A5CB7942A81E363DB44BAC5CEBA253F2847)

点击链接可打开报告，查看代码覆盖率详情，关于覆盖率的计算方式请参考[查看覆盖率报告](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ui-test#section10394362109)。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/91/v3/VOl_q3KtQzK71tR5Xb6mSQ/zh-cn_image_0000002500910552.png?HW-CC-KV=V1&HW-CC-Date=20260313T050124Z&HW-CC-Expire=86400&HW-CC-Sign=13C94C52002E8843F87B2CE39D6AD60BEB5C5C7F7B767F756DECE3F53DBD303F)

在Cover窗口中，单击rerun按钮可以按照之前的设置，重新执行覆盖率用例。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b8/v3/pMIuoBiiSluTymy1xg7Cjg/zh-cn_image_0000002532750437.png?HW-CC-KV=V1&HW-CC-Date=20260313T050124Z&HW-CC-Expire=86400&HW-CC-Sign=70DF249B997AD45E60E1A98E3CFED9B124E10E1C9EE23D72C0BB176DA5C2679B)

## （可选）自定义测试用例运行任务

默认情况下，测试用例可直接运行。如果需要自定义测试用例运行任务，可通过如下方法进行设置。

1.  在工具栏主菜单单击**Run**\>**Edit Configurations**，进入Run/Debug Configurations界面。
2.  在**Run/Debug Configurations**界面，单击**+**按钮，在弹出的下拉菜单中，单击**Local Test**。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ca/v3/HudJSpOBTvuJS54TqyowCA/zh-cn_image_0000002532670453.png?HW-CC-KV=V1&HW-CC-Date=20260313T050124Z&HW-CC-Expire=86400&HW-CC-Sign=FB596DD547329759DF20FE73A9EF931E0D61A0DDC4DBED6E965D50A99CAEC197)
    
3.  根据实际情况，配置Local Test的运行参数。 然后单击**OK**，完成配置。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3f/v3/ezXGYjFxQp2S2I89RBkbHA/zh-cn_image_0000002532750421.png?HW-CC-KV=V1&HW-CC-Date=20260313T050124Z&HW-CC-Expire=86400&HW-CC-Sign=C6C59D218F06D23E5D39E8AC5B86088C7353CBF3AFDB40DCC336F9BAF0C7EC94)
    

## 使用命令行执行Local Test

通过命令行方式执行Local Test，在工程根目录下执行命令：

```bash
hvigorw test -p module={moduleName} -p coverage={true | false} -p scope={suiteName}#{methodName}
```

-   module：执行测试的模块。缺省默认是执行所有模块的用例。
-   coverage：是否生成覆盖率报告，缺省默认是true，在<module-path>/.test/default/outputs/test/reports路径下生成两份报告，一份是html格式（index.html），一份是json格式（coverageReport.json），具体参考[查看覆盖率报告](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ui-test#section10394362109)。
-   scope：格式为{suiteName}#{methodName}或{suiteName}，分别表示测试用例级别或测试套件级别的测试，缺省默认是执行当前模块的所有用例。

说明

-   多个module和scope之间用英文逗号隔开。
-   暂不支持在Linux上执行该命令。

测试结果文件：<module-path>/.test/default/intermediates/test/coverage\_data/test\_result.txt

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-local-test*