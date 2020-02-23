# 2.0 - Lens

## 2.1 POST 搜索请求

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleSearch = (query) => () => {

    let data = new FormData();
    data.append("query",  query);

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

    xhr.open("POST", "https://api.temporal.cloud/v2/lens/search");
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
        "results": [
            {
                "score": 0.018188993,
                "doc": {
                    "hash": "QmNo18enTNX6hZYtYvB8dEMfKT7YjeSEWgTuAmYBMG8bYG",
                    "mime_type": "application/pdf",
                    "category": "pdf"
                }
            }
        ]
    }
```

`https://api.temporal.cloud/v2/lens/search`

使用字符串搜索特定文件。例如 `blockchain` `data storage`。
可添加一些可选的搜索参数来完善结果。

### 2.1.1 参数

| 函数 | 类型 | 描述 | 是否必要
|-----------|------|----------|------------------------
| <b>query</b>| 字符串 | 搜索子句 | 是
| <b>tags</b> | 字符串组 | *to do* | 否
| <b>categories</b> | 字符串组 | 要搜索的类别（例如 pdf）| 否
| <b>mime_types</b> | 字符串组 | 搜索的 MIME 类型（例如 pdf）| 否
| <b>hashes</b> | 字符串组 | 必须与此查询匹配的索引数据的 ipfs 哈希| 否
| <b>required</b> | 字符串组 | *to do* | 否

## 2.2 POST 索引请求

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleIndexing = (hash, reindex, type) => {

    let data = new FormData();
    data.append("object_identifier", hash;
    // data.append("reindex", reindex); disabled until further notice
    data.append("object_type", type);

    let xhr = new XMLHttpRequest();
    xhr.withCredentials = false;

    xhr.addEventListener("readystatechange", function () {

        if (xhr.readyState === 4) {

            if (result.code === 200) {
                console.log(result);
            }

            else {
                // Error handling.
            }

        }
    }.bind(this));

    xhr.open("POST", "https://api.temporal.cloud/v2/lens/index");
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
        "hash": "QmNo18enTNX6hZYtYvB8dEMfKT7YjeSEWgTuAmYBMG8bYG",
        "mime_type": "application/pdf",
        "category": "pdf"
    }
}
```

`https://api.temporal.cloud/v2/lens/index`

提交文件到Lens索引数据库。

### 2.2.1 参数

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>object_identifier</b>| IPFS 哈希| 提交到索引的公共哈希。
| <b>object_type</b> | 字符串 | 对象类型，仅支持`ipld`。

### 2.2.2 回应（200）

| 函数 | 类型 | 描述
|-----------|------|-------------
| <b>hash</b> | IPFS 哈希 | 提交的哈希。
| <b>mimeType</b> | 字符串 | 提交的文件类型。
| <b>category</b> | 字符串 | 提交的文件类型的类别。
