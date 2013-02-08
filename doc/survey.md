# Survey Resource

## Retreive a list of available Surveys

### HTTP Method

`GET`

### HTTP URI

`/api/v1/survey`

### Params

* `page` - The page number, defaults to 0
* `per_page` - Number of entries to display, defaults to 10

### Example Request

```
GET /api/v1/surveys?page=1&per_page=2
```

### Request Body

None

### Response Status

`200`

### Response Body

```json
{
  "page": 1,
  "total_pages": 1,
  "per_page": 2,
  "total": 1,
  "data": [
    {
      "id": 1,
      "slug": "survey",
      "site_slug": "abeforprez",
      "name": "Survey",
      "questions": [
        {
          "id": 1,
          "prompt": "What issue is more important to you?",
          "slug": "important_issue",
          "type": "multiple",
          "status": "published",
          "choices": [
            {
              "id": 2,
              "name": "Daily mail service to all homes. Yeah right....",
              "feedback": "really now...?"
            },
            {
              "id": 3,
              "name": "Opposition to any change in our naturalization laws",
              "feedback": null
            },
            {
              "id": 9,
              "name": "foobar",
              "feedback": "foobar"
            },
            {
              "id": 1,
              "name": "Kansas should be admitted as a state",
              "feedback": null
            }
          ]
        },
        {
          "id": 4,
          "prompt": "Do you support high speed trains to the sea?",
          "slug": "trains2",
          "type": "multiple",
          "status": "published",
          "choices": [
            {
              "id": 10,
              "name": "Yes, it is urgently needed.",
              "feedback": null
            },
            {
              "id": 11,
              "name": "Maybe, if it doesn't cost an arm and a leg.",
              "feedback": null
            },
            {
              "id": 12,
              "name": "No, I never even go to the sea.",
              "feedback": null
            }
          ]
        }
      ],
      "status": "published"
    }
  ]
}
```

## Create a new survey

### HTTP Method

`POST`

### HTTP URI

`/api/v1/survey`

### Example Request

```
POST /api/v1/survey
```

### Request Body

```json
{
  "survey": {
    "slug": "survey",
    "site_slug": "abeforprez",
    "name": "Survey",
    "questions": [{
      "prompt": "What issue is more important to you?",
      "slug": "important_issue",
      "type": "multiple",
      "status": "published",
      "choices": [{
        "name": "Daily mail service to all homes. Yeah right....",
        "feedback": "really now...?"
      }, {
        "name": "Opposition to any change in our naturalization laws",
        "feedback": null
      }, {
        "name": "foobar",
        "feedback": "foobar"
      }, {
        "name": "Kansas should be admitted as a state",
        "feedback": null
      }]
    }]
  }
}
```

Note: a survey can have a list of questions, and each question can have the following types: `multiple`, `yes_no`, `text`. Questions of type `multiple` can have a list of choices shown in the example above. `yes_no` and `text` questions does not contain choices.

### Response Status

`201`

### Response Header

`Location: /api/v1/survey/123`

The response header contains the location of the created resource.

### Response Body

none

## Update a survey

### HTTP Method

`PUT`

### HTTP URI

`/api/v1/survey/<id>`

### Example Request

```
PUT /api/v1/survey/1234
```

### Request Body

```json
{
  "survey": {
    "slug": "survey",
    "site_slug": "abeforprez",
    "name": "Survey",
    "questions": [{
      "id": "12",
      "prompt": "What issue is more important to you?",
      "slug": "important_issue",
      "type": "multiple",
      "status": "published",
      "choices": [{
        "id": "1",
        "name": "Daily mail service to all homes. Yeah right....",
        "feedback": "really now...?"
      }, {
        "id": "2",
        "name": "Opposition to any change in our naturalization laws",
        "feedback": null
      }, {
        "id": "3",
        "name": "foobar",
        "feedback": "foobar"
      }, {
        "id": "4",
        "name": "Kansas should be admitted as a state",
        "feedback": null
      }]
    }]
  }
}
```

Note: When updating a survey, Nested resources such as questions and choices are updated, created, or deleted according to the following rules:

* Existing nested resources not mentioned in the response body will be deleted.
* Nested resource is updated if an `id` attribute is supplied and the nested resource is found in your nation's database.
* The nested resource is ignored if an `id` attribute is supplied but is not found in your nation's database.
* The nested resource is created if no `id` attribute is supplied.


### Response Status

204

### Response Body

none

## Delete an existing survey

### HTTP Method

`DELETE`

### HTTP URI

`/api/v1/survey/<id>`

### Example Request

```
DELETE /api/v1/survey/1234
```

### Response Status

`204`

### Response Body

none
