# 6.0 - Recovery

## 6.1 POST forgot username

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

Sends a reminder to the associated e-mail address with the given username. Your account must have an activated e-mail address for this call to execute.

<aside class="success">
Does not require a JWT for authentication. Account must have an activated e-mail address.
</aside>

### 6.1.1 回应 (200)

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>email_address</b> | 字符串 | The e-mail address associated with your account.

## 6.2 POST forgot password

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

Resets the password for the account with the associated email, sending it via email.

<aside class="success">
Does not require a JWT for authentication. Account must have an activated e-mail address.
</aside>

### 6.2.1 回应 (200)

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>email_address</b> | 字符串 | The e-mail address associated with your account.

## 6.3 POST forgot email

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

Returns the e-mail address associated with the JWT supplied.