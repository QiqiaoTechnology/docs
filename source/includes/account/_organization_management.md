# Organization Management

Temporal enables groups of accounts called Organizations. Instead of each account needing to maintain a credit balance and pay upfront for storage costs, the storage costs for all users is applied towards the organization as an amount owed.

Each user account is allowed to create at most 1 organization. To create an organization you user account must be partner tier. To become a partner account your user account must be manually upgraded by an RTrade team member. Thus user accounts registered underneath an organization are prevented from creating an organization themselves. So dont go trying to game the system for free storage, it just wont happen ;)

## POST new organization

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
    "response": "organization created"
}
```

`https://api.temporal.cloud/v2/org/new`

Creates an organization, and marks the calling user account as the owner. After this you will be unable to create another organization, and you will have full management access to the organization you just created.

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>name</b> | String | The name of the organization.

## POST register user

```go
Golang code here.
```

```python
Python code here.
```

```javascript
handleRegister = (username, password, email, orgname) => () => {

        var data = new FormData();
        data.append("username", username);
        data.append("password", password);
        data.append("email_address", email);
        data.append("organization_name", orgname);
        \
        var xhr = new XMLHttpRequest();
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

        xhr.open("POST", "https://api.temporal.cloud/v2/org/register/user");
        xhr.setRequestHeader("Cache-Control", "no-cache");
        xhr.send(data);

    };
```

> Example Response (200)

```
{
    "code": 200,
    "response": {
        "ID": 22,
        "CreatedAt": "2019-10-31T01:16:57.828295Z",
        "UpdatedAt": "2019-10-31T01:16:57.87117814Z",
        "DeletedAt": null,
        "UserName": "postables+org99999",
        "EmailAddress": "postables+org99999@rtradetechnologies.com",
        "AccountEnabled": true,
        "EmailEnabled": false,
        "EmailVerificationToken": "scrubbed",
        "AdminAccess": false,
        "HashedPassword": "scrubbed",
        "Free": true,
        "Credits": 0,
        "CustomerObjectHash": "zdpuAnUGSDoNQoHQ2jpjhPePHEvg26mYLsAAGxr4jkzCWUpde",
        "Organization": "myTestOrganizationnnnn",
        "IPFSKeyNames": null,
        "IPFSKeyIDs": null,
        "IPFSNetworkNames": null,
        "Status": "by continuing to use this service you agree to be bound by the following api terms and service https://gateway.temporal.cloud/ipns/docs.ts.temporal.cloud"
    }
}
```

`https://api.temporal.cloud/v2/org/register/user`

Registers your information for the `POST login` call, which is used to generate the JWT (JSON Web Token) we use for API authentication. Additionally this user will be rgistered as part of the specified organization, and all storage costs will be applied to the organization. The field `status` within the `response` object, is used to display the terms and service URL associated with the API, that will change depending on usage of either the production, or development API. The values of `EmailVerificationToken` and `HashedPassword` are scrubbed before the response is sent.

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>username</b> | String | Your desired username.
| <b>password</b> | String | Your desired password.
| <b>email_address</b> | String | An associated e-mail address.
| <b>organization_name</b> | String | The organization to register this user under.

### Response (200)

| Field | Type | Description
|-----------|------|-------------
| <b>ID</b> | Int | The unique ID of your registration.
| <b>CreatedAt</b> | DateTime | Time the account was created.
| <b>UpdatedAt</b> | DateTime | Time the account was last updated.
| <b>DeletedAt</b> | DateTime | Time the account was deleted.
| <b>Username</b> | String | Your username.
| <b>EmailAddress</b> | String | Your e-mail address.
| <b>AccountEnabled</b> | Bool | Your account status.
| <b>EmailEnabled</b> | Bool | Your e-mail notification status.
| <b>EmailVerificationToken</b> | String | Sent via e-mail to confirm association.
| <b>AdminAccess</b> | Bool | Your admin status.
| <b>HashedPassword</b> | String | The hash of your password
| <b>Free</b> | Bool | Indicates if the account is free tier 
| <b>Credits</b> | Int | Your starting credits.
| <b>CustomerObjectHash</b> | String | IPLD object of your uploads (not yet implemented)
| <b>IPFSKeyNames</b> | Array[String] | IPFS key names associated with your account.
| <b>IPFSKeyIDs</b> | Array[String] | IPFS key values associated with your account.
| <b>IPFSNetworkNames</b> | Array[String] | Private IPFS networks associated with your account.
| <b>Status</b> | String | Terms And Service link

## POST user uploads

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
TODO
```

`https://api.temporal.cloud/v2/org/user/uploads`

Allows viewing the uploads for any given user in your organization, ad is the equivalent of the `get uploads` database call. Currently this call is limited to viewing one organization user at a time, but it's easily scriptable.

Because the payload from this API can be quite large, there are two ways to control the response:

* Paginated results
* Complete user uploads returned as downloadable csv file

The parameters `page`, and `limit` are optional, and only have an effect when `as_csv` is set to false. When `as_csv` is set to false, and you do not provide `page` or `limit` the following defaults are used:

* `page` set to 1
* `limit` set to 10

To trigger paginated responses, leave `as_csv` empty, or set it to `false`. To trigger a downloadable csv file containing all the user's uploads, set `as_csv` to `true`.

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>name</b> | String | The name of the organization
| <b>user</b> | String | The name of the user to search for
| <b>as_csv</b> | Bool | When set to `true` the response comes as the csv file
| <i>page</i> | Integer | Upload page to start at (1 = first page) - optional
| <i>limit</i> | Integer | Maximum number of uploads to return - optional


## GET organization

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
    "response": {
        "ID": 6,
        "CreatedAt": "2019-10-31T01:14:00.062643Z",
        "UpdatedAt": "2019-10-31T01:16:57.868267Z",
        "DeletedAt": null,
        "Name": "myTestOrganizationnnnn",
        "UserOwner": "postables",
        "AccountBalance": 0,
        "RegisteredUsers": [
            "postables+org99999"
        ]
    }
}
```

`https://api.temporal.cloud/v2/org/get/model`

Returns the organization model associated with the accont. Note that this can only be ran by the `UserOwner` of an organization. If an account that is part of an organization which is not the `UserOwner` calls this, an error will be returned.

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>name</b> | String | The name of the organization.

## GET billing report

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
    "response": {
        "org_name": "myTestOrganizationnnnn",
        "items": null,
        "amount_due": 0,
        "time": 1572495932811044601
    }
}
```

`https://api.temporal.cloud/v2/org/get/billing/report`

Returns a billing report of all users, uploads, and currently active storage costs for the specified date range. If you specify 30 for `number_of_days` then we will get the last 30 days from when the API call is processed. If you specify 5, then we will get the last 5 days from when the API call is processed.

The idea behind this is that you can stay up to date with the usage of your organization accounts, and not have any surprises when we send you the invoice.

### Parameters

| Field | Type | Description
|-----------|------|-------------
| <b>name</b> | String | The name of the organization
| <b>number_of_days</b> | Integer | The amount of days to cover in report