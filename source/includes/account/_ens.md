# ENS Management

This API allows you to manage your ENS subdomain under `ipfstemporal.eth`. All subdomain names correspond to your username, so if your username is `bonedaddy` your subdomain would be `bonedaddy.ipfstemporal.eth`.

Once you have claimed your name, and updated it with a content hash, you can resolve your website on services like `.eth.link`. So for example lets say we have published a content hash under `bonedaddy.ipfstemporal.eth`, we could navigate to `https://bonedaddy.ipfstemporal.eth.link` and you are accessing a decentralized IPFS hosted website, resolved with ENS records!!

## POST claim

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
    "response": "request is being processed, you will receive an email with an update when finished"
}
```

`https://api.temporal.cloud/v2/ens/claim`

Claims your ENS subdomain, allow you to update its content hash, and resolve it via services like `.eth.link`. Accounts are required to have a balance of 0.15 credits to cover the tx fees. By calling this API you will initiate three on-chain transactions: 

  1) Register step 1
  2) Register step 2
  3) Set resolve

## POST update

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
    "response": "request is being processed, you will receive an email with an update when finished"
}
```

`https://api.temporal.cloud/v2/ens/update`

Updates the content hash this subdomain will resolve to. It requires submitting a valid IPFS hash, otherwise you will receive an error. Accounts are required to have a balance of 0.15 credits to cover the tx fees.