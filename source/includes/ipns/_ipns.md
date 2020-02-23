# 2.0 - IPNS

## 2.1 POST 发布记录

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handlePublicIPNS = (hash, lifetime, ttl, key, resolve) => () => {

    let data = new FormData();
    data.append("hash", hash);
    data.append("life_time", lifetime);
    data.append("ttl", ttl);
    data.append("key", key);
    data.append("resolve", resolve);

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

    xhr.open("POST", "https://api.temporal.cloud/v2/ipns/public/publish/details");
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr.send(data);
};
```

> 回应示例 (200)

```
{
  // Need a response.
}
```

`https://api.temporal.cloud/v2/ipns/public/publish/details`

将IPNS记录发布到公共网络。

### 2.1.1 参数

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>hash</b> | IPFS 哈希 | 要发布的哈希值。
| <b>life_time</b> | 字符串 | The lifetime.
| <b>ttl</b> | 字符串 | The time-to-live.
| <b>key</b> | 字符串 | IPFS 名称。
| <b>resolve</b> | 布尔值 | 是否解析IPNS记录。

## 2.2 POST IPNS 固定

```go
Golang code here
```

```python
Python code here
```

```javascript
Javascript code here
```

> 回应示例 (200)

```
{
    "code": 200,
    "response": "pin request sent to backend"
}
```

`https://api.temporal.cloud/v2/ipns/public/pin`

固定记录解析到的IPFS哈希值。

<aside class="warning">
您需要为`ipns_path`提供一个类似于`/ipns/docs.api.temporal.cloud`的路径。
</aside>

### 2.2.1 参数

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>ipns_path</b> | IPFS 哈希| 完整的 IPNS 记录路径
| <b>hold_time</b> | 整数 | 解析的哈希值需要的固定月数


## 2.3 GET 记录

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

xhr.open("GET", "https://api.temporal.cloud/v2/ipns/records");
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
        "CreatedAt": "2018-10-11T02:41:09.241844Z",
        "CurrentIPFSHash": "QmWmLpZLUA1cHZGyYATUUHg99EHfSvTyttNZFQkEpCVbwd",
        "DeletedAt": null,
        "ID": 2,
        "IPFSHashes": ["QmWmLpZLUA1cHZGyYATUUHg99EHfSvTyttNZFQkEpCVbwd"],
        "IPNSHash": "QmcPHXmqRCsd6zSDJdQmM7pWhaC8cXK8f27YLpTdZkpGz4",
        "Key": "pseudonaut_two-4096_test",
        "LifeTime": "4h0m0s",
        "NetworkName": "public",
        "Sequence": 1,
        "TTL": "24h0m0s",
        "UpdatedAt": "2018-10-11T02:41:09.241844Z",
        "UserName": "pseudonaut_two"
    },
    {
        "CreatedAt": "2018-12-24T22:27:54.151338Z",
        "CurrentIPFSHash": "QmSKpt2AvPM5QGfRiWLs2esj9PKTcz1GBbpdWJ41vTn8we",
        "DeletedAt": null,
        "ID": 12,
        "IPFSHashes": [
            "QmWmLpZLUA1cHZGyYATUUHg99EHfSvTyttNZFQkEpCVbwd",
            "QmSKpt2AvPM5QGfRiWLs2esj9PKTcz1GBbpdWJ41vTn8we"
        ],
        "IPNSHash": "QmNopw5FsuBSvgG5DYrd4oYXSYt6186bwRfHpwkK6gPwhv",
        "Key": "pseudonaut_two-55",
        "LifeTime": "24h0m0s",
        "NetworkName": "public",
        "Sequence": 2,
        "TTL": "24h0m0s",
        "UpdatedAt": "2019-01-06T06:07:07.999384Z",
        "UserName": "pseudonaut_two"
    }
  ]
}
```

`https://api.temporal.cloud/v2/ipns/records`

列出您已发布到公用和专用网络的所有IPNS记录。

### 2.3.1 回应 (200)

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>CreatedAt</b> | 日期时间 | 记录发布的时间。
| <b>CurrentIPFSHash</b> | IPFS哈希| <i>此记录解析为的当前IPFS哈希。</i>
| <b>DeletedAt</b> | 日期时间 | 文件删除的时间，或者`null`。
| <b>ID</b> | 整数 | 您上传的记录编号。
| <b>IPFSHashes</b> |数组[IPFS 哈希] | <i>此记录过去解析的所有 IPFS 哈希。</i>
| <b>IPNSHash</b> | IPFS 哈希 | <i>用于发布此记录的公共密钥的哈希。</i>
| <b>Key</b> | 字符串 | 使用的IPFS记录名称。
| <b>LifeTime</b> | 字符串 | 内容的固定月数。
| <b>NetworkName</b> | 字符串 | 发布记录的网络名称 (`public` = 公共网络)。
| <b>Sequence</b> | 整数 | <i>当前的版本号，从0开始以每次发布加1。</i>
| <b>TTL</b> | 字符串 | 生存时间。
| <b>UpdatedAt</b> | 日期时间 | 文件的最新更新日期。
| <b>Username</b> | 字符串 | 发布记录的用户名 （<i>就是您</i>）。