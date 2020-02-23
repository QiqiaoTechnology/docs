# IPFS HTTP API 代理服务

IPFS HTTP API 反向代理使用内部开发的专门针对 IPFS HTTP API 定制的代理解决方案。它与所有 IPFS HTTP API 库兼容，只要它们使您能够将七巧云生成的JWT插入身份验证标头中即可，因为它使用与七巧云 HTTP API 相同的身份验证方法。

在使用此API之前，请详细阅读其工作原理。

端点网址：

* 生产 `https://api.ipfs.temporal.cloud`
* 开发 `https://dev.api.ipfs.temporal.cloud`

此[列表](https://gist.github.com/bonedaddy/55be1cf00e8ffafff6e663c198bf6482)显示代理支持的功能, 该文件会随时保存更新

您需要一个有效的七巧云帐户才能使用此API。任何涉及存储数据的API调用（例如 `object/new`, `object/set-data`, `dag/put`，等）都将触发 1个月的数据固定。

任何涉及读取数据的API均不受速率限制，您可以随意使用它们。为了提高性能，数据读取通过缓存系统进行。如果要跳过缓存系统接收未缓存的响应，请将`Cache-Control`标头设置为`"no-store"`。

## Example

```go
package main

import (
    "fmt"
    "log"
    "os"

    // fork of ipfs/go-ipfs-api which allows using jwt for authentication
    ipfs "github.com/RTradeLtd/go-ipfs-api"
    // helper library to login and authenticate with Temporal's HTTP API
    thc "github.com/RTradeLtd/thc"
)

const (
    temporalReverseProxy = "https://api.ipfs.temporal.cloud"
    exampleCID           = "QmS4ustL54uo8FzR9455qaxZwuMiUhyvMcX9Ba8nUH4uVv"
)

func main() {
    temporalUser := os.Getenv("TEMPORAL_USER")
    if temporalUser == "" {
        log.Fatal("TEMPORAL_USER env var must not be empty")
    }
    temporalPass := os.Getenv("TEMPORAL_PASS")
    if temporalPass == "" {
        log.Fatal("TEMPORAL_PASS env var must not be empty")
    }
    // initialize a V2 Temporal API client
    tClient := thc.NewV2(temporalUser, temporalPass, thc.DevURL)
    // login with Temporal to generate the JWT
    if err := tClient.Login(); err != nil {
        fmt.Println("failed to login with error", err)
        log.Fatal(err)
    }
    // get the JWT
    jwt, err := tClient.GetJWT()
    if err != nil {
        log.Fatal(err)
    }
    // create a shell with the reverse proxy endpoint
    // the difference between direct shell and the typical
    // NewShell function, is that NewDirectShell won't fail
    // if you provide an invalid multiaddr, this is different
    // from js-ipfs-http-client which doesn't do this
    shell := ipfs.NewDirectShell(temporalReverseProxy)
    // WithAuthorization allows providing the JWT as a header in the http connection
    // It returns a type `Shell` which you then call `Pin` on
    if err := shell.WithAuthorization(jwt).Pin(exampleCID); err != nil {
        fmt.Println("failed to pin with error", err)
        log.Fatal(err)
    }
    fmt.Println("successfully pinned", exampleCID)
}
```

```python
Python code here.
```

```shell
curl -X POST \
  'https://api.ipfs.temporal.cloud/api/v0/pin/add?arg=QmS4ustL54uo8FzR9455qaxZwuMiUhyvMcX9Ba8nUH4uVv&stream-channels=true' \
  -H 'Authorization: Bearer <your-jwt-here>' \
  -H 'cache-control: no-cache'
```

```http
POST /api/v0/pin/add?arg=QmS4ustL54uo8FzR9455qaxZwuMiUhyvMcX9Ba8nUH4uVv&stream-channels=true HTTP/1.1
Host: api.ipfs.temporal.cloud
User-Agent: curl/7.58.0
Accept: */*
Authorization: Bearer <jwt-omitted>
cache-control: no-cache
```

```javascript
var ipfsClient = require('ipfs-http-client')

// example cid to pin
var exampleCID = 'QmS4ustL54uo8FzR9455qaxZwuMiUhyvMcX9Ba8nUH4uVv'
// TEMPORAL_JWT is an environment variable used to provide the jwt needed to authenticate with temoral
// optionally, you could import https://github.com/clemlak/temporal-js and use the login function
// to return the jwt
var jwt = process.env.TEMPORAL_JWT

// specify how we will connect the ipfs client
var ipfs = ipfsClient({
    // the hostname (or ip address) of the endpoint providing the ipfs api
    host: 'api.ipfs.temporal.cloud',
    // the port to connect on
    port: '443',
    'api-path': '/api/v0/',
    // the protocol, https for security
    protocol: 'https',
    // provide the jwt within an authorization header
    headers: {
        authorization: 'Bearer ' + jwt
    }
})

// use the js-ipfs-http-client library to pin a particular CID
// this will be procesed like any other IPFS API, however
// it will be backed up by the infrastructure under Temporal.
ipfs.pin.add(exampleCID, function (err, response) {
    if (err) {
        console.error(err, err.stack)
        throw  err
    }
    console.log(response)
})
```

> Example Response (200)

```
{
    "Pins": [
        "QmS4ustL54uo8FzR9455qaxZwuMiUhyvMcX9Ba8nUH4uVv"
    ]
}
```

此示例演示如何使用 IPFS HTTP API 端点固定文件。 展示javascript，golang和curl命令。
