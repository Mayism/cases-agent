---
title: 使用HiLog打印日志是否有长度限制
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-performance-analysis-kit-58
category: FAQ
updated_at: 2026-03-13T02:36:37.563Z
---

# 使用HiLog打印日志是否有长度限制

使用HiLog进行日志打印时，最多支持4096字节，超出部分将被截断。

利用HiLog封装日志打印工具类，解决日志信息过长的问题。

示例如下：

封装LogUtil类：

```typescript
import { hilog } from '@kit.PerformanceAnalysisKit';
class LogUtil {
  private static instance: LogUtil;
  private static DOMAIN: number = 0x0000;
  private constructor() {
    // Private constructor to prevent external instantiation
  }
  public static getInstance(): LogUtil {
    if (!LogUtil.instance) {
      LogUtil.instance = new LogUtil();
    }
    return LogUtil.instance;
  }
  public logError(logTag: string, content: string) {
    const maxSize = 1024;
    if (content.length <= maxSize) {
      // Length less than or equal to the limit for direct printing
    } else {
      while (content.length > maxSize) {
        // Loop segmented printing
        let logContent = content.substring(0, maxSize);
        content = content.replace(logContent, '');
        hilog.error(LogUtil.DOMAIN, logTag, '%{public}s', logContent);
        // Print remaining logs
      }
    }
    hilog.error(LogUtil.DOMAIN, logTag, '%{public}s', content);
  }
  public logDebug(logTag: string, content: string) {
    const maxSize = 1024;
    if (content.length <= maxSize) {
      // Length less than or equal to the limit for direct printing
    } else {
      while (content.length > maxSize) {
        //Loop segmented printing
        let logContent = content.substring(0, maxSize);
        content = content.replace(logContent, '');
        hilog.debug(LogUtil.DOMAIN, logTag, '%{public}s', logContent);
        // Print remaining logs
      }
    }
    hilog.debug(LogUtil.DOMAIN, logTag, '%{public}s', content);
  }
  public logInfo(logTag: string, content: string) {
    const maxSize = 1024;
    if (content.length <= maxSize) {
      // Length less than or equal to the limit for direct printing
    } else {
      while (content.length > maxSize) {
        //Loop segmented printing
        let logContent = content.substring(0, maxSize);
        content = content.replace(logContent, '');
        hilog.info(LogUtil.DOMAIN, logTag, '%{public}s', logContent);
        // Print remaining logs
      }
    }
    hilog.info(LogUtil.DOMAIN, logTag, '%{public}s', content);
  }
}
export default LogUtil;
```

[LogUtilClass.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/AnalysisKit/entry/src/main/ets/pages/LogUtilClass.ets#L21-L87)

使用：

```typescript
import LogUtil from './LogUtilClass';
@Entry
@Component
struct HiLogIsThereALengthLimit {
  build() {
    Row() {
      Column() {
        Button('hilog util')
          .onClick(() => {
            let str = 'Long log content';
            let utilInfo = LogUtil.getInstance();
            utilInfo.logInfo('testTag', str);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
```

[HiLogIsThereALengthLimit.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/AnalysisKit/entry/src/main/ets/pages/HiLogIsThereALengthLimit.ets#L21-L40)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-performance-analysis-kit-58*