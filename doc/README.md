# API Documentation

NationBuilder offers a RESTful API that you can use to build great apps to
expand and interact with your existing nations.


## Basic Concept

Since this is an early preview of the API, only admin accounts have the
access to create, authenticate, and consume API at this moment, but this will
change in the future.

To start, you will need to create a new OAuth Application in your nation's control panel.


## Authentication

NationBuilder API's authentication system is built around
[Version 22 of The OAuth 2.0 Authorization Protocol](http://tools.ietf.org/html/draft-ietf-oauth-v2-22).
In order to consume the API, you will need to create a new OAuth Application in your nation's control
panel. Once you have done this, you will receive a Consumer Key and a Consumer Secret.

Listed below is the OAuth 2 authorize and token urls provided by NationBuilder API:

**Authorize URL**

```
https://<nation_slug>.nationbuilder.com/oauth/authorize
```

**Token URL**

```
https://<nation_slug>.nationbuilder.com/oauth/token
```

NationBuilder API is known to work with the following clients:

* `oauth2` ruby gem



## Endpoints

NationBuilder API uses JSON as the transfer protocol. You will need to set the
following headers in addition to the OAuth2 Authorization Header to properly consume the API:

* `Accept: application/json`
* `Content-Type: application/json`

All endpoints are relative to the following url:

`https://<nation_slug>.nationbuilder.com`


### People Resource

#### `GET /api/v1/people`

This endpoint returns a list of people resource.

Example:

```
GET /api/v1/people?page=3&per_page=2
```

Results:

```json
{
  "page": 3,
  "total_pages": 6275,
  "per_page": 2,
  "total": 12549,
  "data": [
    {
      "id": 1,
      "first_name": "Ligeira",
      "last_name": "Cláudia",
      "email": null,
      "phone": null,
      "mobile": null
    },
    {
      "id": 2,
      "first_name": "bob",
      "last_name": "bobbert",
      "email": "bobby@bobster.com",
      "phone": null,
      "mobile": null
    }
  ]
}
```

**Params:**

* `page` - The page number, defaults to 0
* `per_page` - Number of entries to display, defaults to 10


#### `POST /api/v1/people`

Create a new person

Example:

```
POST /api/v1/people

{
  "person": {
    "first_name": "Aaron",
    "last_name": "Qian",
    "email": "aaron@nationbuilder.com",
    "phone": "888-888-8888",
    "mobile": "222-222-2222"
  }
}
```

Results:

```json
{
  "person": {
    "id": "1234",
    "first_name": "Aaron",
    "last_name": "Qian",
    "email": "aaron@nationbuilder.com",
    "phone": "888-888-8888",
    "mobile": "222-222-2222"
  }
}
```

#### `PUT /api/v1/people/<id>`

Update information regardng a person with specified id.

Example:

```
PUT /api/v1/people/1234

{
  "person": {
    "first_name": "Aaron",
    "last_name": "Qian",
    "email": "aaron@nationbuilder.com",
    "phone": "888-888-8888",
    "mobile": "222-222-2222"
  }
}
```

Results:

```json
{
  "person": {
    "id": "1234",
    "first_name": "Aaron",
    "last_name": "Qian",
    "email": "aaron@nationbuilder.com",
    "phone": "888-888-8888",
    "mobile": "222-222-2222"
  }
}
```

#### `DELETE /api/v1/people/<id>`

Deletes a person with specified id.

Example:

```
DELETE /api/v1/people/1234
```

### Survey

