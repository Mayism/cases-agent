---
title: AIPP参数
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-aipp-parameters
category: 指南
updated_at: 2026-03-13T01:27:32.252Z
---

# AIPP参数

AIPP分为静态AIPP和动态AIPP，两者使用严格区分，静态AIPP模型不能接收模型推理时传入的AIPP参数，不兼容动态AIPP场景，静态与动态AIPP区别详见下表。

| AIPP | 设置AIPP参数方式 | 优点 |
| --- | --- | --- |
| 静态AIPP | 在模型生成时通过配置文件或者IR构图预置。 | 更高效率，模型加载阶段即可完成AIPP初始化。 |
| 动态AIPP | 仅标记该模型具备AIPP处理功能。 | 更灵活，每次推理可传入不同AIPP参数。 |

## AIPP支持的输入格式

AIPP可配置的图片格式如下：

-   YUV420SP\_U8
-   XRGB8888\_U8
-   ARGB8888\_U8
-   YUYV\_U8
-   YUV422SP\_U8
-   AYUV444\_U8
-   YUV400\_U8
-   RGB888\_U8

格式后缀U8表示图片像素点为Uint8类型，范围为0到255。当图片的输入为YUV类型时，无论是YUV420还是YUV422或者YUYV，AIPP自动将图片数据补齐为YUV444格式。

除以上列举的图片类型，AIPP还可以通过开启Channel Swap通道交换功能，支持更加丰富的图片输入格式。

说明

-   YUYV\_U8和AYUV444\_U8当前版本不支持。

## AIPP支持的功能

AIPP按照芯片的处理顺序，支持的功能如下：

-   [Crop](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-aipp-parameters#section197711329191913)：图片裁剪。
-   [Channel Swap](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-aipp-parameters#section8293174872013)：通道交换。
-   [Color Space Conversion](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-aipp-parameters#section89862027112118)：色域转换。
-   [Resize](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-aipp-parameters#section4757633132210)：图片缩放。
-   [Data Type Conversion](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-aipp-parameters#section12331181152317)：数据类型转换。
-   [Rotation](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-aipp-parameters#section127618563124)：图片旋转。
-   [Padding](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-aipp-parameters#section03997455233)：图片补边。

### Crop

AIPP的Crop功能用于对输入图片进行裁剪，涉及参数如下：

| 名称 | 描述 | 取值范围 |
| --- | --- | --- |
| switch | 裁剪使能开关。 | false/true |
| load_start_pos_w | 裁剪起始位置水平方向坐标。 | load_start_pos_w < src_image_size_w |
| load_start_pos_h | 裁剪起始位置垂直方向坐标。 | load_start_pos_h < src_image_size_h |
| crop_size_w | 裁剪出的图像宽度。 | load_start_pos_w + crop_size_w <= src_image_size_w |
| crop_size_h | 裁剪出的图像高度。 | load_start_pos_h + crop_size_h <= src_image_size_h |

YUV类型的图片受图片自身类型的限制，当输入图片类型为YUV420SP、YUYV、YUV422SP和AYUV444时，裁剪的起始坐标和裁剪的宽高都应该是偶数，系统会进行校验。

### Channel Swap

AIPP支持两种类型的通道交换：RB/UV通道交换和AX通道交换。

RB/UV通道交换丰富了输入图片的格式，开启RB/UV通道交换后，AIPP支持的图片输入格式比可配置的输入类型丰富了一倍。

| 配置类型 | 可接受图片类型 |
| --- | --- |
| YUV420SP_U8 | YUV420，YVU420 + rbuv_swap_switch |
| XRGB8888_U8 | XRGB，XBGR + rbuv_swap_switch |
| ARGB8888_U8 | ARGB，ABGR + rbuv_swap_switch |
| RGB888_U8 | BGR + rbuv_swap_switch |
| YUYV_U8 | YUYV，YVYU + rbuv_swap_switch |
| YUV422SP_U8 | YUV422，YVU422 + rbuv_swap_switch |
| AYUV444_U8 | AYUV + rbuv_swap_switch |

当配置的图片输入格式为XRGB、ARGB或AYUV时，支持开启AX通道交换。开启通道交换后，图片第一个通道的输入被搬移到第四个通道上，即当XRGB、ARGB和AYUV开启AX通道交换后，转变为RGBX、RGBA和YUVA。

当模型训练集为RGB格式的图片，而推理时的图片输入为XRGB或者ARGB时，可以通过使能AX通道交换，将RGB通道前移，实现兼容。

### Color Space Conversion

色域转换（Color Space Conversion，以下简称CSC），特指在YUV444和RGB888两种图片格式之间进行转换。涉及如下配置参数。

| 名称 | 描述 | 类型 | 取值范围 |
| --- | --- | --- | --- |
| csc_switch | CSC开关。 | bool | true/false |
| matrix_r0c0matrix_r0c1matrix_r0c2matrix_r1c0matrix_r1c1matrix_r1c2matrix_r2c0matrix_r2c1matrix_r2c2 | CSC矩阵元素。 | int16 | [-32677, 32676] |
| output_bias_0output_bias_1output_bias_2 | RGB转YUV时的输出偏移。 | uint8 | [0, 255] |
| input_bias_0input_bias_1input_bias_2 | YUV转RGB时的输入偏移。 | uint8 | [0, 255] |

参考1：YUV和BGR的转换公式。

-   YUV转BGR
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2d/v3/hBwk_FGXRnaeyFFW5oQd5Q/zh-cn_formulaimage_0000002528408555.png?HW-CC-KV=V1&HW-CC-Date=20260313T012651Z&HW-CC-Expire=86400&HW-CC-Sign=6FFAF91FF958747998889ABE561ECB9D9DC77181207B1005FAE10CBDC5CB8250 "点击放大")
    

-   BGR转YUV
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ef/v3/xq8U7__lSU6NxdTL4gcxCA/zh-cn_formulaimage_0000002496568546.png?HW-CC-KV=V1&HW-CC-Date=20260313T012651Z&HW-CC-Expire=86400&HW-CC-Sign=A9DE4A932D6D74F3CF4C1851EEB990018FF29928AB2A318BF5DC8316EB0D4ABF "点击放大")
    

参考2：BT-601 narrow、JPEG和BT-709 narrow三种类型图片的转换公式。

-   BT-601 narrow
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3f/v3/iZBCDiXiSQSU6UYab1sMPw/zh-cn_formulaimage_0000002496888562.png?HW-CC-KV=V1&HW-CC-Date=20260313T012651Z&HW-CC-Expire=86400&HW-CC-Sign=A8A894B3EF9F490EA942ABB56D489FD3495E60D2F7FC15D6489C83543CAED8A4 "点击放大")
    
-   JPEG
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/85/v3/S5cJkwYJQBmZFHOjez7upA/zh-cn_formulaimage_0000002528408547.png?HW-CC-KV=V1&HW-CC-Date=20260313T012651Z&HW-CC-Expire=86400&HW-CC-Sign=97F8D5BFD69802AEB2068ED7028A687B5DF165462DB7792FB64A0CC0C7F1B4C3 "点击放大")
    
-   BT-709 narrow
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/48/v3/3Ctdscd7QJGj16GK8cW4Og/zh-cn_formulaimage_0000002528648533.png?HW-CC-KV=V1&HW-CC-Date=20260313T012651Z&HW-CC-Expire=86400&HW-CC-Sign=767945401B7D7FC4CB2285674F974B20BD105016E75D690603BFB98DEAD34341 "点击放大")
    

使用配置文件生成静态AIPP模型时，需要根据以上的公式配置CSC矩阵以及“input\_bias”或者“output\_bias”的值。使用IR定义AIPP CSC功能算子，以及使用CANN Kit接口配置CSC参数时，支持传入目标类型，由系统来填充CSC配置参数。

以下为JPEG和BT-601NARROW两种图片类型下的CSC配置参考。

-   输入为YUV格式图片(YUV420/YUYV/YUV422SP/AYUV444)，模型训练集为RGB，不支持从YUV400到RGB的转换。
    
    | JPEG | BT-601NARROW | BT-601FULL | BT-709NARROW |
    | --- | --- | --- | --- |
    | matrix_r0c0 : 256matrix_r0c1 : 0matrix_r0c2 : 359matrix_r1c0 : 256matrix_r1c1 : -88matrix_r1c2 : -183matrix_r2c0 : 256matrix_r2c1 : 454matrix_r2c2 : 0input_bias_0 : 0input_bias_1 : 128input_bias_2 : 128 | matrix_r0c0 : 298matrix_r0c1 : 0matrix_r0c2 : 409matrix_r1c0 : 298matrix_r1c1 : -100matrix_r1c2 : -208matrix_r2c0 : 298matrix_r2c1 : 516matrix_r2c2 : 0input_bias_0 : 16input_bias_1 : 128input_bias_2 : 128 | matrix_r0c0 : 256matrix_r0c1 : 0matrix_r0c2 : 359matrix_r1c0 : 256matrix_r1c1 : -88matrix_r1c2 : -183matrix_r2c0 : 256matrix_r2c1 : 454matrix_r2c2 : 0input_bias_0 : 0input_bias_1 : 128input_bias_2 : 128 | matrix_r0c0 : 298matrix_r0c1 : 0matrix_r0c2 : 460matrix_r1c0 : 298matrix_r1c1 : -55matrix_r1c2 : -137matrix_r2c0 : 298matrix_r2c1 : 541matrix_r2c2 : 0input_bias_0 : 16input_bias_1 : 128input_bias_2 : 128 |
    
-   输入为YUV格式图片(YUV420/YUYV/YUV422SP/AYUV444)，模型训练集为BGR，不支持从YUV400到BGR的转换。
    
    | JPEG | BT-601NARROW | BT-601FULL | BT-709NARROW |
    | --- | --- | --- | --- |
    | matrix_r0c0 : 256matrix_r0c1 : 454matrix_r0c2 : 0matrix_r1c0 : 256matrix_r1c1 : -88matrix_r1c2 : -183matrix_r2c0 : 256matrix_r2c1 : 0matrix_r2c2 : 359input_bias_0 : 0input_bias_1 : 128input_bias_2 : 128 | matrix_r0c0 : 298matrix_r0c1 : 516matrix_r0c2 : 0matrix_r1c0 : 298matrix_r1c1 : -100matrix_r1c2 : -208matrix_r2c0 : 298matrix_r2c1 : 0matrix_r2c2 : 409input_bias_0 : 16input_bias_1 : 128input_bias_2 : 128 | matrix_r0c0 : 256matrix_r0c1 : 454matrix_r0c2 : 0matrix_r1c0 : 256matrix_r1c1 : -88matrix_r1c2 : -183matrix_r2c0 : 256matrix_r2c1 : 0matrix_r2c2 : 359input_bias_0 : 0input_bias_1 : 128input_bias_2 : 128 | matrix_r0c0 : 298matrix_r0c1 : 541matrix_r0c2 : 0matrix_r1c0 : 298matrix_r1c1 : -55matrix_r1c2 : -137matrix_r2c0 : 298matrix_r2c1 : 0matrix_r2c2 : 460input_bias_0 : 16input_bias_1 : 128input_bias_2 : 128 |
    
-   输入为YUV格式图片(YUV420/YUYV/YUV422SP/AYUV444)，模型训练集为灰度图（YUV400\_U8）。
    
    | matrix_r0c0 : 256matrix_r0c1 : 0matrix_r0c2 : 0matrix_r1c0 : 0matrix_r1c1 : 0matrix_r1c2 : 0matrix_r2c0 : 0matrix_r2c1 : 0matrix_r2c2 : 0 |
    
-   输入为RGB格式图片(XRGB8888/ARGB8888)，模型训练集为灰度图（YUV400\_U8）。
    
    | matrix_r0c0 : 76matrix_r0c1 : 150matrix_r0c2 : 30matrix_r1c0 : 0matrix_r1c1 : 0matrix_r1c2 : 0matrix_r2c0 : 0matrix_r2c1 : 0matrix_r2c2 : 0 |
    
-   输入为RGB格式图片(XRGB8888/ARGB8888)，模型训练集为YUV444SP。
    
    | JPEG | BT-601NARROW | BT-601FULL | BT-709NARROW |
    | --- | --- | --- | --- |
    | matrix_r0c0 : 77matrix_r0c1 : 150matrix_r0c2 : 29matrix_r1c0 : -43matrix_r1c1 : -85matrix_r1c2 : 128matrix_r2c0 : 128matrix_r2c1 : -107matrix_r2c2 : -21output_bias_0 : 0output_bias_1 : 128output_bias_2 : 128 | matrix_r0c0 : 66matrix_r0c1 : 129matrix_r0c2 : 25matrix_r1c0 : -38matrix_r1c1 : -74matrix_r1c2 : 112matrix_r2c0 : 112matrix_r2c1 : -94matrix_r2c2 : -18output_bias_0 : 16output_bias_1 : 128output_bias_2 : 128 | matrix_r0c0 : 77matrix_r0c1 : 150matrix_r0c2 : 29matrix_r1c0 : -43matrix_r1c1 : -85matrix_r1c2 : 128matrix_r2c0 : 128matrix_r2c1 : -107matrix_r2c2 : -21output_bias_0 : 0output_bias_1 : 128output_bias_2 : 128 | matrix_r0c0 : 47matrix_r0c1 : 157matrix_r0c2 : 16matrix_r1c0 : -26matrix_r1c1 : -87matrix_r1c2 : 112matrix_r2c0 : 112matrix_r2c1 : -102matrix_r2c2 : -10output_bias_0 : 16output_bias_1 : 128output_bias_2 : 128 |
    
-   输入为RGB格式图片(XRGB8888/ARGB8888)，模型训练集为YVU444SP。
    
    | JPEG | BT-601NARROW | BT-601FULL | BT-709NARROW |
    | --- | --- | --- | --- |
    | matrix_r0c0 : 77matrix_r0c1 : 150matrix_r0c2 : 29matrix_r1c0 : 128matrix_r1c1 : -107matrix_r1c2 : -21matrix_r2c0 : -43matrix_r2c1 : -85matrix_r2c2 : 128output_bias_0 : 0output_bias_1 : 128output_bias_2 : 128 | matrix_r0c0 : 66matrix_r0c1 : 129matrix_r0c2 : 25matrix_r1c0 : 112matrix_r1c1 : -94matrix_r1c2 : -18matrix_r2c0 : -38matrix_r2c1 : -74matrix_r2c2 : 112output_bias_0 : 16output_bias_1 : 128output_bias_2 : 128 | matrix_r0c0 : 77matrix_r0c1 : 150matrix_r0c2 : 29matrix_r1c0 : 128matrix_r1c1 : -107matrix_r1c2 : -21matrix_r2c0 : -43matrix_r2c1 : -85matrix_r2c2 : 128output_bias_0 : 0output_bias_1 : 128output_bias_2 : 128 | matrix_r0c0 : 47matrix_r0c1 : 157matrix_r0c2 : 16matrix_r1c0 : 112matrix_r1c1 : -102matrix_r1c2 : -10matrix_r2c0 : -26matrix_r2c1 : -87matrix_r2c2 : 112output_bias_0 : 16output_bias_1 : 128output_bias_2 : 128 |
    

说明

从使用的角度，将灰度图转成RGB没有意义，系统约束当输入格式配置为YUV400\_U8时，不支持CSC。

### Resize

图片缩放参数及约束如下：

| 名称 | 描述 | 取值范围（静态） | 取值范围（动态） |
| --- | --- | --- | --- |
| switch | 缩放使能开关 | false/true | false/true |
| resize_input_w | 缩放前图像宽度 | [16, 4096] | [16, 1280] |
| resize_input_h | 缩放前图像高度 | [16, 4096] | [16, 4096] |
| resize_output_w | 缩放后图像宽度 | [16, 1280] | [16, 448] |
| resize_output_h | 缩放后图像高度 | [16, 4096] | [16, 4096] |

图片缩放倍数约束如下：

| 名称 | 描述 | 范围（动态&静态） |
| --- | --- | --- |
| resize_output_w / resize_input_w | 图像宽度缩放倍数 | [1/16, 16] |
| resize_output_h / resize_input_h | 图像高度缩放倍数 | [1/16, 16] |

Resize类型为双线性插值。Resize子功能的“resize\_input\_w”和“resize\_input\_h”两个参数对开发者不可见。

-   当Crop功能关闭时，图片缩放前的大小取输入图片的大小。
-   当Crop功能打开时，因为AIPP的Resize处理总是在Crop之后，图片缩放前的大小取图片裁剪后的大小。配置时，只需要关心缩放后的大小即可。

通过配置文件转换静态AIPP模型时，Crop之后的大小“crop\_size\_w”和“crop\_size\_h”，以及Resize之后的大小“resize\_output\_w”和“resize\_output\_h”可以省去不配置，前提是这两个参数可以通过计算获取。省略“resize\_output\_w”和“resize\_output\_h”时，Resize功能这两个值取模型训练集的图片尺寸减去AIPP Padding之后的结果；当Resize不使用时，同理可省略Crop功能“crop\_size\_w”和“crop\_size\_h”。

### Data Type Conversion

数据类型转换（Data Type Conversion，以下简称DTC），DTC用于将输入图片中像素值转换为模型训练时的数据类型。AIPP允许开发者设置DTC参数，使得转换之后的数据在一个预期的范围，避免强制转换。

将Uint8类型的数据转换为Int8类型的数据，计算规则如下：

pixel\_out\_chx(i) = pixel\_in\_chx(i)-mean\_chn\_i

将Uint8类型的数据转换为Float16类型的数据，计算规则如下：

pixel\_out\_chx(i) = \[pixel\_in\_chx(i)-mean\_chn\_i-min\_chn\_i\] \* var\_reci\_chn

DTC涉及的配置参数如下表。

| 名称 | 描述 | 取值范围 |
| --- | --- | --- |
| switch | DTC使能开关。 | false/true |
| mean_chn_0 | 通道0均值。 | [0, 255] |
| mean_chn_1 | 通道1均值。 | [0, 255] |
| mean_chn_2 | 通道2均值。 | [0, 255] |
| mean_chn_3 | 通道3均值。 | [0, 255] |
| min_chn_0 | 通道0最小值。 | [-65504, 65504] |
| min_chn_1 | 通道1最小值。 | [-65504, 65504] |
| min_chn_2 | 通道2最小值。 | [-65504, 65504] |
| min_chn_3 | 通道3最小值。 | [-65504, 65504] |
| var_reci_chn_0 | 通道0方差。 | [-65504, 65504] |
| var_reci_chn_1 | 通道1方差。 | [-65504, 65504] |
| var_reci_chn_2 | 通道2方差。 | [-65504, 65504] |
| var_reci_chn_3 | 通道3方差。 | [-65504, 65504] |

说明

当DTC开关为false时，或者开发者调用CANN Kit接口未传入DTC参数时，系统默认对图片输入数据进行类型强转，效果同通道均值和最小值均为0，通道方差为1。

### Rotation

AIPP的Rotation功能用于对输入图片进行旋转，涉及的参数如下：

| 名称 | 描述 | 取值范围 |
| --- | --- | --- |
| switch | Rotation使能开关 | false/true |
| rotation_angle | 图像旋转角度 | [0, 90, 180, 270] |

### Padding

AIPP的Padding功能用于对输入图片进行补边，涉及的参数如下。

| 名称 | 描述 | 取值范围 |
| --- | --- | --- |
| switch | Padding使能开关。 | false/true |
| left_padding_size | 图像左侧Padding像素数。 | - |
| right_padding_size | 图像右侧Padding像素数。 | - |
| top_padding_size | 图像上侧Padding像素数。 | - |
| bottom_padding_size | 图像下侧Padding像素数。 | - |
| padding_value_chn_0 | 通道0 Padding的值。 | [-65504, 65504] |
| padding_value_chn_1 | 通道1 Padding的值。 | [-65504, 65504] |
| padding_value_chn_2 | 通道2 Padding的值。 | [-65504, 65504] |
| padding_value_chn_3 | 通道3 Padding的值。 | [-65504, 65504] |

说明

-   上下左右的Padding值不要超过32，如果Padding值过大，AIPP将使用软件代码进行处理，效率低于硬件实现。
-   padding\_value\_chn\_0~padding\_value\_chn\_3暂不支持。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-aipp-parameters*