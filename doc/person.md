# Person Resource

## Retreive a list of People

### HTTP Method

`GET`

### HTTP URI

`/api/v1/people`

### Params

* `page` - The page number, defaults to 0
* `per_page` - Number of entries to display, defaults to 10

### Example Request

```
GET /api/v1/people?page=3&per_page=2
```

### Request Body

None

### Response Status

`200`

### Response Body

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

## Create a new person

### HTTP Method

`POST`

### HTTP URI

`/api/v1/people`

### Example Request

```
POST /api/v1/people
```

### Request Body

```json
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

### Response Status

`201`

### Response Header

`Location: /api/v1/people/123`

The response header contains the location of the created resource.

### Response Body

none

## Update a person

### HTTP Method

`PUT`

### HTTP URI

`/api/v1/people/<id>`

### Example Request

```
PUT /api/v1/people/1234
```

### Request Body

```json
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

### Response Status

204

### Response Body

none

## Delete an existing person

### HTTP Method

`DELETE`

### HTTP URI

`/api/v1/people/<id>`

### Example Request

```
DELETE /api/v1/people/1234
```

### Response Status

`204`

### Response Body

none
