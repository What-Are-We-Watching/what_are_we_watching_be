<h2> End Points </h2>
 
 <h4> Get Next Movie</h4>

```

```
  
<h4> Vote on a Movie </h4>

```

```
  
<h4> Create an Event </h4>

```

```

<h4> Join an Event </h4>

```

```

<h4> Create/login a user</h4>

```

mutation createUser($input: CreateUserInput!) {
  createUser(input: $input) {
    user {
      id
      name
    }
  }
}


{
    "input":{
        "name": "Spider Man"
    }
}


{
    "data": {
        "createUser": {
            "user": {
                "id": "24",
                "name": "Spider Man"
            }
        }
    }
}
```

<h4> Get all Events</h4>

```
{
  events {
    name
    date
    status
    userId
    guestId
    movieSelectionId
  }
}
```
