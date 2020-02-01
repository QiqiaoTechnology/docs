## 公共网络 - 使用方法

## POST上传文件

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleUpload = (file, holdtime) => {

    let data = new FormData();
    data.append("file", file);
    data.append("hold_time", holdTime);

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

    xhr.open("POST", "https://api.temporal.cloud/v2/ipfs/public/file/add");
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr.send(data);
};
```

> 回应示例 (200)

```
{
  "code": "200",
  "response": "QmRiC6GKnKZpG7mZmkok6B1mTPWzHnfuEEQQpNYbuZEuGa"
}
```

`https://api.temporal.cloud/v2/ipfs/public/file/add`

可上传文件到公共网络，并将其固定指定的月数。 如果使用加密功能，丢失的密码七巧云无法协助恢复，因为我们不存储密码。

得到的回应是可公开访问的IPFS哈希值。

### 参数

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>file</b> | 文件（blob）| 您打算上传的文件。
| <b>hold_time</b> | 整数 | 固定文件的月数。

### 可选参数

| 函数 | 类型 | 描述
|-------|------|-------------
| <b>passphrase</b>| 字符串 | 用于加密上传的可选参数。
| <b>hash_type</b> | 字符串 | 指定要使用的 multihash 哈希公式，例如 sha3-256

## POST 哈希固定

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handlePinFile = (ipfsHash, holdTime) => () => {

    let data = new FormData();
    data.append("hold_time", holdTime);

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

    xhr.open("POST", "https://api.temporal.cloud/v2/ipfs/public/pin/" + ipfsHash);
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr.send(data);
};
```

> 回应示例 (200)

```
{
  "code": 200,
  "response": "pin request sent to backend"
}
```

`https://api.temporal.cloud/v2/ipfs/public/pin/:hash`

通过七巧云固定IPFS哈希，存储指定的月份数。 当您希望永久存储IPFS上已经存在的内容并保证在指定的持续时间内可用时，可以使用此功能。

### 参数

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>hash</b>  | IPFS哈希| 要固定的哈希值。
| <b>hold_time</b> | 整数 | 固定哈希值的月数。
| <b>file_name</b> | 字符串 | 可选的文件名，用于命名固定。

## POST 增加固定时间

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
    "code": 200,
    "response": "pin time successfully extended"
}
```

`https://api.temporal.cloud/v2/ipfs/public/pin/:hash/extend`

用于将您现有的 IPFS 固定时间延长至指定的月份数。 免费用户的总固定时间只能是1个月（包括延期后），而付费用户为2年（包括延期后）

### 参数

| 领域 | 类型 | 描述
|-----------|------|-------------
| <b>hash</b> | IPFS 哈希 | 要固定的特定哈希值。
| <b>hold_time</b> | 整数 | 要固定的月数。


## POST pubsub

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handlePubSub = (message, topic) => () => {

    let data = new FormData();
    data.append("message", message);

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

    xhr.open("POST", "https://api.temporal.cloud/v2/ipfs/public/pubsub/publish/" + topic.toString());
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr.send(data);

};
```

> 回应示例 (200)

```
{
  "code": 200,
  "response": {
    "message": "bar",
    "topic": "foo"
  }
}
```

`https://api.temporal.cloud/v2/ipfs/public/pubsub/publish/:topic`

将消息发布到指定的 PubSub 主题。

### 参数

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>message</b> | 字符串 | 要发布的消息。

### 回应（200）

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>message</b> | 字符串 | 您发布的消息。
| <b>topic</b> | 字符串 | 您发布到的主题。

## GET object stats

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleObject = (hash) => () => {

    let xhr_stat = new XMLHttpRequest();
    xhr_stat.withCredentials = false;

    xhr_stat.addEventListener("readystatechange", function () {

        if (xhr_stat.readyState === 4) {

            let result = JSON.parse(xhr_stat.responseText);

            if (result.code === 200) {
                console.log(result);
            }

            else {
                // Error handling.
            }
        }
    }.bind(this));

    xhr_stat.open("GET", "https://api.temporal.cloud/v2/ipfs/public/stat/" + hash);
    xhr_stat.setRequestHeader("Cache-Control", "no-cache");
    xhr_stat.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr_stat.send();
};
```

> 回复示例 (200)

```
{
  "code": 200,
  "response": {
    "Hash": "QmZpTc2UXsDeiD4Fb6j1kHqMeBngrN6V4myWR28i1YfuYA",
    "BlockSize": 498,
    "CumulativeSize": 13673755,
    "DataSize": 2,
    "LinksSize": 496,
    "NumLinks": 10
  }
}
```

`https://api.temporal.cloud/v2/ipfs/public/stat/:hash`

检索一个 IPFS 哈希的信息。

### 回应 (200)

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>Hash</b> | IPFS Hash | The hash requested.
| <b>BlockSize</b> | Int | The ...
| <b>CumulativeSize</b> | Int | The ...
| <b>DataSize</b> | Int | The ...
| <b>LinksSize</b> | Int | The ...
| <b>NumLinks</b> | Int | The ...

## GET dag

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleDAG = (hash) => () => {

    let xhr_stat = new XMLHttpRequest();
    xhr_stat.withCredentials = false;

    xhr_stat.addEventListener("readystatechange", function () {

        if (xhr_stat.readyState === 4) {

            let result = JSON.parse(xhr_stat.responseText);

            if (result.code === 200) {
                console.log(result);
            }

            else {
                // Error handling.
            }
        }
    }.bind(this));

    xhr_stat.open("GET", "https://api.temporal.cloud/v2/ipfs/public/dag/" + hash);
    xhr_stat.setRequestHeader("Cache-Control", "no-cache");
    xhr_stat.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr_stat.send();
};
```

> Example Response (200)

```
{
  "code": 200,
  "response": {
    "data": "CAE=",
    "links": [
      {
        "Cid": {
          "/": "QmSMMHB9QVEC37ie7G2FcekKLn5wFySie9XoMwEWkDwJBS"
        },
        "Name": "404.html",
        "Size": 4561
      },
      {
        "Cid": {
          "/": "QmXwJmxebQTZYiXL5ijojH8SsCkCSycLdF1GP31yt8NJcS"
        },
        "Name": "GCWeb",
        "Size": 2591746
      },
      {
        "Cid": {
          "/": "QmU1by7iZd1vEixJZUosFdw1vyMDBq9hL1Yc7D7Mqn3qCt"
        },
        "Name": "dist",
        "Size": 1152391
      },
      {
        "Cid": {
          "/": "QmUt97qU2VyfV5iQNyHhLG4kYBm4qTctQXEmJd46RtLj8x"
        },
        "Name": "en",
        "Size": 24103
      },
      {
        "Cid": {
          "/": "QmXYdLB7WGkpSajMxgpxkcWDqrdb1vAHyD3V9fMK4JUyR9"
        },
        "Name": "favicon",
        "Size": 66666
      },
      {
        "Cid": {
          "/": "Qmb3fJpXVGvUnNeRLC3P5sTXMzjpf5zq4tKt9XjhtYFf1k"
        },
        "Name": "fonts",
        "Size": 216178
      },
      {
        "Cid": {
          "/": "QmSCVZL3Yj4RxfMcTPyGAvBmDiKDpKdmUMXYxbtJQVtUqU"
        },
        "Name": "fr",
        "Size": 25015
      },
      {
        "Cid": {
          "/": "QmZ4BDukLtAUZj3EB1v6JTUpphjq3mt2rdU3dgMN7s47b3"
        },
        "Name": "img",
        "Size": 323474
      },
      {
        "Cid": {
          "/": "QmSrTNwejyMRyviN2G6xJTCscjNSMhy1fu1METPQZi3wH6"
        },
        "Name": "index.html",
        "Size": 6798
      },
      {
        "Cid": {
          "/": "QmXzfNvwRZcuDZNhtRJ64ADRcz7vxYwD6YJTy9JRzvMH7S"
        },
        "Name": "wet-boew",
        "Size": 9262325
      }
    ]
  }
}
```

`https://api.temporal.cloud/v2/ipfs/public/dag/:hash`

读取一个CID的IPLD对象。

### 回应 (200)

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>data</b> | String | The ...
| <b>Cid</b> | String | The ...
| <b>Name</b> | String | The ...
| <b>Size</b> | Int | Size of the file in (kilobytes/bytes?).
