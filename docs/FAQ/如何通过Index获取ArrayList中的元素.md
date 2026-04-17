---
title: 如何通过Index获取ArrayList中的元素
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-85
category: FAQ
updated_at: 2026-03-13T03:02:39.487Z
---

# 如何通过Index获取ArrayList中的元素

-   方式一：
    
    JS语法基础中可以通过数组元素的下标直接访问数组中的对象。示例如下：
    
    ```typescript
    import { ArrayList } from '@kit.ArkTS';
    let arrayList: ArrayList<number> = new ArrayList();
    arrayList.add(0);
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add(3);
    arrayList.add(4);
    arrayList.add(5);
    arrayList.add(6);
    arrayList.add(7);
    arrayList.add(8);
    arrayList.add(9);
    @Entry
    @Component
    struct Index {
      @State message: string = 'get arrayList value';
      build() {
        Row() {
          Column() {
            Button(this.message)
              .onClick(() => {
                console.info('arrayList\[6\]:', arrayList\[6\]);
              })
          }
          .width('100%')
        }
        .height('100%')
      }
    }
    ```
    
    [ArrayList1.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/ArrayList1.ets#L21-L52)
    
-   方式二：
    
    使用[subArrayList](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-arraylist#subarraylist)，subArrayList可以截取ArrayList中的一段元素，并返回这一段ArrayList实例。示例如下：
    
    ```typescript
    import { ArrayList } from '@kit.ArkTS';
    let arrayList: ArrayList<number> = new ArrayList();
    arrayList.add(0);
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add(3);
    arrayList.add(4);
    arrayList.add(5);
    arrayList.add(6);
    arrayList.add(7);
    arrayList.add(8);
    arrayList.add(9);
    let result: ArrayList<number> = arrayList.subArrayList(2, 4);
    @Entry
    @Component
    struct Index {
      @State message: string = 'subArrayList result';
      build() {
        Row() {
          Column() {
            Button(this.message)
              .onClick(() => {
                console.info('subArrayList result:', JSON.stringify(result)); // subArrayList result {"0":"2","1":"3"}
              })
          }
          .width('100%')
        }
        .height('100%')
      }
    }
    ```
    
    [ArrayList2.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/ArrayList2.ets#L21-L54)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-85*