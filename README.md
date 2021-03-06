# LLP-ExpressPay-dotnet

欢迎来到连连快捷收款的c#仓库， 本仓库包含c#接入快捷收款网页版的示例代码及必要的说明。

其中， ```Web```目录下为快捷收款PC端页面的示例工程；```H5```目录下为快捷收款移动端页面的示例工程。

## 主要内容

[前置要求](#前置要求)

[快捷收款测试商户号信息](#快捷收款测试商户号信息)

[使用说明](#使用说明)

[文档说明](#文档说明)

## 前置要求

暂无

## 快捷收款测试商户号信息

测试商户号: 201408071000001539

PKCS8格式私钥(供```c#```使用): 

```text
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKZGXpmfgya2gGh6UdFPqPqi6e2z/HX4aIlMH394FOXTVwErnSGY5S0YFw5WskJrQLU2RHwFiA5P9Yt8VPxwgLDpdIm1/a7NlyjvWNvBd8V7wyITH8teJA1Ae5yWmRRrWFcVRSjpBq3xfwv76lVl+Nq/jR08p/ugVYJgtYEIM53JAgMBAAECgYA17SarPj+j45a7y8gTUXmlaAbkb/ZWMG1+8fBZQBHPA/74wzNf/R1+xYxcuyNvRSekXehSLN0WfzpMtdM+WCJ0ODqHRFsbAxmi784hzBZHOAxoJV49P8PVy6HIPthXxiSNUcacSt/HKJrUI6zACpymJLiVxMb9GqQAyx3BJl7rjQJBANG+RDszZYl3J1z1AtD0WggycrH2YOB7v5o3qKOz2AQ6CHWApSN6cuvqFwaUtHK9gMpDhvWR6zbYVRP+f4AxoQ8CQQDK8fTkpHNrHc011E8jjk3Uq5PWTJ0jAvcqk4rqZa4eV9953YSJYtJ2Fk2JnL3Ba7AU+qStnyD6MvSIpwIPSaOnAkEAptbFaZ4Jn55jdmMC2Xn1f925NGx6RTbKg37Qq18sbrhG8Ejjk2QctCIiLL7vBvJM1xd97CslQhw1GNFxVGSl6wJAQzwFtfoFgudMpRjBXzY18s8lG0omhQLmf+SBkUY+eS8Diowo7Jsgvp6E8aJL+1iB7XFcPWkKs9lNyjgKJqZu4QJAM22ULfWKrNIqaBJaYDmQSupUkHR/WL5rQJtAuVo8Zg3+rBrtMTXfIHJpR0MNpMgRSsPK6pZ3n4i+VvC5WxKUzA==
```

其公钥已上传至商户站。有关您真实商户号的公私钥配置， 请参考[连连开放平台 - 公私钥配置](https://openllp.lianlianpay.com/docs/development/signature-key-generation)。

> 测试商户号是连连正式环境的商户号， 需要使用真实信息进行测试， 测试时建议将订单金额设置到```0.01```元(CNY)。使用测试商户号时， 建议使用独特的用户唯一标识```user_id```及独特的商户订单号```no_order```以免与其他商户的测试信息冲突。

## 使用说明

使用前需添加引用```Newtonsoft.Json.dll```。

配置文件```PartnerConfig.cs```中包含RSA密钥/MD5密钥、异步通知及结束返回URL、商户编号、签名方式、业务类型等信息， 您可以根据需要做相应更改。

引用添加完成后， 根据实际情况完成工程部署， 部署成功后浏览器中输入http://ip:port/可以进入demo演示页面。

## 文档说明

有关快捷收款的详细介绍及请求参数说明， 请参考[连连开放平台 - 快捷收款](https://openllp.lianlianpay.com/docs/receive-money/express/overview)。