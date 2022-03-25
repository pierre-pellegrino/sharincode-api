# HEROKU PRODUCTION LINK (main branch)

https://snipshare-api.herokuapp.com/

# HEROKU STAGING LINK (development branch)

https://snipshare-api-staging.herokuapp.com/



# ENDPOINTS
## USERS

### Register
POST on /users with payload :
```json
{
  "user": {
    "email": "",
    "password": ""
  }
}
```

### Login
POST on /users/sign_in  with payload :
```json
{
  "user": {
    "email": "",
    "password": ""
  }
}
```

### Logout
DELETE on /users/sign_out with auth

### Show connected User
GET on /profile with Auth

### Show a User
GET on /profiles/:id with auth

### Update connected User
PATCH on /profile with auth and payload :
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

### Delete connected User
DELETE on /profile with auth


## POSTS

### List all Posts
GET on /posts 

### Show a Post
GET on /posts/:id 

### Create a Post
POST on /posts with auth and payload : 
```json
{
  "post": {
    "description": "",
    "snippets": [
      {
        "content": "",
        "language": ""
      }
    ],
    "tags": [
      ""
    ]
  }
}
```

### Update a Post
PATCH on /posts/:id with auth and payload :
```json
{
  "post": {
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
}  
```

### Delete a Post
DELETE on /posts/:id with auth 

## SNIPPETS

### Delete a Snippet
DELETE on /posts/:post_id/snippets/:snippet_id with auth 

## TAGS

### List all Tags
GET on /tags

### Create a Tag
POST on /tags with auth and payload :
```json
{
  "title": ""
}
```

## COMMENTS

### List all Comments
GET on /comments

### Create a Comment
POST on /posts/:post_id/comments with auth and payload :
```json
{
  "content": ""
}
```

### Update a Comment
PATCH on /posts/:post_id/comments/:comment_id with auth and payload :
```json
{
  "content": ""
}
```

### Delete a Comment
DELETE on /posts/:post_id/comments/:comment_id with auth

## REACTIONS

### List all Reactions
GET on /reactions

### Create a Reaction
POST on /posts/:post_id/post_reactions with auth and payload :
```json
{
  "name": ""
}
```

### Delete a Reaction
DELETE on /posts/:post_id/post_reactions with auth