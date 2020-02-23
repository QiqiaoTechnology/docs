# 3.0 - 恢复

## 3.1 POST 忘记用户名

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleForgotUsername = (email) => () => {

    let data = new FormData();
    data.append("email_address", email);

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

    xhr.open("POST", "https://api.temporal.cloud/v2/forgot/username");
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.send(data);
};
```

> 回应示例 (200)

```
{
  // Need an example response.
}
```

`https://api.temporal.cloud/v2/forgot/username`

将提醒发送到用户的电子邮件地址。您的帐户必须有激活的电子邮件地址才能执行此调用。

<aside class="success">
不需要JWT进行身份验证，但是帐户必须有激活的电子邮件地址。
</aside>

### 3.1.1 回应 (200)

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>email_address</b> | 字符串 | 与您的帐户关联的电子邮件地址。

## 3.2 POST 忘记密码

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleForgotPassword = (email) => () => {

    let data = new FormData();
    data.append("email_address", email);

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

    xhr.open("POST", "https://api.temporal.cloud/v2/forgot/password");
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.send(data);
};
```

> 回应示例 (200)

```
{
  // Need an example response.
}
```

`https://api.temporal.cloud/v2/forgot/password`

重置电子邮件地址关联的帐户的密码，并通过电子邮件发送。

<aside class="success">
将提醒发送到用户的电子邮件地址。您的帐户必须有激活的电子邮件地址才能执行此调用。
</aside>

### 3.2.1 回应 (200)

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>email_address</b> | 字符串 | The e-mail address associated with your account.

## 3.3 POST 忘记邮件地址

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleForgotEmail => () => {

    let data = new FormData();
    data.append("email_address", email);

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

    xhr.open("POST", "https://api.temporal.cloud/v2/forgot/email");
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr.send(data);
};
```

> 回应示例 (200)

```
{
  // Need example response.
}
```

`https://api.temporal.cloud/v2/forgot/email`

返回与提供的JWT关联的电子邮件地址。
