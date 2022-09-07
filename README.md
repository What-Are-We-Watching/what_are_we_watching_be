<h3 align="center">What Are We Watching?</h3>

  <p align="center">
    What_are_we_watching_be(WAWWbe) is an api responsible for storing and providing user information, event information, and associating specified users and events.  WAWWbe also collects a large selection of movies from the external API,TheMovieDatabase and provides those movies in small batches such that they can be shuttled to the user, one at a time. The user votes on whether they would like to watch this movie. Once two users have joined an event and both vote yes on a particular movie, WAWWbe notifies the client and associates the movie, users and the event and can provide this compiled data.</p> 

---
    
### Setup of this application requires: <br>
<ul>
	<li>Creation of an API only Rails application</li>
	<li>Installation of all supporting dependencies and gems</li>
	<li>Installation of Graphql</li>
	<li>Creation and Customization of Postgres database</li>
</ul>
<br>
<h3> The following are a few syntax and content reminders that may save you time during your setup:</p> </h3>

* To create a new rails app that is api-only execute: 
```
rails _5.2.8_ new what_are_we_watching_be --api --database=postgresql -T --skip-turbo-links --skip-spring
```
* Edit your Gem file to include all desired gems

```
## Stack & Gems

* API mode
* Ruby 2.7.4
* Rails 5.2.8.1
* GraphQL
* Postgres
* Puma 3.11
* Handling CORS
* Bootsnap 1.1.0
* Faraday
* Figaro
* Simplecov
* Launchy
* Graphiql
* RSpec-Rails
* shoulda-matchers
* Pry
_(this list is representative of possible gems to utilize, it is not comprehensive)_
```

* Remember to the include the following into your rails_helper: 

```

Shoulda::Matchers.configure do |config|		require 'simplecov'
config.integrate do |with|			SimpleCov.start
with.test_framework :rspec
with.library :rails
end

```

* Install your gems

```

bundle install
bundle exec figaro install

```
## RSpec testing framework
* RSpec-Rails
* shoulda-matchers
* Pry


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

<h4> JoinEvent </h4>

```

mutation joinEvent($input: JoinEventInput!) {
  joinEvent(input: $input) {
    event {
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
    "userId": 1,
    "status": 1
  } 
}


{
    "data": {
        "joinEvent": {
            "event": {
                "guestId": 1,
                "id": "1",
                "name": "event_1"
                "status": "1"
            }
        }
    }
}
```
