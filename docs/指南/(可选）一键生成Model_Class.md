---
title: (可选）一键生成Model Class
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/agc-harmonyos-clouddev-modelclass
category: 指南
updated_at: 2026-03-13T04:05:04.159Z
---

# (可选）一键生成Model Class

云数据库支持从端侧或者云侧云函数（含云对象）访问云数据库，代码涉及调用云数据库时，需引入对应云数据库对象类型的Model Class。当前支持为对象类型一键生成Server Model与Client Model，供您在端侧及云侧云函数（含云对象）开发时引用。

## 生成Server Model

1.  右击需要调用的对象类型文件（以“Post.json”为例），选择“Generate Server Model”。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/43/v3/3Maf_L0sScaJSrLGnB6SqA/zh-cn_image_0000002214704509.png?HW-CC-KV=V1&HW-CC-Date=20260313T040423Z&HW-CC-Expire=86400&HW-CC-Sign=D711D4E77C059EB16579B8D9FF9992927A828BF0B67E1CE0DA2B3A9A5B4283DC)
    
2.  选择生成的Server Model文件存放的云函数（或云对象）目录，以“id-generator”为例。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0/v3/jKg9xSQSSu-p3ECXsbp0lA/zh-cn_image_0000002214704513.png?HW-CC-KV=V1&HW-CC-Date=20260313T040423Z&HW-CC-Expire=86400&HW-CC-Sign=E6B53DD3523290CCB3F7E3C50CB225CB107943997EF48C4350BB4B095DDD4EB7)
    
3.  点击“OK”。
    
    指定目录下生成对应对象类型的Server Model文件，后续您便可以在代码中方便地引用该Server Model 。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ac/v3/R_fcdwSDRQyPZAbf21PQtQ/zh-cn_image_0000002179498268.png?HW-CC-KV=V1&HW-CC-Date=20260313T040423Z&HW-CC-Expire=86400&HW-CC-Sign=A7801E164EFBCDDC952280A6685A99DBAEEAE8DC385616C0F02AEE7145118030)
    
4.  在云对象“id-generator”目录的package.json文件中引入@hw-agconnect/cloud-server依赖。
    
    ```typescript
    "dependencies": {
      "@hw-agconnect/cloud-server": "latest"
    }
    ```
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/96/v3/T-ehDxI4RRelkBL_F6J2OA/zh-cn_image_0000002308906729.png?HW-CC-KV=V1&HW-CC-Date=20260313T040423Z&HW-CC-Expire=86400&HW-CC-Sign=4771451D5BE5710188809311238F3A86953979819B905AA6143B794CDA4C22E1)
    
5.  在云对象文件idGenerator.ts中添加如下代码，实现云函数访问云数据库。
    
    ```javascript
    import { cloud } from '@hw-agconnect/cloud-server';
    import { Post } from './Post'; // Post是Server Model
    // Demo是Post对象类型使用的存储区名
    const collection = cloud.database({ zoneName: 'Demo' }).collection(Post);
    // IdGenerator云对象，实现了对Post对象类型的查询和更新
    export class IdGenerator {
      query() {
        return collection.query().get();
      }
      upsert(posts: Post[]) {
        return new Promise((resolve, reject) => {
          collection.upsert(posts.map(post => Post.parseFrom(post)))
            .then(result => resolve({ result }))
            .catch(err => reject(err))
        });
      }
    }
    ```
    
    注意
    
    如果定义的云数据库表字段中包含ByteArray或Date类型的字段，在插入或者更新云数据库时需要使用Server Model的parseFrom方法将入参转化成API识别的类型，例如上述示例中的Post.parseFrom方法。
    

## 生成Client Model

1.  右击需要调用的对象类型文件（以“Post.json”为例），选择“Generate Client Model”。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/19/v3/aIcySHFyQwaO79K0i7i_sg/zh-cn_image_0000002214858901.png?HW-CC-KV=V1&HW-CC-Date=20260313T040423Z&HW-CC-Expire=86400&HW-CC-Sign=8FA9A46464C1DE9F3392D06BD681693C85EFF86443934C7BA8A17AB97DBB1393)
    
2.  选择生成的Client Model文件存放的端侧目录。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d7/v3/jf2b0dxPQuWjUMqWcxOLiA/zh-cn_image_0000002214858897.png?HW-CC-KV=V1&HW-CC-Date=20260313T040423Z&HW-CC-Expire=86400&HW-CC-Sign=5957A0364BEE2F6C1FCC700E6BBA0A7579759F9C52E4AEB471712A0E90502D4E)
    
3.  点击“OK”。
    
    指定目录下生成对应对象类型的Client Model文件，后续您便可以在端侧代码中方便地引用该Client Model，具体可参考端云一体化工程初始化代码中的Client Model示例（“ets/pages/CloudDb/Post.ts”）在CloudDb.ets以及DbInset.ets中的引用。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/86/v3/1uQeLozdQzaGS-CQHpmyKA/zh-cn_image_0000002179338564.png?HW-CC-KV=V1&HW-CC-Date=20260313T040423Z&HW-CC-Expire=86400&HW-CC-Sign=2E68B33DA653689DEED88D50D973A98DCDD6501F87572650983084DE147E0FC2)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/agc-harmonyos-clouddev-modelclass*