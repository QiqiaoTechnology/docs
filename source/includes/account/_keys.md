# 4.0 - IPFS Keys

## 4.1 POST 生成 ipfs 密钥

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleKeyGenerate = (keyName, keyType, keySize) => () => {

    let data = new FormData();
    data.append("key_name", keyName);
    data.append("key_type", keyType);
    data.append("key_bits", keySize);

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

    xhr.open("POST", "https://api.temporal.cloud/v2/account/key/ipfs/new");
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr.send(data);
};
```

> 回应示例 (200)

```
{
  "code": 200,
  "response": "key creation sent to backend"
}
```

`https://api.temporal.cloud/v2/account/key/ipfs/new`

使用提供的参数创建一个IPFS密钥。

<aside class=“warning”><b>创建的私钥仅在公共IPFS网络上可用。对于专用网络，请通过delegator使用直接IPFS API</b></aside> 


### 4.1.1 参数

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>key_type</b> | 字符串 | 密钥的类型，`RSA` 或 `ED25519`。
| <b>key_size</b> | 整数 | 密钥的大小。 `RSA` 可选择 `2048`, `3072`, 或 `4096` 而 `ED25519` 只能选择 `256`.
| <b>key_name</b> | 字符串 | 密钥的名称。

## 4.2 GET 导出 ipfs 密钥

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleKeyExport = (keyName) => () => {

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

    xhr.open("GET", "https://api.temporal.cloud/v2/account/key/export/" + keyName);
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr.send(data);
};
```

> 回应示例 (200)

```
{
  "code": "200",
  "response": [
    "road",
    "carwash",
    "ambulance",
    "vehicle",
    "manhole",
    "explosion"
  ]
}
```

`https://api.temporal.cloud/v2/account/key/export/:name`

使用助记短语导出密钥。

<aside class=“warning”>RSA密钥的助记符短语非常大，可以超过1000个单词。</aside>

### 4.2.1 参数

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>name</b> | 字符串 |导出密钥的名称。

### 4.2.2 回应 (200)

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>response</b> | 数组[字符串] | 助记短语。

## 4.3 GET 读取 ipfs 密钥

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

        if (result.code === 400) {
            // Error handling.
        }

        else if  (result.code === 200) {
            console.log(result);
        }

        else {
            // Error handling.
        }

    }
}.bind(this));

xhr.open("GET", "https://api.temporal.cloud/v2/account/key/ipfs/get");
xhr.setRequestHeader("Cache-Control", "no-cache");
xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
xhr.send();
```

> 回应示例 (200)

```
{
  "code": 200,
  "response": {
    "key_ids": [
      "QmRxu16ho4kmak3ZFEwUuSQAHiLQoaanLeYa4R3LG2ozCg",
      "Qme3dCHims67ACrKXNoioP5ftr4tP1n1beaWCcJiTJYL1E",
      "QmNRcEwEmFK1jz6w58LS7TfxHsR42AinVdCbmqReXuAqWM",
      "12D3KooWRtMLutruxkjWkdTdkk96qyMvXtvLJDEUxdjyzQwj8HPS"
    ],
    "key_names": [
      "postables-ke2",
      "postables-muchkeysuchwow",
      "postables-1",
      "postables-key2019ED25519"
    ]
  }
}
```

`https://api.temporal.cloud/v2/account/key/ipfs/get`

检索使用七巧生成的所有IPFS密钥。

<aside class=“warning”>请注意：<b>key_ids</b>和<b>key_names</b>相互镜像； <b>key_ids</b>中的第一个元素对应于<b>key_names</b>中的第一个元素</asid

### 4.3.1 回应 (200)

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>key_ids</b> | IPFS Hash | 密钥的id。
| <b>key_names</b> | 字符串 | 密钥的名称。
