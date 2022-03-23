# HEROKU PRODUCTION LINK (main branch)

https://snipshare-api.herokuapp.com/

# HEROKU STAGING LINK (development branch)

https://snipshare-api-staging.herokuapp.com/



# ENDPOINTS

## USERS

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

### Show current User (AUTH required)
Method: GET 
Endpoint: /profile

### Show a Profile (AUTH required)
Method: GET 
Endpoint: /profiles/:id

### Update User (AUTH required)
Method: PATCH
Endpoint: /profile
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

### Delete User (AUTH required)
Method: DELETE 
Endpoint: /profile


## POSTS

### List all Posts
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

### Show a Post
Method: GET 
Endpoint: /posts/:id 
Returns:

```json
{
  "post": {
    "id": 1,
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
      }
    ],
    "comments": [
      {
        "comment": {
          "id": 52,
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
```

### Create a Post (AUTH required)
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

### Update a Post (AUTH required)
Method: PATCH 
Endpoint: /posts/:id 
Payload:
```json
{
  "description": "",
  "snippets": [
    {
      "content": "",
      "language": "",
      "id": ""
    }
  ],
  "tags": [
    ""
  ]
}  
```

### Delete a Post (AUTH required)
Method: DELETE 
Endpoint: /posts/:id 


## TAGS

### List all Tags
Method: GET 
Endpoint: /tags

### Create a Tag (AUTH required)
Method: POST 
Endpoint: /tags 
Payload:
```json
{
  "title": ""
}
```

## COMMENTS

### List all Comments
Method: GET 
Endpoint: /comments

### Create a Comment (AUTH required)
Method: POST
Endpoint: /posts/:post_id/comments
Payload:
```json
{
  "content": ""
}
```

## REACTIONS

### List all Reactions
Method: GET 
Endpoint: /reactions

### Create a Reaction (AUTH required)
Method: POST
Endpoint: /posts/:post_id/post_reactions
Payload:
```json
{
  "name": ""
}
```

### Delete a Reaction (AUTH required)
Method: DELETE 
Endpoint: /posts/:post_id/post_reactions 