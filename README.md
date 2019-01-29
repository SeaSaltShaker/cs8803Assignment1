# cs8803Assignment1
Remember to update the acceptable connections list in Mongo Atlas.

I'm not sure it will work off campus.

To run the server, navigate to the Backend folder and run "node server.js"

So far, the only database has to do with users.
A user has a unique identifier, and an array of strings called "past_restaurants"

The current commands that are available are:
POST http://localhost:8080/api/users
-This creates a new user. When the JSON response is received, save the 
_id in the client side. You will need it.

GET http://localhost:8080/api/users
-This returns the list of users.

GET http://localhost:8080/api/users/:user_id
-This returns a specific user matching the user_id

PUT http://localhost:8080/api/users/:user_id
-Sending a JSON with "past_restaurants": "String" will push "String"
to the end of the past_restaurants array.

DELETE http://localhost:8080/api/users/:user_id
-This will delete a specific user from the database

