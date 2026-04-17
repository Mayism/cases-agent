---
title: 通行密钥身份认证（C/C++）
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/onlineauthentication-passkey-cpp
category: 指南
updated_at: 2026-03-12T12:52:53.964Z
---

# 通行密钥身份认证（C/C++）

## 接口说明

通行密钥服务主要接口如下表。

| 接口名 | 描述 |
| --- | --- |
| [HMS_FIDO2_getClientCapability](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/passkey#ga3745265749b2776403960fbeece3de77) | 查询当前设备支持的客户端能力列表。 |
| [HMS_FIDO2_getPlatformAuthenticator](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/passkey#ga18b569cb28a659f4282acbb64e198195) | 查询当前设备支持的平台认证器能力列表（人脸、指纹、PIN码）。 |
| [HMS_FIDO2_register](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/passkey#gaaaed812197e7dc4d5f9a3354d5349665) | 进行通行密钥的注册。 |
| [HMS_FIDO2_authenticate](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/passkey#gaac4365229064efc78dc25dceb7c932a3) | 进行通行密钥的认证。 |

## 开发步骤

通行密钥服务提供基于FIDO2标准协议的FIDO客户端实现，这里仅演示FIDO客户端相关API的使用，涉及FIDO服务器的相关处理由开发者自行实现，这里不做介绍，请参考[FIDO2标准协议](https://fidoalliance.org/passkeys/)（见[网站链接免责声明](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/onlineauthentication-website-disclaimer)）。

在CMake脚本中链接相关动态库。

```cpp
target_link_libraries(projectName libfido2_ndk.z.so)
```

1.  需要业务方自行根据FIDO2标准协议部署FIDO服务器。
2.  注册通行密钥。
    1.  获取能力信息，调用HMS\_FIDO2\_getClientCapability接口获取客户端能力列表，并且调用HMS\_FIDO2\_getPlatformAuthenticator接口获取平台认证器能力信息。
        
        ```cpp
        #include "OnlineAuthenticationKit/fido2_api.h"
        FIDO2_ErrorCode TestGetClientCapability()
        {
            // 获取客户端能力列表
            FIDO2_CapabilityArray *capability = NULL;
            FIDO2_ErrorCode ret = HMS_FIDO2_getClientCapability(&capability);
            // 业务根据错误码判断异常类型，进行相应处理，详见错误码参考
            if (ret != FIDO2_SUCCESS) {
                HMS_FIDO2_CapabilityArray_Destroy(capability);
                return ret;
            }
            return FIDO2_SUCCESS;
        }
        FIDO2_ErrorCode GetPlatformAuthenticator()
        {
            // 获取平台认证器能力
            FIDO2_AuthenticatorMetadataArray *authenticators = NULL;
            FIDO2_ErrorCode ret = HMS_FIDO2_getPlatformAuthenticator(&authenticators);
            // 业务根据错误码判断异常类型，进行相应处理，详见错误码参考
            if (ret != FIDO2_SUCCESS) {
                HMS_FIDO2_AuthenticatorMetadataArray_Destroy(authenticators);
                return ret;
            }
            return FIDO2_SUCCESS;
        }
        ```
        
    2.  访问FIDO服务器，获取注册报文，调用HMS\_FIDO2\_register接口进行注册。
        
        ```cpp
        FIDO2_ErrorCode TestReg()
        {
            // 初始化注册参数，init方法必须调用
            FIDO2_CredentialCreationOptions options;
            HMS_FIDO2_initCreationOptions(&options);
            // FIDO服务器返回的注册报文，具体报文内容由业务方传入
            FIDO2_PublicKeyCredentialCreationOptions publicKey;
            // 业务方组装注册信息，包含是否需要用户介入以及注册报文
            options.mediation = FIDO2_CONDITIONAL;
            options.publicKey = publicKey;
            // 初始化tokenBinding参数，业务方可不赋值，但init方法必须调用
            FIDO2_TokenBinding tokenBinding;
            HMS_FIDO2_initTokenBinding(&tokenBinding);
            // 测试origin，具体内容由业务方设置
            char *origin = "http://www.fidotest.com";
            // 调用HMS_FIDO2_register进行通行密钥注册
            FIDO2_PublicKeyAttestationCredential* publicKeyAttestationCredential = NULL;
            FIDO2_ErrorCode ret = HMS_FIDO2_register(options, tokenBinding, origin, &publicKeyAttestationCredential);
            // 业务根据错误码判断异常类型，进行相应处理，详见错误码参考
            if (ret != FIDO2_SUCCESS) {
                HMS_FIDO2_PublicKeyAttestationCredential_Destroy(publicKeyAttestationCredential);
                return ret;
            }
            return FIDO2_SUCCESS;
        }
        ```
        
    3.  应用使用注册结果（publicKeyAttestationCredential）组装注册响应报文，发送至FIDO服务端进行验证，获取注册结果报文。
3.  使用通行密钥进行身份认证。
    1.  获取能力信息，调用HMS\_FIDO2\_getClientCapability接口获取客户端能力列表，并且调用HMS\_FIDO2\_getPlatformAuthenticator接口获取平台认证器能力信息。
        
        ```cpp
        #include "OnlineAuthenticationKit/fido2_api.h"
        FIDO2_ErrorCode TestGetClientCapability()
        {
            // 获取客户端能力列表
            FIDO2_CapabilityArray *capability = NULL;
            FIDO2_ErrorCode ret = HMS_FIDO2_getClientCapability(&capability);
            // 业务根据错误码判断异常类型，进行相应处理，详见错误码参考
            if (ret != FIDO2_SUCCESS) {
                HMS_FIDO2_CapabilityArray_Destroy(capability);
                return ret;
            }
            return FIDO2_SUCCESS;
        }
        FIDO2_ErrorCode GetPlatformAuthenticator()
        {
            // 获取平台认证器能力
            FIDO2_AuthenticatorMetadataArray *authenticators = NULL;
            FIDO2_ErrorCode ret = HMS_FIDO2_getPlatformAuthenticator(&authenticators);
            // 业务根据错误码判断异常类型，进行相应处理，详见错误码参考
            if (ret != FIDO2_SUCCESS) {
                HMS_FIDO2_AuthenticatorMetadataArray_Destroy(authenticators);
                return ret;
            }
            return FIDO2_SUCCESS;
        }
        ```
        
    2.  访问FIDO服务器，获取认证报文，调用HMS\_FIDO2\_authenticate接口进行认证。
        
        ```cpp
        FIDO2_ErrorCode TestAuth()
        {
            // 初始化认证参数，init方法必须调用
            FIDO2_CredentialRequestOptions options;
            HMS_FIDO2_initRequestOptions(&options);
            // FIDO服务器返回的认证报文，具体报文内容由业务方传入
            FIDO2_PublicKeyCredentialRequestOptions publicKey;
            // 业务方组装认证信息，包含是否需要用户介入以及认证报文
            options.mediation = FIDO2_CONDITIONAL;
            options.publicKey = publicKey;
            // 初始化tokenBinding参数，业务方可不赋值，但init方法必须调用
            FIDO2_TokenBinding tokenBinding;
            HMS_FIDO2_initTokenBinding(&tokenBinding);
            // 测试origin，具体内容由业务方设置
            char *origin = "http://www.fidotest.com";
            // 调用HMS_FIDO2_authenticate进行通行密钥认证
            FIDO2_PublicKeyAssertionCredential *assertionCredential = NULL;
            FIDO2_ErrorCode ret = HMS_FIDO2_authenticate(options, tokenBinding, origin, &assertionCredential);
            // 业务根据错误码判断异常类型，进行相应处理，详见错误码参考
            if (ret != FIDO2_SUCCESS) {
                HMS_FIDO2_PublicKeyAssertionCredential_Destroy(assertionCredential);
                return ret;
            }
            return FIDO2_SUCCESS;
        }
        ```
        
    3.  应用使用认证结果（assertionCredential）组装认证响应报文，发送至FIDO服务端进行验证，获取认证结果报文。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/onlineauthentication-passkey-cpp*