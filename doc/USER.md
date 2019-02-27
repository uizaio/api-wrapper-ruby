## User Management
You can manage user with APIs user. Uiza have 2 levels of user:
  Admin - This account will have the highest priority, can have permission to create & manage users.
  User - This account level is under Admin level. It only manages APIs that relates to this account.

See details [here](https://docs.uiza.io/#user-management).

## Create an user
Create an user account for workspace

See details [here](https://docs.uiza.io/#create-an-user).

```ruby
Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {
  status: 1,
  username: "user_test",
  email: "user_test@uiza.io",
  password: "FMpsr<4[dGPu?B#u",
  gender: 0,
  dob: "05/15/2018",
  avatar: "https://exemple.com/avatar.jpeg",
  fullname: "User Test",
  isAdmin: 0
}

begin
  user = Uiza::User.create params
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
```ruby
{
  "id": "37d6706e-be91-463e-b3b3-b69451dd4752",
  "isAdmin": 0,
  "username": "user_test",
  "email": "user_test@uiza.io",
  "avatar": "https://exemple.com/avatar.jpeg",
  "fullname": "User Test",
  "updatedAt": "2018-06-22T18:05:47.000Z",
  "createdAt": "2018-06-22T18:05:47.000Z"
}
```

## Retrieve an user
Retrieves the details of an existing user.
You need only supply the unique userId that was returned upon user creation.

See details [here](https://docs.uiza.io/#retrieve-an-user).

```ruby

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
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
```ruby
{
  "id": "37d6706e-be91-463e-b3b3-b69451dd4752",
  "isAdmin": 0,
  "username": "user_test",
  "email": "user_test@uiza.io",
  "avatar": "https://exemple.com/avatar.jpeg",
  "fullname": "User Test",
  "updatedAt": "2018-06-22T18:05:47.000Z",
  "createdAt": "2018-06-22T18:05:47.000Z"
}
```

## List all users
Returns a list of your user. The users are returned sorted by creation date, with the most recent user appearing first.
If you use Admin token, you will get all the user.
If you use User token, you can only get the information of that user

See details [here](https://docs.uiza.io/#list-all-users).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

begin
  users = Uiza::User.list
  # or users = Uiza::User.list limit: 2, page: 2
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
```ruby
{
  "id": "1a95f752-19e0-4a2e-9951-6d1fc0adbeaf",
  "isAdmin": 0,
  "username": "user_test",
  "email": "user_test@uiza.io",
  "updatedAt": "2018-06-22T02:31:14.000Z",
  "createdAt": "2018-06-22T02:31:14.000Z"
},
{
  "id": "95c1229a-73e6-4ef7-98eb-e64a765c32d5",
  "isAdmin": 1,
  "username": "user_admin",
  "email": "user_admin@uiza.io",
  "updatedAt": "2018-06-22T00:00:00.000Z",
  "createdAt": "2018-06-22T02:32:29.000Z"
}
```