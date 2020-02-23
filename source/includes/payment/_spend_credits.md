# 3.0 - Spend Credits

## 3.1 POST calculate file cost

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleCalculateFileCost = (file, holdTime) => {

    let data = new FormData();
    data.append("file", file);
    data.append("hold_time", hold_time);

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

    xhr.open("POST", "https://api.temporal.cloud/v2/frontend/cost/calculate/file");
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr.send(data);

};
```

> Example Response (200)

```
{
  "code": 200,
  "response": 0.013602416306734085
}
```

`https://api.temporal.cloud/v2/frontend/cost/calculate/file`

Returns the cost (in credits) for storing a given file. The return value is of type <b>double</b>.

### 3.1.1 Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>file</b> | File (Blob) | The file to upload.
| <b>hold_time</b> | Int | Number of months to store the file.

## 3.2 GET pin cost

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleGetPinCost = (hash, holdTime) => () => {

    let data = new FormData();
    data.append("hash", hash);
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

    xhr.open("GET", "https://api.temporal.cloud/v2/frontend/cost/calculate/" + hash + "/" + holdTime);
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr.send(data);

};
```

> Example Response (200)

```
{
  "code": 200,
  "response": 0.008532233396545054
}
```

`https://api.temporal.cloud/v2/frontend/cost/calculate/:hash/:holdTime`

Returns the cost (in credits) for pinning a given IPFS Hash. The return value is of type <b>double</b>.

### 3.2.1 Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>hash</b> | IPFS Hash | The requested IPFS Hash to pin.
| <b>holdTime</b> | Int | Number of months to pin the hash.





