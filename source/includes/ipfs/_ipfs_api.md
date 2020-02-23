# 1.0 - IPFS API

使用 IPFS API，您可以操作IPFS网络。
本节提供有关公共 IPFS 网络的使用信息。

我们有 Javascript 的用法示例，并将很快添加 Python 和 Golang。

您可以在右侧查看代码示例，并切换上面的编程语言。

要访问研发测试 API，请使用以下网址：

* https://dev.api.temporal.cloud

如果您希望访问生产API，请使用以下网址：

* https://api.temporal.cloud

## 1.1 IPFS HTTP API

我们的 IPFS HTTP API 反向代理服务让您可以用任何语言直接与IPFS节点API通信。对该API有命令白名单。要查看所有有效命令的列表，请在[gist](https://gist.github.com/bonedaddy/55be1cf00e8ffafff6e663c198bf6482)上查阅更新。

该端点与大多数 IPFS HTTP API 编译库兼容，例如[js-ipfs-http-client](https://github.com/ipfs/js-ipfs-http-client)。如果您想使用`go-ipfs-api`，我们维护了一个[叉](https://github.com/RTradeLtd/go-ipfs-api)，允许您在API调用中插入身份验证标头。

要访问此功能，请将您的客户端指向`https://api.ipfs.temporal.cloud`。

## 1.2 身份验证

七巧云使用 JSON Web Tokens 进行身份验证，可通过`POST login`来访问。

在本文档的所有代码示例中，您将看到`<JWT>`，它指示您应该提供由`POST login`命令生成的 JWT。

<aside class="success">
<b>重要提示：</b>
  JWT 会在24小时后失效。
  24小时内可以用<b><a href="/account.html#get-refreshed-auth-token">GET 刷新身份验证</a></b>，
  超过24小时则需要从新<b><a href="/account.html#post-login"> 登陆</a></b>
</aside>

## 1.3 通用错误

错误代码通常符合以下要求

错误代码      |  含义
------------ | -------
<b> 400 </b> |错误 -- 请求在某种程度上无效，失败的原因在响应正文中返回
<b> 401 </b> |未经授权 -- 身份验证无效。检查以确保您正确传递了授权令牌。
<b> 402 </b> |需要付款 -- 尝试执行数据存储操作（固定添加，文件添加）且帐户没有足够的信用额度来支付存储费用时，将返回此付款
<b> 403 </b> |禁止 -- 您无权使用此功能。
<b> 404 </b> |找不到 -- 找不到资源。
<b> 500 </b> |服务器错误 -- 在处理期间出现意外错误时返回


## 1.4 参数验证（400错误代码）

```json
{
  "code": "400",
  "response": [
    {
        "message": "Must be one of: RSA, ED25519",
        "field": "key_type"
    }
  ]
}
```

服务对接受的所有参数都进行验证。 如果验证失败，触发触发状态为`400`的错误响应。 响应主体将是一个JSON对象，其中包括一条消息以及未通过验证的参数列表。

## 1.5 保留时间

保留时间控制节点对文件的固定保存时间。 免费用户的最大时限是1个月，其他用户最长2年。

## 1.6 上传大小

上载一般文件时，所有用户的文件最大支持2GB。 如果使用文件加密，免费用户最大275MB，其他用户还是2GB。