---
title: onUnhandledException与onException回调分别什么时候触发
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ability-37
category: FAQ
updated_at: 2026-03-13T02:49:40.608Z
---

# onUnhandledException与onException回调分别什么时候触发

-   [onUnhandledException](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-inner-application-errorobserver#errorobserveronunhandledexception):当异常未被任何try/catch或onException处理时触发，如用于记录崩溃日志或上报未知错误。
-   [onException](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-inner-application-errorobserver#errorobserveronexception10)：在任务或异步操作中主动抛出异常时，系统会触发 onException 回调，例如网络请求失败、数据解析错误等。
    
    ```typescript
    import { errorManager } from '@kit.AbilityKit';
    import { BusinessError } from '@kit.BasicServicesKit';
    let observer: errorManager.ErrorObserver = {
      onUnhandledException(errorMsg) {
        console.error('onUnhandledException, errorMsg: ', errorMsg);
      },
      onException(errorObj) {
        console.log('onException, name: ', errorObj.name);
        console.log('onException, message: ', errorObj.message);
        if (typeof (errorObj.stack) === 'string') {
          console.log('onException, stack: ', errorObj.stack);
        }
      }
    };
    try {
      errorManager.on('error', observer);
    } catch (error) {
      console.error(`registerErrorObserver failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
    }
    ```
    
    [Exceptionhandle.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/AbilityKit/entry/src/main/ets/pages/Exceptionhandle.ets#L21-L41)
    

两个回调函数的触发时机相同，会同时触发。区别在于，onUnhandledException仅返回异常信息，而onException返回完整的异常对象。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ability-37*