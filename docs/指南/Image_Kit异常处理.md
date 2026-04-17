---
title: Image Kit异常处理
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/image-error-faq
category: 指南
updated_at: 2026-03-24T10:59:09.894Z
---

# Image Kit异常处理

[Image Kit](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/image-overview)提供**ArkTS接口**和**C接口**。在遇到特殊情况时（例如输入参数无效、内存不足或函数无法处理请求等），系统会通过异常（ArkTS）或错误码（C接口）来反馈错误。开发者需要在应用层合理捕获和处理这些错误，以避免应用崩溃或出现未定义行为。在[Image错误码](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/errorcode-image)中给出了Image Kit错误码对应的错误信息、可能原因、处理步骤。但由于部分场景引发错误的原因较为复杂，还需要开发者结合日志进一步定位。例如：401参数错误，可能是函数入参存在问题，也可能是由于缺少特定的文件读写权限导致无法访问或修改图片文件（Image Kit不感知权限，表现为传入文件异常的参数错误）。

## ArkTS接口异常处理

ArkTS接口调用时，如果传入的参数不符合要求，或者底层执行过程中出现不可恢复的错误，系统会返回或抛出[BusinessError](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-base#businesserror)异常，又或者在异步场景中返回一个[Promise](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/async-concurrency-overview#promise)的rejected状态。如果开发者忽略了异常处理，可能会出现功能问题或数据丢失，甚至直接导致应用崩溃。

典型的ArkTS接口形态及API示例和处理方法如下所示。

| 接口形态 | 示例API | 处理方式 |
| --- | --- | --- |
| Promise异步接口 | getImageInfo(): Promise<ImageInfo>、modifyImageProperty(key: PropertyKey, value: string): Promise<void> | 使用await+try/catch，或promise.catch捕获BusinessError。 |
| AsyncCallback异步接口 | getImageInfo(callback: AsyncCallback<ImageInfo>): void | [AsyncCallback](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-base#asynccallback) |
| 同步接口 | getImageInfoSync(): ImageInfo | 使用try/catch捕获同步BusinessError。 |

1.  AsyncCallback异步接口示例。
    
    ```typescript
    import { image } from '@kit.ImageKit';
    import { BusinessError } from '@kit.BasicServicesKit';
    function getImageInfoByCallback(pixelMap: image.PixelMap): void {
      if (!pixelMap) {
        console.error("pixelMap is null or undefined");
        return;
      }
      pixelMap.getImageInfo((err: BusinessError, info: image.ImageInfo) => {
        if (err) {
          console.error(\`getImageInfo callback failed, code=${err.code}, msg=${err.message}\`);
          return;
        }
        console.info(\`Image width=${info.size.width}, height=${info.size.height}\`);
      });
    }
    ```
    
2.  Promise异步接口示例。
    
    ```typescript
    import { image } from '@kit.ImageKit';
    import { BusinessError } from '@kit.BasicServicesKit';
    // getImageInfo(): Promise<ImageInfo>
    async function getImageInfoByPromise(pixelMap: image.PixelMap): Promise<void> {
      try {
        const info = await pixelMap.getImageInfo();
        console.info(\`Image width=${info.size.width}, height=${info.size.height}\`);
      } catch (err) {
        const e = err as BusinessError;
        console.error(\`getImageInfo promise failed, code=${e.code}, msg=${e.message}\`);
      }
    }
    // modifyImageProperty(key: PropertyKey, value: string): Promise<void>
    function modifyImagePropertyPromise(imageSource: image.ImageSource): void {
      imageSource.modifyImageProperty(image.PropertyKey.ORIENTATION, 'Top-left').then(() => {
        console.info('modifyImageProperty success');
      }).catch((err: BusinessError) => {
        console.error(\`modifyImageProperty failed, code=${err.code}, msg=${err.message}\`);
      });
    }
    ```
    
3.  同步型示例。
    
    ```typescript
    import { image } from '@kit.ImageKit';
    import { BusinessError } from '@kit.BasicServicesKit';
    function getImageInfoBySync(pixelMap: image.PixelMap): void {
      try {
        const info = pixelMap.getImageInfoSync();
        console.info(\`Image width=${info.size.width}, height=${info.size.height}\`);
      } catch (err) {
        const e = err as BusinessError;
        console.error(\`getImageInfoSync failed, code=${e.code}, msg=${e.message}\`);
      }
    }
    ```
    

## C接口异常处理

C接口统一通过[Image错误码](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/errorcode-image)来表示函数执行结果。返回IMAGE\_SUCCESS（0）表示执行成功，返回非零值表示发生错误。开发者应在调用后立即检查返回值，并进行必要的错误处理，如日志记录、资源释放等。C接口异常处理的典型示例如下所示。

1.  通过ImageInfo获取图像信息。
    
    Image\_ErrorCode OH\_PixelmapNative\_GetImageInfo(OH\_PixelmapNative \*pixelmap, OH\_Pixelmap\_ImageInfo \*imageInfo)
    
    ```cpp
    // 需要在src/main/cpp/CMakeLists.txt文件中链接so库文件：target\_link\_libraries(entry PUBLIC libhilog\_ndk.z.so libpixelmap.so)。
    #include <hilog/log.h>
    #include <multimedia/image\_framework/image/pixelmap\_native.h>
    #undef LOG\_DOMAIN
    #undef LOG\_TAG
    #define LOG\_DOMAIN 0x02b6
    #define LOG\_TAG "ImageKitDemo"
    void GetImageInfoExample(OH\_PixelmapNative \*pixelmap) {
        if (!pixelmap) {
            OH\_LOG\_ERROR(LOG\_APP, "GetImageInfoExample: pixelmap is nullptr");
            return;
        }
        OH\_Pixelmap\_ImageInfo \*imageInfo;
        Image\_ErrorCode errCode = OH\_PixelmapImageInfo\_Create(&imageInfo);
        if (errCode != IMAGE\_SUCCESS) {
            OH\_LOG\_ERROR(LOG\_APP, "OH\_PixelmapNative\_Create failed, errCode: %{public}d.", errCode);
            return;
        }
        OH\_PixelmapNative\_GetImageInfo(pixelmap, imageInfo);
        if (errCode != IMAGE\_SUCCESS) {
            OH\_LOG\_ERROR(LOG\_APP, "OH\_PixelmapNative\_GetImageInfo failed, errCode: %{public}d.", errCode);
            return;
        }
        // 获取图片的宽、高、像素格式和透明度等信息。
        uint32\_t width, height, rowStride;
        int32\_t pixelFormat, alphaType;
        OH\_PixelmapImageInfo\_GetWidth(imageInfo, &width);
        OH\_PixelmapImageInfo\_GetHeight(imageInfo, &height);
        OH\_PixelmapImageInfo\_GetRowStride(imageInfo, &rowStride);
        OH\_PixelmapImageInfo\_GetPixelFormat(imageInfo, &pixelFormat);
        OH\_PixelmapImageInfo\_GetAlphaType(imageInfo, &alphaType);
        OH\_PixelmapImageInfo\_Release(imageInfo);
        OH\_LOG\_INFO(LOG\_APP,
                    "GetImageInfo success, width: %{public}d, height: %{public}d, "
                    "rowStride: %{public}d, pixelFormat: %{public}d, alphaType: %{public}d.",
                    width, height, rowStride, pixelFormat, alphaType);
    }
    ```
    
2.  修改EXIF信息。
    
    Image\_ErrorCode OH\_ImageSourceNative\_ModifyImageProperty(OH\_ImageSourceNative \*source, Image\_String \*key, Image\_String \*value)
    
    ```cpp
    // 需要在src/main/cpp/CMakeLists.txt文件中链接so库文件：target\_link\_libraries(entry PUBLIC libhilog\_ndk.z.so libimage\_source.so)。
    #include <string>
    #include <hilog/log.h>
    #include <multimedia/image\_framework/image/image\_source\_native.h>
    #undef LOG\_DOMAIN
    #undef LOG\_TAG
    #define LOG\_DOMAIN 0x02b6
    #define LOG\_TAG "ImageKitDemo"
    void ModifyImagePropertyExample(OH\_ImageSourceNative \*source) {
        if (!source) {
            OH\_LOG\_ERROR(LOG\_APP, "ModifyImagePropertyExample: source is nullptr");
            return;
        }
        const std::string keyStr = OHOS\_IMAGE\_PROPERTY\_ORIENTATION;
        const std::string valueStr = "Top-left";
        Image\_String key{const\_cast<char \*>(keyStr.c\_str()), keyStr.length()};
        Image\_String value{const\_cast<char \*>(valueStr.c\_str()), valueStr.length()};
        Image\_ErrorCode ret = OH\_ImageSourceNative\_ModifyImageProperty(source, &key, &value);
        if (ret != IMAGE\_SUCCESS) {
            OH\_LOG\_ERROR(LOG\_APP, "ModifyImageProperty failed, code=%{public}d", ret);
            return;
        }
        OH\_LOG\_INFO(LOG\_APP, "ModifyImageProperty success, key=%{public}s, value=%{public}s", keyStr.c\_str(),
                    valueStr.c\_str());
    }
    ```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/image-error-faq*