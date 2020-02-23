# 3.0 - 功能应用

## 3.1 POST 下载文件

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleDownload = (ipfsHash, networkName) => () => {

    let xhr = new XMLHttpRequest();
    xhr.withCredentials = false;
    xhr.responseType = 'blob';

    // Optional two lines, used if supplying a private networkName.
    let data = new FormData();
    data.append("network_name");

    let json_reader = new FileReader();

    xhr.addEventListener("readystatechange", function () {

        if (xhr.readyState === 4) {
            if (xhr.response.type === "application/json") {
                // Error handling. (i.e. 400 Response)
            }

            else {
                let blob = new Blob([xhr.response], {type: 'application/octet-stream'});

                // The following code enables automatic downloading through a web app!
                let a = document.createElement("a");
                a.style = "display: none";
                document.body.appendChild(a);
                let url = window.URL.createObjectURL(blob);
                a.href = url;
                a.download = fileName;
                a.click();
                window.URL.revokeObjectURL(url);
            }
        }
    }.bind(this));

    xhr.open("POST", "https://api.temporal.cloud/v2/ipfs/utils/download/" + ipfsHash);
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    // Use xhr.send() if not supplying a private networkName.
    xhr.send(data);
};
```

`https://api.temporal.cloud/v2/ipfs/utils/download/:hash`

通过七巧云从公共IPFS网络下载文件，也可以用于用户从专用网络下载。

<aside class ="warning">
从专用网络下载文件时，请确保网络可以使用。
</aside>

### 3.1.1 参数

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>network_name</b> | 字符串| 专用网络名称（可选）
| <b>decrypt_key</b> | 字符串| 解密密码（可选）

## 3.2 POST 束移

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleBeam = (sourceNetwork, destinationNetwork, hash, passphrase) => () => {

    let data = new FormData();
    data.append("source_network", sourceNetwork);
    data.append("destination_network", destinationNetwork);
    data.append("content_hash", hash);
    data.append("passphrase", passphrase);

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

    xhr.open("POST", "https://api.temporal.cloud/v2/ipfs/utils/laser/beam");
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr.send(data);
};
```

> 回应示例 (200)

```
{
  "expire": "2018-12-21T19:31:42Z",
  "token": "eyJhbG ... "
}
```

`https://api.temporal.cloud/v2/ipfs/utils/laser/beam`

在两个不同的专用IPFS网络之间传输内容。

### 3.2.1 参数

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>source_network</b> | 字符串| 读取内容的网络。
| <b>destination_network</b> | 字符串| 要复制到的网络。
| <b>content_hash</b> | IPFS哈希| 内容的哈希值。
| <b>passphrase</b>* | 字符串| 可选，使用密码来加密内容。

<aside class="warning">
*可选参数。 如果提供密码，则内容将在传输过程中加密，然后再上传到目标网络
</aside>
