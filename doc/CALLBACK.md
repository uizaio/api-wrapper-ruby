## Callback
Callback used to retrieve an information for Uiza to your server, so you can have a trigger notice about an entity is upload completed and .

See details [here](https://docs.uiza.io/#callback).

## Retrieve a callback
Retrieves the details of an existing callback.

See details [here](https://docs.uiza.io/#retrieve-a-callback).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

begin
  callback = Uiza::Category.retrieve "your-callback-id"
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
```ruby
{
  "id": "0a6bf245-1cce-494f-a193-b5a44aa05558",
  "url": "https://callback-url.uiza.co",
  "headersData": null,
  "jsonData": {
    "text": "example callback"
  },
  "method": "POST",
  "status": 1,
  "createdAt": "2018-06-23T01:27:08.000Z",
  "updatedAt": "2018-06-23T01:27:08.000Z"
}
```
