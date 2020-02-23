# 7.0 - 应用

## 7.1 GET 令牌中到用户名

```go
Golang code here.
```

```python
Python code here.
```

```javascript
let data = new FormData();
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

xhr.open("GET", "https://api.temporal.cloud/v2/account/token/username");
xhr.setRequestHeader("Cache-Control", "no-cache");
xhr.setRequestHeader("Authorization", "Bearer " + Session.get('token'));
xhr.send(data);
```

> 回应示例 (200)

```
{
  "code": 200,
  "response": "postables"
}
```

`https://api.temporal.cloud/v2/account/token/username`

返回与当前令牌关联的用户名（用于验证目的）。

## 7.2 GET 刷新令牌

```go
Golang code here.
```

```python
Python code here.
```

```javascript
let data = new FormData();
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

xhr.open("GET", "https://api.temporal.cloud/v2/auth/refresh");
xhr.setRequestHeader("Cache-Control", "no-cache");
xhr.setRequestHeader("Authorization", "Bearer " + Session.get('token'));
xhr.send(data);
```

> 回应示例 (200)

```
{
    "expire": "2019-05-25T01:25:55Z",
    "token": "eyJhbGciOiJIUzI1.....5h0s6xM"
}
```

`https://api.temporal.cloud/v2/auth/refresh`

此调用可用于使用API跟新验证，而无需提供用户名和密码，但是必须在当前JWT的生存期内完成。

对此调用的响应包含一个新令牌，可以使用它代替当前令牌。此新生成的令牌在24小时内有效。

## 7.3 GET 读取使用数据

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

```json
{
    "code": 200,
    "response": {
        "ID": 57,
        "CreatedAt": "0001-01-01T00:00:00Z",
        "UpdatedAt": "2019-02-03T02:33:50.796677Z",
        "DeletedAt": null,
        "UserName": "postables",
        "MonthlyDataLimitBytes": 3221225472,
        "CurrentDataUsedBytes": 5169444,
        "IPNSRecordsPublished": 1,
        "IPNSRecordsAllowed": 5,
        "PubSubMessagesSent": 1,
        "PubSubMessagesAllowed": 1000,
        "KeysCreated": 4,
        "KeysAllowed": 5,
        "Tier": "free"
    }
}
```

`https://api.temporal.cloud/v2/account/usage`

返回用户当前的数据使用信息 。
