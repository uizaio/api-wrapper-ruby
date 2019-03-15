## Callback
Callback used to retrieve an information for Uiza to your server, so you can have a trigger notice about an entity is upload completed and .

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Callback).

## Create a callback
This API will allow you setup a callback to your server when an entity is completed for upload or public

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Callback-create_entity_callback).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

params = {
  url: "https://callback-url.uiza.co",
  method: "POST"
}

begin
  callback = Uiza::Callback.create params
  puts callback.id
  puts callback.url
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
    "id": "37b3b1fe-c73d-4a7c-8e6b-108d6a251b7b",
    "url": "https://61b2923c-b7fd-4186-ac7d-cb4bbd6480e0.uiza.co",
    "headersData": nil,
    "jsonData": nil,
    "method": "POST",
    "status": 1,
    "createdAt": "2019-03-13T09:32:39.000Z",
    "updatedAt": "0000-00-00 00:00:00"
  },
  "version": 4,
  "datetime": "2019-03-13T12:36:37.811Z",
  "policy": "public",
  "requestId": "7f8931e6-4d5b-459d-b107-94043494516a",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Retrieve a callback
Retrieves the details of an existing callback.

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Callback-get_entity_callback).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

begin
  callback = Uiza::Callback.retrieve "your-callback-id"
  puts callback.id
  puts callback.url
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
    "id": "37b3b1fe-c73d-4a7c-8e6b-108d6a251b7b",
    "url": "https://61b2923c-b7fd-4186-ac7d-cb4bbd6480e0.uiza.co",
    "headersData": nil,
    "jsonData": nil,
    "method": "POST",
    "status": 1,
    "createdAt": "2019-03-13T09:32:39.000Z",
    "updatedAt": "0000-00-00 00:00:00"
  },
  "version": 4,
  "datetime": "2019-03-13T12:36:37.811Z",
  "policy": "public",
  "requestId": "7f8931e6-4d5b-459d-b107-94043494516a",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Update a callback
This API will allow you setup a callback to your server when an entity is completed for upload or public

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Callback-update_entity_callback).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

params = {
  id: "your-callback-id",
  url: "https://callback-url.uiza.co",
  method: "GET"
}

begin
  callback = Uiza::Callback.update params
  puts callback.id
  puts callback.url
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
    "id": "37b3b1fe-c73d-4a7c-8e6b-108d6a251b7b",
    "url": "https://update-callback-url.uiza.co",
    "headersData": nil,
    "jsonData": nil,
    "method": "POST",
    "status": 1,
    "createdAt": "2019-03-13T09:32:39.000Z",
    "updatedAt": "0000-00-00 00:00:00"
  },
  "version": 4,
  "datetime": "2019-03-13T12:39:35.619Z",
  "policy": "public",
  "requestId": "c3ad45c8-d022-4dbe-8161-5c140ea2ea7f",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Delete a callback
Delete an existing callback.

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Callback-delete_entity_callback).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

begin
  callback = Uiza::Callback.delete "your-callback-id"
  puts callback.id
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
    "id": "37b3b1fe-c73d-4a7c-8e6b-108d6a251b7b"
  },
  "version": 4,
  "datetime": "2019-03-13T12:41:10.784Z",
  "policy": "public",
  "requestId": "4b89d46a-c7e4-4f97-8ebb-fb5b769b7fda",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```
