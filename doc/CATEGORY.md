## Category
Category has been splits into 3 types: folder, playlist and tag.
These will make the management of entity more easier.

See details [here](https://docs.uiza.io/#category).

## Create category
Create category for entity for easier management.
Category use to group all the same entities into a group (like `Folder`/`playlist` or `tag`).

See details [here](https://docs.uiza.io/#create-category).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

params = {
  name: "Folder sample",
  type: "folder",
  description: "Folder description",
  orderNumber: 1,
  icon: "https://exemple.com/icon.png",
  slug: "Azx12da",
  status: 1
}

begin
  category = Uiza::Category.create params
  puts category.id
  puts category.name
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
    "id": "b62c676a-7370-4d57-960f-ff77cf3d8739",
    "name": "Folder sample",
    "description": "Folder description",
    "slug": "azx12da",
    "type": "folder",
    "orderNumber": 1,
    "icon": "https://exemple.com/icon.png",
    "status": 1,
    "createdAt": "2019-03-13T10:45:26.000Z",
    "updatedAt": "0000-00-00 00:00:00"
  },
  "version": 4,
  "datetime": "2019-03-13T10:45:26.237Z",
  "policy": "public",
  "requestId": "85b8dc0b-6b0b-42e8-ab70-ab9771e21d4a",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Retrieve category
Get detail of category.

See details [here](https://docs.uiza.io/?shell#retrieve-category).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

begin
  category = Uiza::Category.retrieve "your-category-id"
  puts category.id
  puts category.name
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
    "id": "b62c676a-7370-4d57-960f-ff77cf3d8739",
    "name": "Folder sample",
    "description": "Folder description",
    "slug": "azx12da",
    "type": "folder",
    "orderNumber": 1,
    "icon": "https://exemple.com/icon.png",
    "status": 1,
    "createdAt": "2019-03-13T10:45:26.000Z",
    "updatedAt": "0000-00-00 00:00:00"
  },
  "version": 4,
  "datetime": "2019-03-13T10:48:50.499Z",
  "policy": "public",
  "requestId": "bad8b2ca-ebf3-4815-9f1b-952ec394175c",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Retrieve category list
Get all category.

See details [here](https://docs.uiza.io/#retrieve-category-list).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

params = {
  page: 1,
  limit: 10
}

begin
  categories = Uiza::Category.list params
  # params is optional
  # or entities = Uiza::Category.list
  puts categories.first.id
  puts categories.first.name
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
      "id": "b62c676a-7370-4d57-960f-ff77cf3d8739",
      "name": "Folder sample",
      "description": "Folder description",
      "slug": "azx12da",
      "type": "folder",
      "orderNumber": 1,
      "icon": "https://exemple.com/icon.png",
      "status": 1,
      "createdAt": "2019-03-13T10:45:26.000Z",
      "updatedAt": "0000-00-00 00:00:00"
    },
    {
      "id": "dcaec097-7c2a-4792-9e20-727926ec6b3b",
      "name": "Folder sample",
      "description": "Folder description",
      "slug": "folder-sample",
      "type": "folder",
      "orderNumber": 0,
      "icon": nil,
      "status": 1,
      "createdAt": "2019-03-13T10:41:28.000Z",
      "updatedAt": "0000-00-00 00:00:00"
    }
  ],
  "metadata": {
    "total": 2,
    "result": 2,
    "page": 1,
    "limit": 20
  },
  "version": 4,
  "datetime": "2019-03-13T10:50:37.024Z",
  "policy": "public",
  "requestId": "0ad6ec82-7ff1-4bf4-87bb-28ea84f1055c",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Update category
Update information of category.

See details [here](https://docs.uiza.io/#update-category).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

params = {
  id: "your-category-id",
  name: "Folder sample edited"
}

begin
  category = Uiza::Category.update params
  puts category.id
  puts category.name
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
    "id": "b62c676a-7370-4d57-960f-ff77cf3d8739",
    "name": "Folder sample edited",
    "description": "Folder description",
    "slug": "folder-sample-edited",
    "type": "folder",
    "orderNumber": 1,
    "icon": "https://exemple.com/icon.png",
    "status": 1,
    "createdAt": "2019-03-13T10:45:26.000Z",
    "updatedAt": "0000-00-00 00:00:00"
  },
  "version": 4,
  "datetime": "2019-03-13T10:55:23.462Z",
  "policy": "public",
  "requestId": "65a2d0fc-b3aa-42eb-b93b-edbb52286691",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Delete category
Delete category.

See details [here](https://docs.uiza.io/#delete-category).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

begin
  category = Uiza::Category.delete "your-category-id"
  puts category.id
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
    "id": "b62c676a-7370-4d57-960f-ff77cf3d8739"
  },
  "version": 4,
  "datetime": "2019-03-13T10:58:05.997Z",
  "policy": "public",
  "requestId": "35b0f8c0-22b7-4bea-bdab-38ce6457b306",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Create category relation
Add relation for entity and category.

See details [here](https://docs.uiza.io/#create-category-relation).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

params = {
  entityId: "your-entity-id",
  metadataIds: ["your-category-id-1", "your-category-id-2"]
}

begin
  relations = Uiza::Category.create_relation params
  puts relations.first.id
  puts relations.first.entityId
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
      "id": "ac48b2e3-421f-4362-b46a-d217834acc78",
      "entityId": "ed9f5057-b05a-4499-92b4-d3cdba76d0ec",
      "metadataId": "a257d0b7-4a58-44ac-b2ff-0cb26006daa4"
    },
    {
      "id": "c1a9e68a-f1de-4a51-b625-03211fdec4fb",
      "entityId": "ed9f5057-b05a-4499-92b4-d3cdba76d0ec",
      "metadataId": "95b75a92-bd82-4b1f-8925-044caccc6663"
    }
  ],
  "metadata": {
    "total": 2,
    "result": 2,
    "page": 1,
    "limit": 20
  },
  "version": 4,
  "datetime": "2019-03-13T11:03:36.482Z",
  "policy": "public",
  "requestId": "d38329d2-a3bb-4444-ae91-af388316967f",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Delete category relation
Delete relation for entity and category.

See details [here](https://docs.uiza.io/#delete-category-relation).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

params = {
  entityId: "your-entity-id",
  metadataIds: ["your-category-id-1", "your-category-id-2"]
}

begin
  relations = Uiza::Category.delete_relation params
  puts relations.first.id
  puts relations.first.entityId
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
      "id": "ac48b2e3-421f-4362-b46a-d217834acc78",
      "entityId": "ed9f5057-b05a-4499-92b4-d3cdba76d0ec",
      "metadataId": "a257d0b7-4a58-44ac-b2ff-0cb26006daa4"
    },
    {
      "id": "c1a9e68a-f1de-4a51-b625-03211fdec4fb",
      "entityId": "ed9f5057-b05a-4499-92b4-d3cdba76d0ec",
      "metadataId": "95b75a92-bd82-4b1f-8925-044caccc6663"
    }
  ],
  "metadata": {
    "total": 2,
    "result": 2,
    "page": 1,
    "limit": 20
  },
  "version": 4,
  "datetime": "2019-03-13T11:05:19.156Z",
  "policy": "public",
  "requestId": "52b847af-f620-46c0-8673-a00ebbb59f31",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```
