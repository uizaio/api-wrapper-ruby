## User Management
You can manage user with APIs user. Uiza have 2 levels of user:
  Admin - This account will have the highest priority, can have permission to create & manage users.
  User - This account level is under Admin level. It only manages APIs that relates to this account.

 See details [here](https://docs.uiza.io/#user-management).

 ## Retrieve an user
Retrieves the details of an existing user.
You need only supply the unique userId that was returned upon user creation.

 See details [here](https://docs.uiza.io/#retrieve-an-user).

 ```ruby
 Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"
 begin
  user = Uiza::User.retrieve "your-user-id"
  puts user.id
  puts user.username
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

 Example Response
```json
{
  "data": {
    "id": "fc1e299b-be9f-40d7-9413-1850e6feb1df",
    "email": "vugakl12@gmail.com",
    "dob": nil,
    "name": nil,
    "status": 1,
    "avatar": nil,
    "createdAt": "2019-03-13T11:39:18.000Z",
    "updatedAt": "2019-03-13T11:39:18.000Z"
  },
  "version": 4,
  "datetime": "2019-03-13T12:58:10.973Z",
  "policy": "public",
  "requestId": "da58224d-a431-4b3a-bac5-141ab03d0052",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

 ## List all users
Returns a list of your user. The users are returned sorted by creation date, with the most recent user appearing first.
If you use Admin token, you will get all the user.
If you use User token, you can only get the information of that user

 See details [here](https://docs.uiza.io/#list-all-users).

 ```ruby
require "uiza"
 Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"
 params = {
  limit: 2
}
 begin
  users = Uiza::User.list params
  # params is optional
  # or users = Uiza::User.list
  puts users.first.id
  puts users.first.username
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

 Example Response
```json
{
  "data": [
    {
      "id": "fc1e299b-be9f-40d7-9413-1850e6feb1df",
      "email": "vugakl12@gmail.com",
      "dob": nil,
      "name": nil,
      "status": 1,
      "avatar": nil,
      "createdAt": "2019-03-13T11:39:18.000Z",
      "updatedAt": "2019-03-13T11:39:18.000Z"
    },
    {
      "id": "6a597947-83d0-4288-aa26-c32751e099f8",
      "email": "vu.nguyen.thanh1993@gmail.com",
      "dob": nil,
      "name": nil,
      "status": 1,
      "avatar": nil,
      "createdAt": "2019-03-13T11:17:48.000Z",
      "updatedAt": "2019-03-13T11:17:48.000Z"
    }
  ],
  "version": 4,
  "datetime": "2019-03-13T13:01:03.750Z",
  "policy": "public",
  "requestId": "e9e625ea-2bcf-44d1-b43e-d52a083f5831",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

 ## Update an user
Updates the specified user by setting the values of the parameters passed. Any parameters not provided will be left unchanged.

 See details [here](https://docs.uiza.io/#update-an-user).

 ```ruby
require "uiza"
 Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"
 params = {
  id: "your-user-id"
  status: 1,
  name: "user_test"
}
 begin
  user = Uiza::User.update params
  puts user.id
  puts user.username
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

 Example Response
```json
{
  "data": {
    "id": "fc1e299b-be9f-40d7-9413-1850e6feb1df",
    "email": "vugakl12@gmail.com",
    "dob": nil,
    "name": "user_test",
    "status": 1,
    "avatar": nil,
    "createdAt": "2019-03-13T11:39:18.000Z",
    "updatedAt": "2019-03-13T13:06:27.000Z"
  },
  "version": 4,
  "datetime": "2019-03-13T13:06:27.620Z",
  "policy": "public",
  "requestId": "8b0bbbd5-8699-4a69-a314-674ec9f23602",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

 ## Log Out
This API use to log out an user. After logged out, token will be removed.

 See details [here](https://docs.uiza.io/#log-out).

 ```ruby
require "uiza"
 Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"
 begin
  response = Uiza::User.logout
  puts response.message
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

 Example Response
```ruby
{
  "data": {
    "message": "success"
  },
  "message": "Logout success",
  "version": 4,
  "datetime": "2019-03-13T13:09:56.471Z",
  "policy": "public",
  "requestId": "b3609e7f-a02d-49cb-a6c0-dde57e49cca5",
  "serviceName": "api-v4",
  "code": 200,
  "type": "SUCCESS"
}
```
