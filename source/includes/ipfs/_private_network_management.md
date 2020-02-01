# Private Network - Management

## POST create network

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleCreateNetwork = (networkName, swarmKey, bootstrapPeers, users) => () => {

    let data = new FormData();
    data.append("network_name", networkName);

    // If optional paramaters are supplied.
    data.append("swarm_key", swarmKey);
    data.append("bootstrapPeers", bootstrapPeers);
    data.append("users", users.split(','));

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

    xhr.open("POST", "https://api.temporal.cloud/v2/ipfs/private/network/new");
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
    "api_url": "192.168.1.243:5981",
    "id": 51,
    "network_name": "thisisnotarealtestnetwork",
    "swarm_key": "/key/swarm/psk/1.0.0/\n/base16/\n0a1bb9d5a949484f19d84104981c94827bff62268b82d7a36d3358aa629465ba",
    "users": [
      "postables"
    ]
  }
}
```

`https://api.temporal.cloud/v2/ipfs/private/network/new`

Create a private network through Temporal.

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>network_name</b> | String | The name of your network.
| <b>swarm_key</b>* | String | The swarm key.
| <b>bootstrap_peers</b>* | String | The bootstrap peers.
| <b>users</b>* | Array[String] | A list of usernames which have access to the private network.

<aside class="warning">
*Optional parameters. Note that if one optional parameter is supplied, all three must be supplied.
</aside>

### Response (200)

| Field | Type | Description
|-----------|------|-------------
| <b>api_url</b> | String | The API endpoint for your network.
| <b>id</b> | Int | The unique ID of your network.
| <b>network_names</b> | String | The name of your network.
| <b>swarm_key</b> | String | The swarm key generated (or provided) for the network.
| <b>users</b> | Array[String] | A list of usernames which have access to the private network.

## POST start network

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleStart = (networkName) => () => {

    let data = new FormData();
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

    xhr.open("POST", "https://api.temporal.cloud/v2/ipfs/private/network/start");
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
    "network_name": "thisisnotarealtestnetwork",
    "state": "started"
  }
}
```

`https://api.temporal.cloud/v2/ipfs/private/network/start`

Start a private network, enabling uploads and downloads.

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>network_name</b> | String | The network to start.

### Response (200)

| Field | Type | Description
|-----------|------|-------------
| <b>network_name</b> | String | The network that was started.
| <b>state</b> | String | The new state of the network ("started").

## POST stop network

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleStart = (networkName) => () => {

    let data = new FormData();
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

    xhr.open("POST", "https://api.temporal.cloud/v2/ipfs/private/network/stop");
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
    "network_name": "thisisnotarealtestnetwork",
    "state": "stopped"
  }
}
```

`https://api.temporal.cloud/v2/ipfs/private/network/stop`

Stop a private network, preventing uploads and downloads.

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>network_name</b> | String | The network to stop.

### Response (200)

| Field | Type | Description
|-----------|------|-------------
| <b>network_name</b> | String | The network that was started.
| <b>state</b> | String | The new state of the network ("stopped").


## POST add users

```go
Golang code here.
```

```python
Python code here.
```

```javascript
Javascript code here.
```

> Example Response (200)

```
{
    "code": 200,
    "response": "authorized user list updated"
}
```

`https://api.temporal.cloud/v2/ipfs/private/network/users/add`

Used to add a user or users from being able to access this private network. This API call may only be performed by owners of the network.

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>network_name</b> | String | The name of the network to modify permissions for
| <b>users</b> | Array[String] | The username(s) to add access for


## POST add owners

```go
Golang code here.
```

```python
Python code here.
```

```javascript
Javascript code here.
```

> Example Response (200)

```
{
    "code": 200,
    "response": "network owners updated"
}
```

`https://api.temporal.cloud/v2/ipfs/private/network/owners/add`

Used to add a user or users as network owners. Network owners have access to management commands. Currently there is no support for removing owners.

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>network_name</b> | String | The name of the network to modify permissions for
| <b>owners</b> | Array[String] | The username(s) to add as network owners


## DEL remove users

```go
Golang code here.
```

```python
Python code here.
```

```javascript
Javascript code here.
```

> Example Response (200)

```
{
    "code": 200,
    "response": "authorized user list updated"
}
```

`https://api.temporal.cloud/v2/ipfs/private/network/users/remove`

Used to remove a user or users from being able to access this private network. This API call may only be performed by owners of the network.


### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>network_name</b> | String | The name of the network to modify permissions for
| <b>users</b> | Array[String] | The username(s) to remove access for


## DEL remove network

```go
Golang code here.
```

```python
Python code here.
```

```javascript
Javascript code here.
```

> Example Response (200)

```
{
  "expire": "2018-12-21T19:31:42Z",
  "token": "eyJhbG ... "
}
```

`https://api.temporal.cloud/v2/ipfs/private/network/remove`

Delete a private network.

<aside class="warning">
Network deletion will not work if your private network is running. Ensure you have stopped it.
</aside>

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>network_name</b> | String | The name of the network to remove.

## GET authorized networks

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleAuthorizedNetworks = () => {

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

    xhr_stat.open("GET", "https://api.temporal.cloud/v2/ipfs/private/networks");
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
    "private_net_1",
    "myprivatenetwork",
    "thisisnotarealtestnetwork",
    "thisisnotarealtestnetwork-222",
    "private_net_12222"
  ]
}
```

`https://api.temporal.cloud/v2/ipfs/private/networks`

View your authorized networks. The response is an array of strings, each representing a private network name.

## GET information

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleNetwork = (networkName) => () => {

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

    xhr_stat.open("GET", "https://api.temporal.cloud/v2/ipfs/private/network/" + networkName);
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
        "database": {
            "ID": 1,
            "CreatedAt": "2019-05-21T22:52:30.685697Z",
            "UpdatedAt": "2019-05-21T23:11:40.496366Z",
            "Name": "private_net_12222",
            "Activated": "2019-05-21T22:52:45.506688Z",
            "Disabled": false,
            "PeerKey": REDACTED,
            "SwarmAddr": "192.168.1.201:12337",
            "SwarmKey": "/key/swarm/psk/1.0.0/\n/base16/\n96a2d89244a03764436f3ab23b584e3b14ccbb2fd72db5b53afc38db6fa8759d",
            "APIAllowedOrigin": "",
            "GatewayPublic": false,
            "BootstrapPeerAddresses": null,
            "BootstrapPeerIDs": null,
            "ResourcesCPUs": 0,
            "ResourcesDiskGB": 0,
            "ResourcesMemoryGB": 0,
            "Owners": [
                "postables",
                "billybob"
            ],
            "Users": [
                "postables",
                "billybob"
            ]
        }
    }
}
```

`https://api.temporal.cloud/v2/ipfs/private/network/:name`

Retrieve network statistics from a single private network.