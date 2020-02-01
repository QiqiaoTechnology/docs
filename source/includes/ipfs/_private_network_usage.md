# Private Network - Usage

## POST download file

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
    data.append("networkName");

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

    xhr.open("POST", "https://api.temporal.cloud:6767/v2/ipfs/utils/download/" + ipfsHash);
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr.send(data); // Use xhr.send() if not supplying a private networkName.
};
```

`https://api.temporal.cloud/v2/ipfs/utils/download/:hash`

Downloads a specific hash that was previously uploaded through the Temporal <b><a href="#post-upload-file">POST upload file</a></b> call.

There is an optional parameter, `networkName` that you can pass for downloading files from private IPFS networks created
through Temporal (see <b><a href="#post-create-network">POST create network</a></b>).

<aside class="success">
This API endpoint is used for downloading files from public <b>and</b> private networks.
</aside>

<aside class="warning">
When downloading a file from a private network, please ensure the network is running.
Call <b><a href="#post-start-network">POST start network</a></b> if the network is stopped.
</aside>

### Optional Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>networkName</b> | String | The private network to download a file from.

## POST upload file

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleUpload = (file, holdtime, networkName) => {

    let data = new FormData();
    data.append("file", file);
    data.append("hold_time", holdTime);
    data.append("network_name", networkName);

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

    xhr.open("POST", "https://api.temporal.cloud/v2/ipfs/private/file/add");
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr.send(data);
};
```

> Example Response (200)

```
{
  "code": 200,
  "response": "QmYwwdB1X6aivm8me71EwWXFZjGtjkAmUuT9qEDQBZmdSk"
}
```

`https://api.temporal.cloud/v2/ipfs/private/file/add`

Uploads a file to the specified private network with optional encryption, and pins it for the specified number of months. When encrypting the file, it is impossible for Temporal to assist with recovery as we do not store the password.

The response is an IPFS hash that is not publicly accessible.

<aside class="warning">
File uploads will not work if your private network is stopped.
</aside>

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>file</b> | File (Blob) | The file you intend to upload.
| <b>hold_time</b> | Int | Number of months to pin the file.
| <b>privateNetwork</b> | String | Name of the private network to upload to.

### Optional Parameters

| Field | Type | Description
|-------|------|-------------
| <b>passphrase</b> | String | optional parameter used to encrypt upload.

## POST pin hash

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handlePinFile = (ipfsHash, holdTime, networkName) => () => {

    let data = new FormData();
    data.append("hold_time", holdTime);
    data.append("network_name", networkName);

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

    xhr.open("POST", "https://api.temporal.cloud/v2/ipfs/private/pin/" + ipfsHash);
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr.send(data);
};
```

> Example Response (200)

```
{
  "code": 200,
  "response": "content pin request sent to backend"
}
```

`https://api.temporal.cloud/v2/ipfs/private/pin/:hash`

Pin a hash to a private network. This hash *must* be discoverable by the private network node.

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>hash</b> | IPFS Hash | The specific hash to pin.
| <b>hold_time</b> | Int | Number of months to pin the hash.
| <b>network_name</b> | String | Number of months to pin the hash.
| <b>file_name</b> | String | optional filename to name the pin with.

## POST pubsub

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handlePubSub = (message, topic, networkName) => () => {

    let data = new FormData();
    data.append("message", message);
    data.append("network_name", networkName);

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

> Example Response (200)

```
{
  "code": 200,
  "response": {
    "message": "bar",
    "topic": "foo"
  }
}
```

`https://api.temporal.cloud/v2/ipfs/private/pubsub/publish/:topic`

Publish a message on a private network to the given topic.

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>message</b> | String | The message to publish.
| <b>network_name</b> | String | The private network to publish the message to.

### Response (200)

| Field | Type | Description
|-----------|------|-------------
| <b>message</b> | String | The message you published.
| <b>topic</b> | String | The topic you published the message to.

## GET check pin

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleCheckPin = (hash, networkName) => () => {

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

    xhr.open("POST", "https://api.temporal.cloud/v2/ipfs/private/pin/check/" + hash + "/" + networkName);
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr.send(data);
};
```

> Example Response (200)

```
{
  "code": 200,
  "response": true
}
```

`https://api.temporal.cloud/v2/ipfs/private/pin/check/:hash/:networkName`

Check if a network is pinning the given hash.

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>hash</b> | String | The hash to check.
| <b>networkName</b> | String | The network to check.

## GET object stats

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleObject = (hash, networkName) => () => {

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

    xhr_stat.open("GET", "https://api.temporal.cloud/v2/ipfs/private/stat/" + hash + "/" + networkName);
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
    "Hash": "QmejvEPop4D7YUadeGqYWmZxHhLc4JBUCzJJHWMzdcMe2y",
    "BlockSize": 12,
    "CumulativeSize": 12,
    "DataSize": 10,
    "LinksSize": 2,
    "NumLinks": 0
  }
}
```

`https://api.temporal.cloud/v2/ipfs/private/stat/:hash/:networkName`

Retrieve information about an object (hash) on a private network.

### Response (200)

| Field | Type | Description
|-----------|------|-------------
| <b>Hash</b> | IPFS Hash | The hash requested.
| <b>BlockSize</b> | Int | The ...
| <b>CumulativeSize</b> | Int | The ...
| <b>DataSize</b> | Int | The ...
| <b>LinksSize</b> | Int | The ...
| <b>NumLinks</b> | Int | The ...

## GET uploads

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleUploads = (networkName) => () => {

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

    xhr_stat.open("GET", "https://api.temporal.cloud/v2/ipfs/private/uploads/" + networkName);
    xhr_stat.setRequestHeader("Cache-Control", "no-cache");
    xhr_stat.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr_stat.send();
};
```

> Example Response (200)

```
{
  "code": 200,
  "response": [
    {
      "ID": 522,
      "CreatedAt": "2018-12-20T20:19:41.383403Z",
      "UpdatedAt": "2018-12-20T20:20:56.778709Z",
      "DeletedAt": null,
      "Hash": "QmYwwdB1X6aivm8me71EwWXFZjGtjkAmUuT9qEDQBZmdSk",
      "Type": "file",
      "NetworkName": "private_net_12222",
      "HoldTimeInMonths": 2,
      "UserName": "postables",
      "GarbageCollectDate": "2019-02-20T20:19:41.382864Z",
      "UserNames": [
        "postables"
      ],
      "Encrypted": false
    }
  ]
}
```

`https://api.temporal.cloud/v2/ipfs/private/uploads/:networkName`

Retrieve uploads for a private network.

### Response (200)

| Field | Type | Description
|-----------|------|-------------
| <b>CreatedAt</b> | DateTime | Time the file was created.
| <b>DeletedAt</b> | DateTime | Time the file was deleted.
| <b>Encrypted</b> | Bool | Whether the file is encrypted or not.
| <b>GarbageCollectDate</b> | DateTime | When the file will be deleted (or pinning stops).
| <b>Hash</b> | IPFS Hash | The hash associated with your content.
| <b>HoldTimeInMonths</b> | Int | Number of months your content is pinned.
| <b>ID</b> | Int | The unique ID of your upload.
| <b>NetworkName</b> | String | The private network your file was published on.
| <b>Type</b> | String | The type of file you uploaded.
| <b>UpdatedAt</b> | DateTime | Time the file was last updated.
| <b>Username</b> | String | User that uploaded the file (<i>that's you</i>).
| <b>Usernames</b> | Array[String] | Usernames that have access to the file (<i>for private networks</i>).