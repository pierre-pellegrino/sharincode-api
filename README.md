# HEROKU PRODUCTION LINK (main branch)

https://snipshare-api.herokuapp.com/

# HEROKU STAGING LINK (development branch)

https://snipshare-api-staging.herokuapp.com/

## ENDPOINTS

### Register
Method: POST 
Endpoint: /users 
Payload :
```json
{
  "user": {
    "email": "",
    "password": ""
  }
}
```

### Login

Method: POST 
Endpoint: /users/sign_in 
Payload :
```json
{
  "user": {
    "email": "",
    "password": ""
  }
}
```


### Logout (AUTH required)

Method: DELETE 
Endpoint: /users/sign_out

### Show User (AUTH required)

Method: GET 
Endpoint: /profiles

### Update User (AUTH required)

Method: PATCH
Endpoint: /profiles/:id 
Payload:
```json
{
  "user": {
    "username": "",
    "description": "",
    "github_url": "",
    "personal_url": "",
    "favorite_theme": ""
  }
}
```


### See Posts list

Method: GET 
Endpoint: /posts 
Returns:

```json
{
  "posts": [
    {
      "post": {
        "id": "",
        "description": "",
        "created_at": "",
        "updated_at": "",
        "user": {
          "username": "",
          "avatar": ""
        },
        "snippets": [
          {
            "id": "",
            "content": "",
            "post_id": "",
            "created_at": "",
            "updated_at": "",
            "language": ""
          },
          {
            ...
          }
        ],
        "comments": [
          {
            "comment": {
              "id": "",
              "content": "",
              "created_at": "",
              "updated_at": "",
              "username": "",
              "avatar": ""
            }
          }
        ]
      }
    }
  ]
}
```

### Get one Post

Method: GET 
Endpoint: /posts/:id 
Returns:

```json
{
  "post": {
    "id": 1,
    "description": "Calculates the average of an array, after mapping each element to a value using the provided function.\n\n    Use Array.prototype.map() to map each element to the value returned by fn.\n    Use Array.prototype.reduce() to add each value to an accumulator, initialized with a value of 0.\n    Divide the resulting array by its length.",
    "created_at": "2022-03-17T14:46:24.612Z",
    "updated_at": "2022-03-17T14:46:24.612Z",
    "user": {
      "username": "The Front Maniac",
      "avatar": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--058f6636aca22bf22170eb9ea69aa15469b47f17/avatar.jpg"
    },
    "snippets": [
      {
        "id": 41,
        "content": "const averageBy = (arr, fn) =>\n    arr\n      .map(typeof fn === 'function' ? fn : val => val[fn])\n      .reduce((acc, val) => acc + val, 0) / arr.length;\n\n    averageBy([{ n: 4 }, { n: 2 }, { n: 8 }, { n: 6 }], o => o.n); // 5\n    averageBy([{ n: 4 }, { n: 2 }, { n: 8 }, { n: 6 }], 'n'); // 5",
        "post_id": 1,
        "created_at": "2022-03-17T14:46:25.407Z",
        "updated_at": "2022-03-17T14:46:25.407Z",
        "language": "[\"Markdown\"]"
      },
      {
        ...
      }
    ],
    "comments": [
      {
        "comment": {
          "id": 52,
          "content": "Perspiciatis blanditiis voluptatem. Odio debitis pariatur. Consequuntur voluptas temporibus.",
          "created_at": "2022-03-17T14:46:26.840Z",
          "updated_at": "2022-03-17T14:46:26.840Z",
          "username": "The Awakening Sleeper",
          "avatar": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--543b39388f0230904c374c1c0d1aa78af1c700a3/avatar.jpg"
        }
      },
      {
      ...
      }
    ]
  }
}
```

### Create Post (AUTH required)

Method: POST 
Endpoint: /posts 
Payload:
```json
{
  "description": "",
  "snippets": [
    {
      "content": "",
      "language": ""
    },
    {
      "content": "",
      "language": ""
    }
  ],
  "tags": [
    "",
    ""
  ]
}

```

### See Tags list

Method: GET 
Endpoint: /tags

### Create Tag (AUTH required)

Method: POST 
Endpoint: /tags 
Payload:
```json
{
  "title": ""
}
```

### Create New Comment (AUTH required)

Method: POST
Endpoint: /posts/:post_id/comments
Payload:
```json
{
  "content": ""
}
```
