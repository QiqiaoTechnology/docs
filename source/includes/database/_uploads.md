# 上传的文件

## GET 上传的文件

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

xhr.open("GET", "https://api.temporal.cloud/v2/database/uploads");
xhr.setRequestHeader("Cache-Control", "no-cache");
xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
xhr.send();
```

> 回应示例 (200)

```
{
  "code": 200,
  "response": [
    {
        "CreatedAt": "2018-09-03T21:23:40.886121Z",
        "DeletedAt": null,
        "Encrypted": false,
        "GarbageCollectDate": "2018-10-03T21:23:40.885741Z",
        "Hash": "QmVzyrQByv4KQ9qknwo5v3wKR8wCjMwwfX282NxhYZdi2f",
        "HoldTimeInMonths": 1,
        "ID": 30,
        "NetworkName": "public",
        "Type": "file",
        "UpdatedAt": "2018-09-03T23:47:04.771439Z",
        "UserName": "pseudonaut_two",
        "UserNames": ["pseudonaut_two"]
    },
    {
        "CreatedAt": "2018-09-03T02:21:33.065631Z",
        "DeletedAt": null,
        "Encrypted": false,
        "GarbageCollectDate": "2018-10-03T02:21:33.065291Z",
        "Hash": "QmeuMb3ToBWtCp5xduNxcuozxawha3eikhCHNgLYJEvBMG",
        "HoldTimeInMonths": 1,
        "ID": 24,
        "NetworkName": "public",
        "Type": "file",
        "UpdatedAt": "2018-09-03T03:16:16.592957Z",
        "UserName": "pseudonaut_two",
        "UserNames": ["pseudonaut_two"]
    }
  ]
}
```

`https://api.temporal.cloud/v2/database/uploads`

返回所有上传到七巧云数据库的文件列表。 响应是一个符合以下数据结构的数组：

### 回应 (200)

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>CreatedAt</b> | 日期时间 | 文件的创建日期。
| <b>DeletedAt</b> | 日期时间 | 文件的删除日期，或者`null`。
| <b>Encrypted</b> | 布尔 | 文件是否加密。
| <b>GarbageCollectDate</b> | 日期时间 | 文件何时取消固定。
| <b>Hash</b> | IPFS 哈希 |  链接内容关的哈希值。
| <b>HoldTimeInMonths</b> | 整数 | 固定的月数。
| <b>ID</b> | 整数 |  您上传的记录编号。
| <b>NetworkName</b> | 字符串 | 发布记录的网络名称 (`public` = 公共网络)。
| <b>Type</b> | 字符串 | 您上传的文件类型。
| <b>UpdatedAt</b> | 日期时间 | 文件的最新更新日期。
| <b>Username</b> | 字符串 | 上传文件的用户名（<i>就是您</i>）。
| <b>Usernames</b> |数组[字符串] |  列出有权访问文件的用户（<i>只用于专用网络</i>）。

## GET 上传的加密文件

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

xhr.open("GET", "https://api.temporal.cloud/v2/database/uploads/encrypted");
xhr.setRequestHeader("Cache-Control", "no-cache");
xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
xhr.send();
```

> 回应示例 (200)

```
{
  "code": 200,
  "response": [
    {
        "CreatedAt": "2018-09-03T21:23:40.886121Z",
        "DeletedAt": null,
        "Encrypted": true,
        "GarbageCollectDate": "2018-10-03T21:23:40.885741Z",
        "Hash": "QmVzyrQByv4KQ9qknwo5v3wKR8wCjMwwfX282NxhYZdi2f",
        "HoldTimeInMonths": 1,
        "ID": 30,
        "NetworkName": "public",
        "Type": "file",
        "UpdatedAt": "2018-09-03T23:47:04.771439Z",
        "UserName": "pseudonaut_two",
        "UserNames": ["pseudonaut_two"]
    },
    {
        "CreatedAt": "2018-09-03T02:21:33.065631Z",
        "DeletedAt": null,
        "Encrypted": true,
        "GarbageCollectDate": "2018-10-03T02:21:33.065291Z",
        "Hash": "QmeuMb3ToBWtCp5xduNxcuozxawha3eikhCHNgLYJEvBMG",
        "HoldTimeInMonths": 1,
        "ID": 24,
        "NetworkName": "public",
        "Type": "file",
        "UpdatedAt": "2018-09-03T03:16:16.592957Z",
        "UserName": "pseudonaut_two",
        "UserNames": ["pseudonaut_two"]
    }
  ]
}
```

`https://api.temporal.cloud/v2/database/uploads/encrypted`

返回所有上传到七巧云数据库的加密文件列表。

### 回应 (200)

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>CreatedAt</b> | 日期时间 | 文件的创建日期。
| <b>DeletedAt</b> | 日期时间 | 文件的删除日期，或者`null`。
| <b>Encrypted</b> | 布尔 | 文件是否加密。
| <b>GarbageCollectDate</b> | 日期时间 | 文件何时取消固定。
| <b>Hash</b> | IPFS 哈希 |  链接内容关的哈希值。
| <b>HoldTimeInMonths</b> | 整数 | 固定的月数。
| <b>ID</b> | 整数 |  您上传的记录编号。
| <b>NetworkName</b> | 字符串 | 发布记录的网络名称 (`public` = 公共网络)。
| <b>Type</b> | 字符串 | 您上传的文件类型。
| <b>UpdatedAt</b> | 日期时间 | 文件的最新更新日期。
| <b>Username</b> | 字符串 | 上传文件的用户名（<i>就是您</i>）。
| <b>Usernames</b> |数组[字符串] |  列出有权访问文件的用户（<i>只用于专用网络</i>）。
