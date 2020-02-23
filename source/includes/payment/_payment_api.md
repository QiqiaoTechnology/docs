# 1.0 - Payment API

This section offers Payment functionality for purchasing and spending credits.

We have usage examples for Javascript and will add Python and Golang soon.

You can view code examples to the right, and switch the programming language above.

To access the development API use the following url:

* https://dev.api.temporal.cloud

Should you wish to access the production API  use the following url:

* https://api.temporal.cloud

## 1.1 Authentication

Temporal uses JSON Web Tokens for authentication, accessed through the `POST login` call.

Throughout the code examples in this documentation, you will see `<JWT>` which requires a JWT for access.

<aside class="success">
<b>Important:</b>  JWT tokens expire after 24 hours. You will need to call <b><a href="/account.html#post-login">POST login</a></b> to generate another valid JWT after 24 hours, or call <b><a href="/account.html#get-refreshed-auth-token">GET refresh auth token</a></b> in advance.
</aside>


## 1.2 General Errors

Except for 400 responses unique to an API call, error codes generally conform to the following:

Error Code | Meaning
---------- | -------
<b>400</b> | Error -- Invalid data supplied.
<b>401</b> | Unauthorized -- Invalid authentication token.  Check to make sure you're properly passing the authorization token.
<b>403</b> | Forbidden -- You do not have access to this functionality.
<b>404</b> | Not Found -- Resource not found.
<b>500</b> | Server Error -- We had a problem with our server. Try again later or contact <b>info@7qiao.com</b>


In some cases, calls will return a `200` code as generally expected, but will not successfully execute the command.
In this case, we will specify the particular conditions this could occur for a given API call.

## 1.3 Validation (400 Error Code)

```json
{
  "code": "400",
  "response": [
    {
        "message": "Must be one of: RSA, ED25519",
        "field": "key_type"
    }
  ]
}
```

Methods that take input will validate all parameters. Any parameter that fails validation will trigger an error response with status `400`. The response body will be a JSON object that includes a message as well as a list of fields that failed validation.
