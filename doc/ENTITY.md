## Entity
These below APIs used to take action with your media files (we called Entity).

See details [here](https://docs.uiza.io/#video).

## Create entity
Create entity using full URL. Direct HTTP, FTP or AWS S3 link are acceptable.

See details [here](https://docs.uiza.io/#create-entity).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

params = {
  name: "Sample Video",
  url: "https://example.com/video.mp4",
  inputType: "http",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  shortDescription: "Lorem Ipsum is simply dummy text.",
  poster: "https://example.com/picture001.jpeg",
  thumbnail: "https://example.com/picture002.jpeg"
}

begin
  entity = Uiza::Entity.create params
  puts entity.id
  puts entity.name
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
  "id": "16ab25d3-fd0f-4568-8aa0-0339bbfd674f",
  "name": "Sample Video",
  "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
  "shortDescription": "Lorem Ipsum is simply dummy text.",
  "view": 0,
  "poster": "https://example.com/picture001",
  "thumbnail": "https://example.com/picture002",
  "type": "vod",
  "status": 1,
  "duration": "237.865215",
  "publishToCdn":"success",
  "embedMetadata": {
    "artist": "John Doe",
    "album": "Album sample",
    "genre": "Pop"
  },
  "extendMetadata": {
    "movie_category":"action",
    "imdb_score":8.8,
    "published_year":"2018"
  },
  "createdAt": "2018-06-16T18:54:15.000Z",
  "updatedAt": "2018-06-16T18:54:29.000Z"
}
```

## Retrieve entity
Get detail of entity including all information of entity.

See details [here](https://docs.uiza.io/#retrieve-an-entity).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

begin
  entity = Uiza::Entity.retrieve "your-entity-id"
  puts entity.id
  puts entity.name
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
  "id": "16ab25d3-fd0f-4568-8aa0-0339bbfd674f",
  "name": "Sample Video",
  "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  "shortDescription": "Lorem Ipsum is simply dummy text.",
  "view": 0,
  "poster": "https://example.com/picture001",
  "thumbnail": "https://example.com/picture002",
  "type": "vod",
  "status": 1,
  "duration": "237.865215",
  "publishToCdn":"success",
  "embedMetadata": {
    "artist": "John Doe",
    "album": "Album sample",
    "genre": "Pop"
  },
  "extendMetadata": {
    "movie_category":"action",
    "imdb_score":8.8,
    "published_year":"2018"
  },
  "createdAt": "2018-06-16T18:54:15.000Z",
  "updatedAt": "2018-06-16T18:54:29.000Z"
}
```

## List all entities
Get list of entities including all detail.

See details [here](https://docs.uiza.io/#list-all-entities).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

params = {
  publishToCdn: "not-ready",
  metadataId: "your-folder/playlist-id"
}

begin
  entities = Uiza::Entity.list params
  # params is optional
  # or entities = Uiza::Entity.list
  puts entities.first.id
  puts entities.first.name
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
[
  {
    "id": "42ceb1ab-18ef-4f2e-b076-14299756d182",
    "name": "Sample Video 1",
    "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "shortDescription": "Lorem Ipsum is simply dummy text.",
    "view": 0,
    "poster": "https://example.com/picture001",
    "thumbnail": "https://example.com/picture002",
    "type": "vod",
    "duration": "237.865215",
    "publishToCdn":"success",
    "embedMetadata": {
      "artist": "John Doe",
      "album": "Album sample",
      "genre": "Pop"
    },
    "extendMetadata": {
      "movie_category":"action",
      "imdb_score":8.8,
      "published_year":"2018"
    },
    "createdAt": "2018-06-22T19:20:17.000Z",
    "updatedAt": "2018-06-22T19:20:17.000Z"
  },
  {
    "id": "64b15996-2261-4f41-a3c4-72b652323f67",
    "name": "Sample Video 2",
    "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "shortDescription": "Lorem Ipsum is simply dummy text.",
    "view": 0,
    "poster": "https://example.com/picture001",
    "thumbnail": "https://example.com/picture002",
    "type": "vod",
    "duration": "178.178105",
    "publishToCdn":"success",
    "embedMetadata": {
      "artist": "John Doe",
      "album": "Album sample",
      "genre": "Pop"
    },
    "extendMetadata": {
      "movie_category":"action",
      "imdb_score":8.8,
      "published_year":"2018"
    },
    "createdAt": "2018-06-22T19:16:22.000Z",
    "updatedAt": "2018-06-22T19:16:22.000Z"
  }
]
```

## Update entity
Update entity's information.

See details [here](https://docs.uiza.io/#update-an-entity).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

params = {
  id: "your-entity-id",
  name: "Name edited"
}

begin
  entity = Uiza::Entity.update params
  puts entity.id
  puts entity.name
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
  "id": "64b15996-2261-4f41-a3c4-72b652323f67",
  "name": "Sample Video",
  "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  "shortDescription": "Lorem Ipsum is simply dummy text.",
  "view": 0,
  "poster": "https://example.com/picture001",
  "thumbnail": "https://example.com/picture002",
  "type": "vod",
  "duration": "178.178105",
  "publishToCdn":"success",
  "embedMetadata": {
    "artist": "John Doe",
    "album": "Album sample",
    "genre": "Pop"
  },
  "extendMetadata": {
    "movie_category":"action",
    "imdb_score":8.8,
    "published_year":"2018"
  },
  "createdAt": "2018-06-22T19:16:22.000Z",
  "updatedAt": "2018-06-22T19:16:22.000Z"
}
```

## Delete entity
Delete entity.

See details [here](https://docs.uiza.io/#delete-an-entity).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

begin
  entity = Uiza::Entity.delete "your-entity-id"
  puts entity.id
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
  "id": "64b15996-2261-4f41-a3c4-72b652323f67"
}
```

## Search entity
Search entity base on keyword entered.

See details [here](https://docs.uiza.io/#search-entity).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

begin
  entities = Uiza::Entity.search "your-keyword"
  puts entities.first.id
  puts entities.first.name
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
[
  {
    "id": "42ceb1ab-18ef-4f2e-b076-14299756d182",
    "name": "Sample Video 1",
    "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "shortDescription": "Lorem Ipsum is simply dummy text.",
    "view": 0,
    "poster": "https://example.com/picture001",
    "thumbnail": "https://example.com/picture002",
    "type": "vod",
    "duration": "237.865215",
    "publishToCdn":"success",
    "embedMetadata": {
      "artist": "John Doe",
      "album": "Album sample",
      "genre": "Pop"
    },
    "extendMetadata": {
      "movie_category":"action",
      "imdb_score":8.8,
      "published_year":"2018"
    },
    "createdAt": "2018-06-22T19:20:17.000Z",
    "updatedAt": "2018-06-22T19:20:17.000Z"
  },
  {
    "id": "64b15996-2261-4f41-a3c4-72b652323f67",
    "name": "Sample Video 2",
    "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "shortDescription": "Lorem Ipsum is simply dummy text.",
    "view": 0,
    "poster": "https://example.com/picture001",
    "thumbnail": "https://example.com/picture002",
    "type": "vod",
    "duration": "178.178105",
    "publishToCdn":"success",
    "embedMetadata": {
      "artist": "John Doe",
      "album": "Album sample",
      "genre": "Pop"
    },
    "extendMetadata": {
      "movie_category":"action",
      "imdb_score":8.8,
      "published_year":"2018"
    },
    "createdAt": "2018-06-22T19:16:22.000Z",
    "updatedAt": "2018-06-22T19:16:22.000Z"
  }
]
```

## Publish entity to CDN
Publish entity to CDN, use for streaming.

See details [here](https://docs.uiza.io/#publish-entity-to-cdn).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

begin
  response = Uiza::Entity.publish "your-entity-id"
  puts response.message
  puts response.entityId
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
  "message": "Your entity started publish, check process status with this entity ID",
  "entityId": "42ceb1ab-18ef-4f2e-b076-14299756d182"
}
```

## Get status publish
Publish entity to CDN, use for streaming.

See details [here](https://docs.uiza.io/#get-status-publish).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

begin
  response = Uiza::Entity.get_status_publish "your-entity-id"
  puts response.progress
  puts response.status
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
  "progress": 0,
  "status": "processing"
}
```

## Get AWS upload key
This API will be return the bucket temporary upload storage & key for upload, so that you can push your file to Uiza’s storage and get the link for URL upload & create entity.

See details [here](https://docs.uiza.io/#get-aws-upload-key).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

begin
  response = Uiza::Entity.get_aws_upload_key
  puts response.bucket_name
  puts response.region_name
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
  "temp_expire_at": 1533658598,
  "temp_access_id": "ASIAV*******GPHO2DTZ",
  "bucket_name": "uiza****-storage-ap-southeast-1-01/upload-temp/****ff4ad74a5195f4c/",
  "temp_session_token": "FQo///wEaDM3rrospITbBQ==",
  "region_name": "ap-southeast-1",
  "temp_access_secret": "dp****cx2mE2lZxsSq7kV++vWSL6RNatAhbqc"
}
```
