---
title: 使用命令行CMake构建NDK工程
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/build-with-ndk-cmake
category: 指南
updated_at: 2026-03-13T03:33:59.529Z
---

# 使用命令行CMake构建NDK工程

在很多复杂应用工程中，C++代码工程是通过CMake等构建系统以命令行方式来编译构建的，接下来介绍如何把已有的CMake工程切换到HarmonyOS工具链中，从而使用命令行CMake构建该工程。

## 获取NDK开发包

1.  通过下载command line tools获取NDK开发包。
    
    先下载command line tools并解压完成，NDK开发相关工具位于$command line tools解压目录/sdk/default/openharmony/native路径下。
    
2.  通过安装DevEco Studio获取NDK开发包。
    
    先下载并安装完成DevEco Studio，NDK开发相关工具位于$DevEco Studio安装目录/sdk/default/openharmony/native路径下。
    

### 配置环境变量

如果只是在DevEco Studio中使用，跳过以下步骤：

1.  将NDK自带的CMake编译工具添加到环境变量中。
    
    -   配置 linux 系统下环境变量
        
        ```shell
        # 打开.bashrc文件
        vim ~/.bashrc
        # 在文件最后添加cmake路径，该路径是自己的放置文件的路径，之后保存退出
        export PATH=${实际SDK路径}/native/build-tools/cmake/bin:$PATH
        # 在命令行执行source ~/.bashrc使环境变量生效
        source ~/.bashrc
        ```
        
    -   配置 mac 系统下环境变量
        
        ```shell
        #在当前用户目录下，打开 .bash_profile 文件，文件如果不存在，创建即可
        vim ~/.bash_profile
        #在文件最后添加 cmake 路径，该路径是自己的放置文件的路径，之后保存退出
        export PATH=${实际SDK路径}/native/build-tools/cmake/bin:$PATH
        #在命令行执行 source ~/.bash_profile 使环境变量生效
        source ~/.bash_profile
        ```
        
    -   配置 windows 下的环境变量
        
        右键点击我的电脑，在下拉框中选择【属性】，然后点击【高级系统设置】，进入【环境变量】，找到【Path】并点击【编辑】，接着点击【新建】添加路径，保存后退出。最后打开cmd（若下一步不能够实现，请重启电脑尝试）。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/df/v3/-8AUR7qBQASGfuYQIQtzvg/zh-cn_image_0000002558537003.png?HW-CC-KV=V1&HW-CC-Date=20260313T033019Z&HW-CC-Expire=86400&HW-CC-Sign=ADB44F3B8922720B2071AF930C998935182897B3597CA7677E57CDA8A7B997F1)
        
        打开命令框，输入cmake.exe -version，命令行正确回显cmake的版本号，说明环境变量配置完成。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/56/v3/SK8ZyBYsTDO-uGZ-kFuwNw/zh-cn_image_0000002527217272.png?HW-CC-KV=V1&HW-CC-Date=20260313T033019Z&HW-CC-Expire=86400&HW-CC-Sign=F219EE47CADB909D69A7195FC408E3DE66D858C9F14136ACB81CD770FAFB917D)
        
2.  查看CMake默认路径。
    
    -   linux 和 mac 系统环境下
        
        ```shell
        #在命令行输入which命令查询当前CMake所在路径
        which cmake
        #结果路径与.bashrc中设置一致
        ~/ohos-sdk/ohos-sdk/linux/native/build-tools/cmake/bin/cmake
        ```
        
    -   windows 系统环境下，cmake 安装路径为自己所配置的环境变量路径
        
        通过 我的电脑->高级系统设置->环境变量->在 Path 对象中查看
        

## 使用NDK开发包编译Native程序

应用开发者可以通过NDK开发包快速开发出Native动态库、静态库与可执行文件。NDK开发包提供CMake编译构建工具脚本，下面通过编写一个C/C++ demo工程来演示适配过程。

### demo工程内容

下面是一个CMake的demo工程内容，此工程包含两个目录，include目录包含此库的头文件，src目录包含全部源码；src目录包含两个文件，sum.cpp的算法文件，以及hello.cpp的调用算法的主入口文件，目标是编译成一个可执行程序，以及一个算法动态库。

**demo目录图**

```plaintext
demo
  ├── CMakeLists.txt
  ├── include
       └── sum.h
  └── src
       ├── CMakeLists.txt
       ├── sum.cpp
       └── hello.cpp
```

**根目录CMakeLists.txt内容**

```plaintext
# 指定CMake的最小版本
CMAKE_MINIMUM_REQUIRED(VERSION 3.16)
# 工程名称，这里我们就叫HELLO
PROJECT(HELLO)
#添加一个子目录并构建该子目录。
ADD_SUBDIRECTORY(src)
```

**内部CMakeLists.txt内容**

```plaintext
SET(LIBHELLO_SRC hello.cpp)
# 设置编译参数
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0")
# 设置链接参数，具体参数可以忽略，纯粹为了举例
SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--emit-relocs --verbose")
# 添加一个libsum动态库目标，编译成功会生成一个libsum.so
ADD_LIBRARY(sum SHARED sum.cpp)
# 生成可执行程序，添加一个Hello的可执行程序目标，编译成功会生成一个Hello可执行程序
ADD_EXECUTABLE(Hello ${LIBHELLO_SRC})
# 指定Hello目标include目录路径
TARGET_INCLUDE_DIRECTORIES(Hello PUBLIC ../include)
# 指定Hello目标需要链接的库名字
TARGET_LINK_LIBRARIES(Hello PUBLIC sum)
```

**源码内容**

hello.cpp源码

```cangjie
#include <iostream>
#include "sum.h"
int main(int argc,const char **argv)
{
    std::cout<< "hello world!" <<std::endl;
    int total = sum(1, 100);
    std::cout<< "Sum 1 + 100=" << total << std::endl;
    return 0;
}
```

sum.h源码

```cpp
int sum(int a, int b);
```

sum.cpp源码

```cpp
#include <iostream>
int sum(int a, int b)
{
    return a + b;
}
```

### 编译构建demo工程

**linux 和 mac 系统环境下**

在工程目录的模块目录下，创建build目录，用来放置CMake构建时产生的中间文件。注意: ohos-sdk是下载下来的SDK的根目录，开发者需要自行替换成实际的下载目录。

1.  采用OHOS\_STL=c++\_shared动态链接c++库方式构建工程，如不指定，默认采用c++\_shared；DOHOS\_ARCH参数可根据系统架构来决定具体值，例如当DOHOS\_ARCH=armeabi-v7a会编译32位动态库，而当DOHOS\_ARCH=arm64-v8a会编译64位动态库。
    
    ```shell
     >mkdir build && cd build
     >cmake -D OHOS_STL=c++_shared -D OHOS_ARCH=arm64-v8a -D OHOS_PLATFORM=OHOS -D CMAKE_TOOLCHAIN_FILE={ohos-sdk}/linux/native/build/cmake/ohos.toolchain.cmake ..
     >cmake --build .
    ```
    
2.  采用OHOS\_STL=c++\_static静态链接c++库方式构建工程，当DOHOS\_ARCH=armeabi-v7a会编译32位静态库，而当DOHOS\_ARCH=arm64-v8a会编译64位静态库。
    
    ```shell
     >mkdir build && cd build
     >cmake -D OHOS_STL=c++_static -D OHOS_ARCH=arm64-v8a -D OHOS_PLATFORM=OHOS -D CMAKE_TOOLCHAIN_FILE={ohos-sdk}/linux/native/build/cmake/ohos.toolchain.cmake ..
     >cmake --build .
    ```
    
    命令中，OHOS\_ARCH与OHOS\_PLATFORM两个变量最终会生成clang++的--target命令参数，在此例子中就是--target=arm-linux-ohos 和--march=armv7a两个参数。
    
    CMAKE\_TOOLCHAIN\_FILE指定了toolchain文件，在此文件中默认给clang++设置了--sysroot={ndk\_sysroot目录}，告诉编译器查找系统头文件的根目录。
    

注意

动态链接在运行时加载库文件，能有效节省磁盘空间和内存，但也增加运行时加载开销，略微影响启动性能。静态链接则将库代码直接嵌入可执行文件，启动快，但生成的文件体积更大，适合对启动性能敏感或运行环境受限的场景，不适用于对磁盘空间敏感的应用或设备。

**windows系统环境下**

在windows下使用cmake进行编译，与linux下不同的是，使用cmake要加入参数 -G 选择使用的生成器，直接回车会列出下面的生成器。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ba/v3/_K3qUmYOQDy7qBYV2eZriA/zh-cn_image_0000002558377107.png?HW-CC-KV=V1&HW-CC-Date=20260313T033019Z&HW-CC-Expire=86400&HW-CC-Sign=0C989620AD5EC9AF5B542C9FE1E4BC7282EA8371109BE1ADBE48DDBF4BCAD448)

这里使用的是cmake .. -G "Ninja" 引号里面跟的参数就是上图查看的环境所支持的生成器，这里ndk中自带的生成器是Ninja。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9e/v3/11deWanCRL6JqJ6qP9f-eQ/zh-cn_image_0000002527377226.png?HW-CC-KV=V1&HW-CC-Date=20260313T033019Z&HW-CC-Expire=86400&HW-CC-Sign=D39F8202813D28B6A70154B429446A745F4DFAAEA6B579779CF561EA61C913DD)

Step 1. 同样在工程目录的模块目录下创建 build 文件夹，进入build目录并执行以下指令：

```shell
 F:\windows\native\build-tools\cmake\bin\cmake.exe -G "Ninja" -D OHOS_STL=c++_shared -D OHOS_ARCH=arm64-v8a -D OHOS_PLATFORM=OHOS -D CMAKE_TOOLCHAIN_FILE=F:\windows\native\build\cmake\ohos.toolchain.cmake ..
```

注意

如需debug调试，增加参数 -D CMAKE\_BUILD\_TYPE=Debug；cmake路径和编译工具链ohos.toolchain.cmake路径都是下载好的ndk路径。

执行结果如下图：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/46/v3/t1TXbM4TThuOub0EwaeRDw/zh-cn_image_0000002558537005.png?HW-CC-KV=V1&HW-CC-Date=20260313T033019Z&HW-CC-Expire=86400&HW-CC-Sign=D8F8B18E096D00668B9EA560877C072CD0D6ABDECF1143E06EFB8F36C6693C1A)

这里生成的build.ninja文件就是我们需要的 。

Step 2. 让我们用ninja指令来编译生成目标文件，其位置如下图所示：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cc/v3/1Z6vKLQNTQqpcXdKbxAjyg/zh-cn_image_0000002527217274.png?HW-CC-KV=V1&HW-CC-Date=20260313T033019Z&HW-CC-Expire=86400&HW-CC-Sign=5C2040F43CC12E6CFB87EA5AF56A655FCCA84384383481857F3E970A5E66ACC7)

ninja -f build.ninja 或者用 cmake --build . 执行结果如下：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8b/v3/VA8z1CLLS8mpqGIUhGFsqg/zh-cn_image_0000002558377109.png?HW-CC-KV=V1&HW-CC-Date=20260313T033019Z&HW-CC-Expire=86400&HW-CC-Sign=6B76BBA717D7658C9E4D61ACDA80301F5113F7B6CB6BEF8EBAE34727C7795013)

编译生成的可执行文件位于创建的build目录下的src目录中。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/build-with-ndk-cmake*