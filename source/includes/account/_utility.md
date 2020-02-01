# Utility

## GET username from token

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

Returns the username associated with the current token (for validation purposes).


## GET refreshed auth token

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

This call can be used to re-authenticate with the API without needing to provide a username and password, however it must be done within the lifetime of your current JWT.

The response to this call contains a new token that may be used instead of your current token. This newly generated token is valid for another 24 hours.

## GET usage data

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

This allows returning the users current data usage information