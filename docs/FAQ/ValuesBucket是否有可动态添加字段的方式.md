---
title: ValuesBucket是否有可动态添加字段的方式
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-local-database-management-48
category: FAQ
updated_at: 2026-03-13T04:32:55.529Z
---

# ValuesBucket是否有可动态添加字段的方式

**解决措施**

ValuesBucket的实现如下：

```typescript
export type ValuesBucket = Record<string, ValueType | Uint8Array | null>;
```

[ValuesBucket.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/LocalDatabaseManagement/entry/src/main/ets/pages/ValuesBucket.ets#L22-L22)

若要动态添加字段，可以参考以下方法。

```typescript
function set(): void {
  let value : ValuesBucket={};
  let name : string ='NAME';
  value[name]= 'cxx';
  value['AGE']=18;
  value['SALARY']=20000;
}
```

[ValuesBucket.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/LocalDatabaseManagement/entry/src/main/ets/pages/ValuesBucket.ets#L26-L33)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-local-database-management-48*