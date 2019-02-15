## Category
Category has been splits into 3 types: folder, playlist and tag. These will make the management of entity more easier.

See details [here](https://docs.uiza.io/#category).

## Create category
Create category for entity for easier management.\
Category use to group all the same entities into a group (like Folder/ playlist/or tag).

See details [here](https://docs.uiza.io/#create-category).

```ruby
require "uiza"
require "json"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {
  name: "Folder sample",
  type: "folder",
  description: "Folder description",
  icon: "https://example.com/icon.png"
}
response = Uiza::Category.create params
response = JSON.parse response
response["data"]["id"]
```

## Retrieve category
Get detail of category.

See details [here](https://docs.uiza.io/?shell#retrieve-category).

```ruby
require "uiza"
require "json"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

response = Uiza::Category.retrieve "your-category-id"
response = JSON.parse response
response["data"]["id"]
response["data"]["name"]
```
