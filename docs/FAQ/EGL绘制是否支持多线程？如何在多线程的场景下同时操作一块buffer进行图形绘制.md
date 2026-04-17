---
title: EGL绘制是否支持多线程？如何在多线程的场景下同时操作一块buffer进行图形绘制
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkgraphics-2d-6
category: FAQ
updated_at: 2026-03-13T05:19:01.936Z
---

# EGL绘制是否支持多线程？如何在多线程的场景下同时操作一块buffer进行图形绘制

-   支持多线程，可以通过每个线程各自产生一块纹理，再将这些纹理合成到一块buffer。
-   可以使用sharedContext，另外绘制操作可通过调用OpenGL实现。
-   创建ShareContext的代码如下：
    
    ```typescript
    void CreateShareEglContext()
    {
      if (renderContext == nullptr) { // RenderContext is the main thread context
        RS_LOGE("renderContext_ is nullptr");
        return;
      }
      eglShareContext = renderContext->CreateShareContext(); // Create share context
      if (eglShareContext == EGL_NO_CONTEXT) {
        RS_LOGE("eglShareContext is EGL_NO_CONTEXT");
        return;
      }
      if (!eglMakeCurrent(renderContext->GetEGLDisplay(), EGL_NO_SURFACE, EGL_NO_SURFACE, eglShareContext)) {
        RS_LOGE("eglMakeCurrent failed");
        return;
      }
    }
    ```
    
    [CreateShare.cpp](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/Arkgraphics2D/entry/src/main/ets/pages/CreateShare.cpp#L5-L20)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkgraphics-2d-6*