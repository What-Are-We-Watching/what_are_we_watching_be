<h2> End Points </h2>
 
 <h4> Get Next Movie</h4>

```
query NextMovie ($userid: Userid!, $eventid: Eventid!) {
  user(userid: $userid) {
    event(eventid: $eventid)
 		title
 		overview
 		image
 		movieid
  }
}

{
  "userid": "12345",
  "eventid": "67890"
}

{
  "data": {
    "title": "Get Smart"
    "overview": "Blah blah blah"
    "image": "steve_carrell.jpg"
    "movieid": 211269
  }
}
```
  
<h4> Vote on a Movie </h4>

```
mutation MovieVote($vote: vote!, $userid: Userid!, $eventid: Eventid!, $movieid: Movieid!) {
  createVote(userid: $userid, eventid: $eventid, movieid: $movieid, vote: $vote) {
  	vote
  }
}

{
  "userid": "12345",
  "eventid": "67890"
  "movieid": "45450"
  "vote": "no"
}

{
  "data": {
	  "userid": "12345",
	  "eventid": "67890"
	  "movieid": "45450"
	  "vote": "no"
  }
}
```
  
<h4> Create an Event </h4>

```
mutation NewEvent($eventName: eventName!, $userid: Userid!) {
  createEvent(eventName: $eventName, userid: $userid) {
   	 eventname
	}
}

{
  "userid": "12345",
  "eventName": "Drew's movie Fest"
}

{
  "data": {
	  "userid": "12345",
	  "eventName": "Drew's Movie Fest"
  }
}
```

<h4> Join an Event </h4>

```
mutation JoinEvent($eventId: eventId!, $userid: Userid!) {
  JoinEvent(eventId: $eventId, userid: $userid) {
	}
}

{
  "userid": "12345",
  "eventId": "67890"
}

{
  "data": {
	  "userid": "12345",
	  "eventId": "67890"
  }
}
```

<h4> Create a user</h4>

```
mutation CreateUser($userName: userName!) {
  CreatUser(eventId: $userName, userName) {
	}
}

{
  "userName": "Drew123"
}

{
  "data": {
	  "userName": "Drew123"
  }
}
```
