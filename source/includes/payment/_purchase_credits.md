# Purchase Credits

## POST request ETH payment

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handlePurchase = (type, credits, address) => () => {

    let data = new FormData();
    data.append("payment_type", type);
    data.append("credit_value", creditValue);
    data.append("sender_address", address);

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

    xhr.open("POST", "https://api.temporal.cloud/v2/payments/eth/request");
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr.send(data);
}
```

> Example Response (200)

```
{
  "code": 200,
  "response": {
    "charge_amount_big": 44529147669208980,
    "formatted": {
      "h": "0xad8ed50340f920c837313062a9950f3847dceec23a86034d7909daae5d847a6a",
      "r": "0x6aea0b08e837b38a5d33c0baafc10f7eb50198fed55c864648ab96ada40608f9",
      "s": "0x3e2cd4b934a72c2bc66068f1277b1dafb3162f0bbd22e8f51f6696480217d108"
    },
    "h": [
      173,
      106
    ],
    "method": 1,
    "payment_number": 6,
    "prefixed": true,
    "r": [
      106,
      "...",
      249
    ],
    "s": [
      62,
      "...",
      8
    ],
    "v": 28
  }
}
```

`https://api.temporal.cloud/v2/payments/eth/request`

Request a signed message that can subsequently be used to purchase credits with RTC or ETH, validated through a smart contract.

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>type</b> | Int | The digital asset you intend to pay with: Ethereum = `1` and RTC  = `0`.
| <b>sender_address</b> | String | Ethereum address you will use for payment (`0x7E4A2359c745A982a54653128085eAC69E446DE1`).
| <b>credit_value</b> | Int | The number of credits you want to purchase.

### Response (200)

| Field | Type | Description
|-----------|------|-------------
| <b>charge_amount_big</b> | Int | The unique ID of your registration.
| <b>formatted</b> | Array[txSig:txVal] | Formatted version of the tx signature.
| <b>h</b> | DateTime | Portion of tx signature.
| <b>method</b> | Int | The digital asset you will pay with (Ethereum = `1`, RTC  = `0`).
| <b>payment_number</b> | Int | A unique number for your payment.
| <b>prefixed</b> | Bool | Tx signature prefixed status.
| <b>r</b> | Array[Int] | Portion of tx signature.
| <b>s</b> | Array[Int] | Portion of tx signature.
| <b>v</b> | Int | Portion of tx signature.

## POST confirm ETH payment

```go
Golang code here.
```

```python
Python code here.
```

```javascript
submitPayment = (paymentNumber, txHash) => {

    let data = new FormData();
    data.append("payment_number", paymentNumber);
    data.append("tx_hash", txHash);

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

    xhr.open("POST", "https://api.temporal.cloud/v2/payments/eth/confirm");
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr.send(data);

};
```

> Example Response (200)

```
{
  // Need example response.
}
```

`https://api.temporal.cloud/v2/payments/eth/confirm`

Confirm your eth or rtc payment after sending a transaction on the blockchain.

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>payment_number</b> | String | The unique number associated with your payment.
| <b>tx_hash</b> | String | The transaction hash associated with the transaction you sent through Ethereum.

## POST create DASH payment

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleDashPayment = (credits) => () => {

    let data = new FormData();
    data.append("credit_value", sourceNetwork);

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

    xhr.open("POST", "https://api.temporal.cloud/v2/payments/dash/create");
    xhr.setRequestHeader("Cache-Control", "no-cache");
    xhr.setRequestHeader("Authorization", "Bearer " + <JWT>);
    xhr.send(data);
};
```

> Example Response (200)

```
TODO
```

`https://api.temporal.cloud/v2/payments/dash/create`

Create a payment request to purchase credits with DASH.

<aside class="success">
<b>Note:</b> We utilize <b><a href="https://chainrider.io" target="_blank">ChainRider</a></b> for all DASH payments.
</aside>

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>credit_value</b> | String | The amount of credits you want to purchase.

### Parameters

| Field | Type | Description
|-------|------|------------
| <b>stripe_token</b> | String | The token generated by stripe
| <b>stripe_email</b> | String | The email you want a receipt forwarded to
| <b>value_in_cents</b> | String | The value of credits you wish to purchase in cents

## POST create BCH payment

```go
Golang code here.
```

```python
Python code here.
```

```javascript
Javascript code here
```
> Example Response (200)

```
{
    "code": 200,
    "response": {
        "charge_amount": 0.02374548,
        "deposit_address": "qzy50vd9rjpsvrut74t0qkruuzhakemc05a5gqwt88",
        "payment_number": 19
    }
}
```

`https://api.temporal.cloud/v2/payments/bch/create`

Create a payment request to purchase credits with BCH (Bitcoin Cash). You must send *exactly* the `charge_amount` in a single transaction to the specified deposit address. If you have enabled email notifications, you will receive an email when your payment is confirmed. Depending on the number of pending BCH payments being processed, it may take up to three hours. If your payment hasn't been confirmed within 24 hours, please send us an email indicating your username, and the payment number for the payment you are having troubles with.

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>credit_value</b> | String | The amount of credits you want to purchase.

## POST confirm BCH payment

```go
Golang code here.
```

```python
Python code here.
```

```javascript
Javascript code here
```
> Example Response (200)

```
{
    "code": 200,
    "response": {
        "user_name": "postables",
        "payment_number": 19
    }
}
```

`https://api.temporal.cloud/v2/payments/bch/confirm`

Confirm your BCH payment by submitting the transaction hash, triggering processing of your payment.

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>tx_hash</b> | String | The transaction hash of the payment
| <b>payment_number</b> | Int | The payment number this transaction is for

## POST create stripe payment

```go
Golang code here
```

```python
Python code here
```

```javascript
javascript code here
```

> Example Response (200)

```
{
  // Need example response
}
```

`https://api.temporal.cloud/v2/payments/stripe/charge`

Calls the Temporal backend to process, and place a charge against a credit card to purchase Credits. All purchasing is done with a currency value of USD.

<b>Note:</b> We utilize <b><a href="https://stripe.com/" target="_blank">Stripe</a></b> for all credit card payments.
</aside>

## GET payment status

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
    "response": true
}
```

`https://api.temporal.cloud/v2/payments/status/:number`

Used to get the status of a particular payment id

### Parameters

| Field | Type | Description
|-------|------|-------------
| <b>number</b> | Integer | The payment id to retrieve status information for