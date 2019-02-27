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
require "json"

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
