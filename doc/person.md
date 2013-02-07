# Person Resource

## `GET /api/v1/people`

This endpoint returns a list of people resource.

### Example

```
GET /api/v1/people?page=3&per_page=2
```

### Results

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

### Params

* `page` - The page number, defaults to 0
* `per_page` - Number of entries to display, defaults to 10


## `POST /api/v1/people`

Create a new person

### Example

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

### Results

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

## `PUT /api/v1/people/<id>`

Update information regardng a person with specified id.

### Example

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

### Results

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

## `DELETE /api/v1/people/<id>`

Deletes a person with specified id.

### Example

```
DELETE /api/v1/people/1234
```