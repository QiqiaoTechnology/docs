# 1.0 - 数据库 API

本节提供有关七巧云文件上传的资料，包括加密上传。

我们有 Javascript 的用法示例，并将很快添加 Python 和 Golang。

您可以在右侧查看代码示例，并切换上面的编程语言。

要访问研发测试API，请使用以下网址：

* https://dev.api.temporal.cloud

如果您希望访问生产API，请使用以下网址：

* https://api.temporal.cloud

## 1.1 身份验证

七巧云使用 JSON Web Tokens 进行身份验证，可通过`POST login`来访问。

在本文档的所有代码示例中，您将看到`<JWT>`，它指示您应该提供由`POST login`命令生成的 JWT。

<aside class="success">
<b>重要提示：</b>
  JWT 会在24小时后失效。
  24小时内可以用<b><a href="/account.html#get-refreshed-auth-token">GET 刷新身份验证</a></b>，
  超过24小时则需要从新<b><a href="/account.html#post-login"> 登陆</a></b>
</aside>

## 1.2 通用错误

除了API调用专用的400个响应外，错误代码通常符合以下条件：

错误代码    |  含义
---------- | -------
<b>400</b> | 错误 -- 被提供了无效的数据。
<b>401</b> | 未经授权 -- 身份验证无效。检查以确保您正确传递了授权令牌。
<b>403</b> | 禁止 -- 您无权使用此功能。
<b>404</b> | 找不到 -- 找不到资源。
<b>500</b> | 服务器错误 -- 我们的服务器出现了问题。请稍后重试或联系 <b>support@rtradetechnologies.com</b>

在某些情况下，服务器将返回通常预期的`200`代码，但并没有成功执行命令。
如果可能发生这种情况，我们会为每个 API 描述这种情况的特定条件。

## 1.3 参数验证（400 错误代码）

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
