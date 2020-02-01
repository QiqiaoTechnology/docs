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
| <b>username</b> | 字符串 | The username.
| <b>password</b> | 字符串 | The associated password.

### 回应 (200)

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>expire</b> | 日期时间 | Time at which the token expires (24 hours).
| <b>token</b> | 字符串 | Value of the JWT.

## POST register

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

Registers your information for the `POST login` call, which is used to generate the JWT (JSON Web Token) we use for API authentication. The field `status` within the `response` object, is used to display the terms and service URL associated with the API, that will change depending on usage of either the production, or development API. The values of `EmailVerificationToken` and `HashedPassword` are scrubbed before the response is sent.

### 参数

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>username</b> | 字符串 | Your desired username.
| <b>password</b> | 字符串 | Your desired password.
| <b>email_address</b> | 字符串 | An associated e-mail address.

### 回应 (200)

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>ID</b> | 整数 | The unique ID of your registration.
| <b>CreatedAt</b> | 日期时间 | Time the account was created.
| <b>UpdatedAt</b> | 日期时间 | Time the account was last updated.
| <b>DeletedAt</b> | 日期时间 | Time the account was deleted.
| <b>Username</b> | 字符串 | Your username.
| <b>EmailAddress</b> | 字符串 | Your e-mail address.
| <b>AccountEnabled</b> | 布尔 | Your account status.
| <b>EmailEnabled</b> | 布尔 | Your e-mail notification status.
| <b>EmailVerificationToken</b> | 字符串 | Sent via e-mail to confirm association.
| <b>AdminAccess</b> | 布尔 | Your admin status.
| <b>HashedPassword</b> | 字符串 | The hash of your password
| <b>Free</b> | 布尔 | Indicates if the account is free tier 
| <b>Credits</b> | 整数 | Your starting credits.
| <b>CustomerObjectHash</b> | 字符串 | IPLD object of your uploads (not yet implemented)
| <b>IPFSKeyNames</b> | 数组[字符串] | IPFS key names associated with your account.
| <b>IPFSKeyIDs</b> | 数组[字符串] | IPFS key values associated with your account.
| <b>IPFSNetworkNames</b> | 数组[字符串] | Private IPFS networks associated with your account.
| <b>Status</b> | 字符串 | Terms And Service link

## POST password change

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

Change the password associated with your account.

### 参数

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>old_password</b> | 字符串 | Your old password.
| <b>new_password</b> | 字符串 | Your desired, new password.

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

Used to upgrade your account from the free tier to the non-free tier known as `Paid`. After upgrading you are not allowed to downgrade and this is an irreversible action. Only in rare circumstances wil we allow individuals to downgrade.

## GET credits

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

View the amount of credits your account has.

The response is of type <b>double</b>.