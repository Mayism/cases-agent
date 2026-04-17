---
title: 如何将相册选择的图片生成PixelMap
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-image-6
category: FAQ
updated_at: 2026-03-13T05:10:04.879Z
---

# 如何将相册选择的图片生成PixelMap

方法一：

1.  创建图库选择器实例，调用select()接口拉起photoPicker界面选择图片。选择成功后，返回PhotoSelectResult结果集。
2.  通过photoAccessHelper模块的getAssets接口获取媒体文件的URI。
3.  调用getThumbnail获取缩略图。

参考代码如下：

```typescript
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { dataSharePredicates } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';
const context = AppStorage.get("context") as common.UIAbilityContext;
@Entry
@Component
struct WebComponent {
  build() {
    Column() {
      Button('选择图片').onClick(() => {
        try {
          let uris: Array<string> = [];
          let PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
          PhotoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
          PhotoSelectOptions.maxSelectNumber = 1;
          let photoPicker = new photoAccessHelper.PhotoViewPicker();
          photoPicker.select(PhotoSelectOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
            console.info('photoPicker.select successfully, PhotoSelectResult uri: ' + JSON.stringify(PhotoSelectResult));
            uris = PhotoSelectResult.photoUris;
            let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
            let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
            // Configure query conditions, use PhotoViewPicker to select the URI of the image to be queried
            predicates.equalTo('uri', uris[0]);
            let fetchOptions: photoAccessHelper.FetchOptions = {
              fetchColumns: [],
              predicates: predicates
            };
            phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
              if (fetchResult !== undefined) {
                console.info('fetchResult success');
                let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                if (photoAsset !== undefined) {
                  // Get Thumbnail
                  photoAsset.getThumbnail((err, pixelMap) => {
                    if (err == undefined) {
                      console.info('getThumbnail successful ' + JSON.stringify(pixelMap));
                    } else {
                      console.error('getThumbnail fail', err);
                    }
                  });
                  console.info('photoAsset.displayName : ' + photoAsset.displayName);
                }
              } else {
                console.error(`fetchResult fail with error: ${err.code}, ${err.message}`);
              }
            });
          }).catch((err: BusinessError) => {
            console.error('photoPicker.select failed with err: ' + JSON.stringify(err));
          });
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.error('photoPicker failed with err: ' + JSON.stringify(err));
        }
      })
    }
  }
}
```

[SelectedAlbumPictureGeneratePixelMap\_One.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ImageKit/entry/src/main/ets/pages/SelectedAlbumPictureGeneratePixelMap_One.ets#L21-L79)

方法二：

1\. 创建图库选择器实例，调用select()接口拉起photoPicker界面进行图片选择。图片选择成功后，返回PhotoSelectResult结果集。

1.  待界面从图库返回后，使用 fs.openSync 接口通过 URI 打开文件并获取文件描述符（fd）。注意，接口的权限参数应设置为 fs.OpenMode.READ\_ONLY。
2.  通过 image 使用 image.createImageSource 接口创建图片源实例。
3.  根据 imageSource 创建 pixelMap。

参考代码如下：

```typescript
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import { fileIo } from '@kit.CoreFileKit';
@Entry
@Component
struct WebComponent {
  build() {
    Column() {
      Button('Select Picture').onClick(() => {
        try {
          let uris: Array<string> = [];
          let PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
          PhotoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
          PhotoSelectOptions.maxSelectNumber = 1;
          let photoPicker = new photoAccessHelper.PhotoViewPicker();
          photoPicker.select(PhotoSelectOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
            uris = PhotoSelectResult.photoUris;
            let file = fileIo.openSync(uris[0], fileIo.OpenMode.READ_ONLY);
            console.info('file fd: ' + file.fd);
            let buffer = new ArrayBuffer(4096);
            let readLen = fileIo.readSync(file.fd, buffer);
            console.info('readSync data to file succeed and buffer size is:' + readLen);
            const imageSource: image.ImageSource = image.createImageSource(file.fd);
            let decodingOptions: image.DecodingOptions = {
              editable: true,
              desiredPixelFormat: 3,
            }
            imageSource.createPixelMap(decodingOptions, (err: BusinessError, pixelMap: image.PixelMap) => {
              if (err !== undefined) {
                console.error(`Failed to create pixelMap.code is ${err.code},message is ${err.message}`);
              } else {
                console.info('Succeeded in creating pixelMap object.');
              }
            })
          }).catch((err: BusinessError) => {
            console.error(`Invoke photoPicker.select failed, code is ${err.code}, message is ${err.message}`);
          })
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.error('photoPicker failed with err: ' + JSON.stringify(err));
        }
      })
    }
  }
}
```

[SelectedAlbumPictureGeneratePixelMap\_Two.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ImageKit/entry/src/main/ets/pages/SelectedAlbumPictureGeneratePixelMap_Two.ets#L21-L67)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-image-6*