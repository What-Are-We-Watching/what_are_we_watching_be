<h2> End Points </h2>
 
  <h4> Vote on a Movie </h4>

```
mutation vote($input: VoteInput!) {
  vote(input: $input) {
    eventMovie {
        eventId
        movieId
        vote
    }
  }
}

{
    "input": {
        "eventId": 1,
        "movieId": 1,
        "vote": "true"
    }
}


{
    "data": {
        "vote": {
            "eventMovie": {
                "eventId": 1,
                "movieId": 1,
                "vote": 9
            }
        }
    }
}
```
  
<h4> Create an Event </h4>

```
mutation createEvent($input: CreateEventInput!) {
  createEvent(input: $input) {
    event {
      date
      name
      userId
    }
  }
}


{
    "input": {
        "date": "2022-09-04",
        "name": "awesomeevent",
        "userId": 2
    }
}


{
    "data": {
        "createEvent": {
            "event": {
                "date": "2022-09-04T00:00:00Z",
                "name": "awesomeevent",
                "userId": 2
            }
        }
    }
}
```

<h4> Join an Event </h4>

```

mutation joinEvent($input: JoinEventInput!) {
  joinEvent(input: $input) {
    event {
      userId
      guestId
      id
      name
      status
	   }
  }
}


{
  "input": {
    "eventId": 1, 
    "userId": 2
  } 
}


{
    "data": {
        "joinEvent": {
            "event": {
                "userID": 1,
                "guestId": 2,
                "id": "1",
                "name": "event_1",
                "status": "1"
            }
        }
    }
}
```


<h4> Get Chunk </h4>

```
 query getChunk($eventId: ID!, $lastMovieId: ID!){
      getChunk (eventId: $eventId, lastMovieId: $lastMovieId){
        id
   		image
    	title
      }
}

{
        "eventId": "2",
        "lastMovieId": "4"
}

{
  "data": {
    "events": [
      {
        "date": "2023-06-23T12:00:00Z",
        "status": 0,
        "userId": 1,
        "guestId": 4,
        "movieSelectionId": null
      },
      {
        "date": "2023-06-23T12:00:00Z",
        "status": 0,
        "userId": 4,
        "guestId": 3,
        "movieSelectionId": null
      },
      {
        "date": "2023-06-23T12:00:00Z",
        "status": 0,
        "userId": 3,
        "guestId": 2,
        "movieSelectionId": null
      },
      {
        "date": "2023-06-23T12:00:00Z",
        "status": 0,
        "userId": 2,
        "guestId": 5,
        "movieSelectionId": null
      },
      {
        "date": "2023-06-23T12:00:00Z",
        "status": 0,
        "userId": 5,
        "guestId": 1,
        "movieSelectionId": null
      }
    ]
  }
}
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
