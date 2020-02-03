# 用户管理

## POST 登录

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleLogin = (username, password) => () => {

        fetch('https://api.temporal.cloud/v2/auth/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'text/plain'
            },
            body: JSON.stringify({
                "username": username.toString(),
                "password": password.toString()
            })
        }).then(res => res.json()).catch(error => {
            console.error(error);
            if (error) {
                throw error;
            }
        })
            .then(response => {
                if (response.expire) {
                    console.log(response.token.toString());
                }
                // Error handling here.
            })

    };
```

> 回应示例 (200)

```
{
  "expire": "2018-12-21T19:31:42Z",
  "token": "eyJhbG ... "
}
```

`https://api.temporal.cloud/v2/auth/login`

验证提供的用户名和密码，以生成用于身份验证的 JSON Web Token（JWT）。
该令牌的有效期为24小时，之后您需要生成一个新令牌。

### 参数

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>username</b> | 字符串 | 用户名。
| <b>password</b> | 字符串 | 密码。

### 回应 (200)

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>expire</b> | 日期时间 | 令牌过期时间（24 小时）。
| <b>token</b> | 字符串 | 令牌的字符串.

## POST 账号注册

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleRegister = (username, password, email) => () => {

        var data = new FormData();
        data.append("username", username);
        data.append("password", password);
        data.append("email_address", email);

        var xhr = new XMLHttpRequest();
        xhr.withCredentials = false;

        xhr.addEventListener("readystatechange", function () {

            if (xhr.readyState === 4) {

                let result = JSON.parse(xhr.responseText);

                if (result.code === 200) {
                    console.log(result);
                }

                else {
                    // Error handling.
                }
            }
        }.bind(this));

        xhr.open("POST", "https://api.temporal.cloud/v2/auth/register");
        xhr.setRequestHeader("Cache-Control", "no-cache");
        xhr.send(data);

    };
```

> 回应示例 (200)

```
{
    "code": 200,
    "response": {
        "ID": 249,
        "CreatedAt": "2019-03-09T06:27:39.180443Z",
        "UpdatedAt": "2019-03-09T06:27:39.257956756Z",
        "DeletedAt": null,
        "UserName": "postables-demo",
        "EmailAddress": "demo@example.org",
        "AccountEnabled": true,
        "EmailEnabled": false,
        "EmailVerificationToken": "scrubbed",
        "AdminAccess": false,
        "HashedPassword": "scrubbed",
        "Free": true,
        "Credits": 0,
        "CustomerObjectHash": "zdpuAnUGSDoNQoHQ2jpjhPePHEvg26mYLsAAGxr4jkzCWUpde",
        "IPFSKeyNames": null,
        "IPFSKeyIDs": null,
        "IPFSNetworkNames": null,
        "Status": "by continuing to use this service you agree to be bound by the following api terms and servicehttps://gateway.temporal.cloud/ipns/docs.dev.ts.temporal.cloud"
    }
}
```

`https://api.temporal.cloud/v2/auth/register`

为`POST login`注册您的用户信息，得到用于验证身份的 JWT (JSON Web Token)。

返回的`response`对象中的`status`函数用于显示条款和服务信息，以及 API 的网络地址，它会根据您使用的是生产还是研发 API 而改变。`EmailVerificationToken` 和 `HashedPassword` 只会返回 `"scrubbed"`.

### 参数

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>username</b> | 字符串 | 您要的用户名。
| <b>password</b> | 字符串 | 您要的密码。
| <b>email_address</b> | 字符串 | 您的电子邮件地址。

### 回应 (200)

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>ID</b> | 整数 | 用户注册号。
| <b>CreatedAt</b> | 日期时间 | 账号的注册日期时间。
| <b>UpdatedAt</b> | 日期时间 | 账号的上次更新日期时间。
| <b>DeletedAt</b> | 日期时间 | 账号被删除的日期时间。
| <b>Username</b> | 字符串 | 用户名。
| <b>EmailAddress</b> | 字符串 | 电子邮件地址。
| <b>AccountEnabled</b> | 布尔 | 账号是否可用。
| <b>EmailEnabled</b> | 布尔 | 是否打开了邮件通知。
| <b>EmailVerificationToken</b> | 字符串 | 邮件地址合适码。
| <b>AdminAccess</b> | 布尔 | 是否有管理员权限。
| <b>HashedPassword</b> | 字符串 | 密码哈希值。
| <b>Free</b> | 布尔 | 是否是免费用户。
| <b>Credits</b> | 整数 | 帐上的积分。
| <b>CustomerObjectHash</b> | 字符串 | 上传文件集的 IPLD 对象。（功能待实现）
| <b>IPFSKeyNames</b> | 数组[字符串] | 关联的 IPFS 名称。
| <b>IPFSKeyIDs</b> | 数组[字符串] | 关联的 IPFS 哈希值。
| <b>IPFSNetworkNames</b> | 数组[字符串] | 关联的专用 IPFS 网络。
| <b>Status</b> | 字符串 | 条款和 API 的网络地址。

## POST 改变密码

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleChangePassword = (oldPassword, newPassword) => () => {

    let data = new FormData();
    data.append("old_password", oldPassword);
    data.append("new_password", newPassword);

    let xhr = new XMLHttpRequest();
    xhr.withCredentials = false;

    xhr.addEventListener("readystatechange", function () {

        if (xhr.readyState === 4) {

            let result = JSON.parse(xhr.responseText);

            if (result.code === 200) {
                console.log(result);
            }

            else {
                // Error handling.
            }
        }
    }.bind(this));

    xhr.open("POST", "https://api.temporal.cloud/v2/account/password/change");
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr.send(data);

};
```

> 回应示例 (200)

```
{
  "code": 200,
  "response": "password changed"
}
```

`https://api.temporal.cloud/v2/account/password/change`

更改您账号的密码

### 参数

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>old_password</b> | 字符串 | 老密码。
| <b>new_password</b> | 字符串 | 希望使用的新密码。

## POST upgrade account

```go
Golang code here.
```

```python
Python code here.
```

```javascript
Javascript code here
```

> 回应示例 (200)

```
{
    // add example response
}
```

`https://api.temporal.cloud/v2/account/upgrade`

用于将您的帐户从免费层升级到称为`Paid`的非免费层。 升级后，您不能降级，这是不可逆的操作。 只有在极少数情况下，我们才允许个人降级。

## GET 积分

```go
Golang code here.
```

```python
Python code here.
```

```javascript
let xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function () {

    if (xhr.readyState === 4) {

        let result = JSON.parse(xhr.responseText);

        if (result.code === 200) {
            console.log(result);
        }

        else {
            // Error handling.
        }
    }
}.bind(this));

xhr.open("GET", "https://api.temporal.cloud/v2/account/credits/available");
xhr.setRequestHeader("Cache-Control", "no-cache");
xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
xhr.send();
```

> 回应示例 (200)

```
{
  "code": 200,
  "response": 10000464.996296696
}
```

`https://api.temporal.cloud/v2/account/credits/available`

查看您的积分，`response`是一个浮点数。
