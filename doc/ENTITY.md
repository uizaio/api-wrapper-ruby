## Entity
These below APIs used to take action with your media files (we called Entity).

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media).

## Create entity
Create entity using full URL. Direct HTTP, FTP or AWS S3 link are acceptable.

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media-create_entity).

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
```json
{
  "data": {
    "id": "0df49126-e2c5-44b3-ad4e-6150a071f6a5",
    "name": "Sample Video",
    "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "shortDescription": "Lorem Ipsum is simply dummy text.",
    "inputType": "http",
    "url": "https://example.com/video.mp4",
    "masterTaskId": "1d8d07c2-0aad-4a20-be41-7842ea77e13f",
    "masterProgress": nil,
    "standardTaskId": nil,
    "standardProgress": nil,
    "view": "0",
    "poster": "https://example.com/picture001.jpeg",
    "thumbnail": "https://example.com/picture002.jpeg",
    "type": "vod",
    "status": "1",
    "duration": nil,
    "readyToPublish": "off",
    "embedMetadata": nil,
    "extendMetadataId": nil,
    "publishToCdn": "not-ready",
    "extendMetadata": nil,
    "createdAt": "2019-03-13T10:01:57.000Z",
    "updatedAt": "2019-03-13T10:01:58.000Z"
  },
  "version": "4",
  "datetime": "2019-03-13T10:01:58.376Z",
  "policy": "public",
  "requestId": "64984a20-cc5a-4748-bf8c-bc2a920bd3d4",
  "serviceName": "api-v4",
  "message": "OK",
  "code": "200",
  "type": "SUCCESS"
}
```

## Retrieve entity
Get detail of entity including all information of entity.

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media-get_entity).

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
```json
{
  "data": {
    "id": "0df49126-e2c5-44b3-ad4e-6150a071f6a5",
    "name": "Sample Video",
    "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "shortDescription": "Lorem Ipsum is simply dummy text.",
    "inputType": "http",
    "url": "https://example.com/video.mp4",
    "masterTaskId": "1d8d07c2-0aad-4a20-be41-7842ea77e13f",
    "masterProgress": nil,
    "standardTaskId": nil,
    "standardProgress": nil,
    "view": 0,
    "poster": "https://example.com/picture001.jpeg",
    "thumbnail": "https://example.com/picture002.jpeg",
    "type": "vod",
    "status": 1,
    "duration": nil,
    "readyToPublish": "off",
    "embedMetadata": nil,
    "extendMetadataId": nil,
    "publishToCdn": "not-ready",
    "extendMetadata": nil,
    "createdAt": "2019-03-13T10:01:57.000Z",
    "updatedAt": "2019-03-13T10:01:58.000Z"
  },
  "version": 4,
  "datetime": "2019-03-13T10:13:14.125Z",
  "policy": "public",
  "requestId": "42302668-e146-456d-a0da-09e4dc73ea64",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## List all entities
Get list of entities including all detail.

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media-get_entity).

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
```json
{
  "data": [
    {
      "id": "0df49126-e2c5-44b3-ad4e-6150a071f6a5",
      "name": "Sample Video",
      "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "shortDescription": "Lorem Ipsum is simply dummy text.",
      "inputType": "http",
      "url": "https://example.com/video.mp4",
      "masterTaskId": "1d8d07c2-0aad-4a20-be41-7842ea77e13f",
      "masterProgress": nil,
      "standardTaskId": nil,
      "standardProgress": nil,
      "view": 0,
      "poster": "https://example.com/picture001.jpeg",
      "thumbnail": "https://example.com/picture002.jpeg",
      "type": "vod",
      "status": 1,
      "duration": nil,
      "readyToPublish": "off",
      "embedMetadata": nil,
      "extendMetadataId": nil,
      "publishToCdn": "not-ready",
      "extendMetadata": nil,
      "createdAt": "2019-03-13T10:01:57.000Z",
      "updatedAt": "2019-03-13T10:01:58.000Z"
    },
    {
      "id": "27c5b023-ae06-4d8e-98ad-b0b66fbafe1c",
      "name": "Sample Video",
      "description": nil,
      "shortDescription": nil,
      "inputType": "http",
      "url": nil,
      "masterTaskId": "6ffe7f37-6960-4473-a245-675c949344c1",
      "masterProgress": nil,
      "standardTaskId": nil,
      "standardProgress": nil,
      "view": 0,
      "poster": nil,
      "thumbnail": nil,
      "type": "vod",
      "status": 1,
      "duration": nil,
      "readyToPublish": "off",
      "embedMetadata": nil,
      "extendMetadataId": nil,
      "publishToCdn": "not-ready",
      "extendMetadata": nil,
      "createdAt": "2019-03-13T09:59:27.000Z",
      "updatedAt": "2019-03-13T09:59:28.000Z"
    }
  ],
  "metadata": {
    "total": 2,
    "result": 2,
    "page": 1,
    "limit": 20
  },
  "version": 4,
  "datetime": "2019-03-13T10:15:36.266Z",
  "policy": "public",
  "requestId": "d260ab6c-da8a-4d13-8c58-5fb1cd0940df",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Update entity
Update entity's information.

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media-update_entity).

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
```json
{
  "data": {
    "id": "0df49126-e2c5-44b3-ad4e-6150a071f6a5",
    "name": "Sample Video Updated",
    "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "shortDescription": "Lorem Ipsum is simply dummy text.",
    "inputType": "http",
    "url": "https://example.com/video.mp4",
    "masterTaskId": "1d8d07c2-0aad-4a20-be41-7842ea77e13f",
    "masterProgress": nil,
    "standardTaskId": nil,
    "standardProgress": nil,
    "view": 0,
    "poster": "https://example.com/picture001.jpeg",
    "thumbnail": "https://example.com/picture002.jpeg",
    "type": "vod",
    "status": 1,
    "duration": nil,
    "readyToPublish": "off",
    "embedMetadata": nil,
    "extendMetadataId": nil,
    "publishToCdn": "not-ready",
    "extendMetadata": nil,
    "createdAt": "2019-03-13T10:01:57.000Z",
    "updatedAt": "2019-03-13T10:18:42.000Z"
  },
  "version": 4,
  "datetime": "2019-03-13T10:18:42.749Z",
  "policy": "public",
  "requestId": "f1db5769-e049-492d-a185-6b69750e94c4",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Delete entity
Delete entity.

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media-delete_entity).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
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
```json
{
  "data": {
    "id": "0df49126-e2c5-44b3-ad4e-6150a071f6a5"
  },
  "version": 4,
  "datetime": "2019-03-13T10:20:41.516Z",
  "policy": "public",
  "requestId": "aa4afcef-1af4-4e4d-a248-221e50e99c37",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Search entity
Search entity base on keyword entered.

See details [here](https://docs.uiza.io/#search-entity).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
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
```json
{
  "data": [
    {
      "id": "ff8bbadf-4028-49c1-9607-1fca6f16eda7",
      "name": "Sample Video",
      "description": nil,
      "shortDescription": nil,
      "view": 0,
      "poster": nil,
      "thumbnail": nil,
      "type": "vod",
      "duration": nil,
      "embedMetadata": nil,
      "extendMetadata": nil,
      "publishToCdn": "not-ready",
      "readyToPublish": "off",
      "createdAt": "2019-03-07T06:34:36.000Z",
      "updatedAt": "2019-03-07T06:34:38.000Z",
      "keySearch": "sample video"
    },
    {
      "id": "0268713a-654f-46dd-a1fc-475e9f552c27",
      "name": "Sample Video",
      "description": nil,
      "shortDescription": nil,
      "view": 0,
      "poster": nil,
      "thumbnail": nil,
      "type": "vod",
      "duration": nil,
      "embedMetadata": nil,
      "extendMetadata": nil,
      "publishToCdn": "not-ready",
      "readyToPublish": "off",
      "createdAt": "2019-03-11T02:40:30.000Z",
      "updatedAt": "2019-03-11T02:40:35.000Z",
      "keySearch": "sample video"
    }
  ],
  "metadata": {
    "total": 2,
    "result": 2,
    "page": 1,
    "limit": 20
  },
  "version": 4,
  "datetime": "2019-03-13T10:22:16.306Z",
  "policy": "public",
  "requestId": "8ae2770b-ccf8-4ac5-a95a-0beeea2617d7",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Publish entity to CDN
Publish entity to CDN, use for streaming.

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media-post_transcode_standard).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
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
```json
{
  "data": {
    "message": "Your entity started publish, check process status with this entity ID",
    "entityId": "ff8bbadf-4028-49c1-9607-1fca6f16eda7"
  },
  "message": "create transcode standard success",
  "version": 4,
  "datetime": "2019-03-13T10:24:42.290Z",
  "policy": "public",
  "requestId": "b9e6eb20-44a1-4259-b79f-a6f7353f87e4",
  "serviceName": "api-v4",
  "code": 200,
  "type": "SUCCESS"
}
```

## Get status publish
Publish entity to CDN, use for streaming.

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media-get_publish_cdn_status).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
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
```json
{
  "data": {
    "progress": 0,
    "status": "error"
  },
  "version": 4,
  "datetime": "2019-03-13T10:28:06.627Z",
  "policy": "public",
  "requestId": "85f48b9f-9da5-466b-bbcd-900f7404bfc8",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Get AWS upload key
This API will be return the bucket temporary upload storage & key for upload, so that you can push your file to Uiza’s storage and get the link for URL upload & create entity.

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-App-get_aws_key).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
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
```json
{
  "data": {
    "temp_access_secret": "9QCYHLhkHKMkAdKTtQRZN1JIUZbSESpCz9dVoY8H",
    "temp_access_id": "ASIAY2CULXKDEY4IWY5O",
    "temp_session_name": "uiza-prod-ss-d6342a7b4a6c40d2b851a54a4442ea83-1552472928",
    "bucket_name": "uiza-stag-storage-ap-southeast-1-01/upload-temp/d6342a7b4a6c40d2b851a54a4442ea83/",
    "temp_expire_at": 1552516128,
    "region_name": "ap-southeast-1",
    "app_id": "d6342a7b4a6c40d2b851a54a4442ea83",
    "temp_session_token": "FQoGZXIvYXdzEBwaDHx4CZkwAjRDWCpHOiKPBPd/3UjRqs9uSauIEiEpcGWrNDqOO8JqitvsQY4ImUurCfHXqgn8yf3T7lFqvB/TjLJXqBw/HUiAVUWcHtJRGQug+T/5fGFP68waMU8n70TMKDVV0xolPxJONvaN6tG9DFVtp09g4azOGpJFL0QKXt2Ou0BYENXyE0liIu6A2z5VS9mhLqLfVu/BGCfI6JhQVTudJPuYom7FV4uwn3TlVbElfRW5UK9iPCym8sb0Kg7DWo+aUTMOPkt8d6xh6zrRysGceuyCuKLePGggxFXWvf8rooLj4xQZk7yYJfDA98Zryox/zgGWyhAotUW/zj/BBwsafTjByTx8mskXZ+7+Uuiwbc8BoKUzq56UI36RpvP2mqimGZp97xJI+GTkG7NbhyRtnd1VXWbaVvfbXDfGjBcxn+f7UEeqHPb8pi+f34ROjHjYJhvGy3xE3hvCvPTQ92RqkQIiMztFO/5yacClaWsO/8VSl71zQdD7u1AQgkpvpNH0FapwKjUfUJYkcZiB6FWWtvZlhagtrrIWaiGYa8EC2dE29CAgJs0rbWVZpSx97bMjugSlfNobFWFiJoUECVTCOT2r10tGOmFJ1sWv+nXrwGzK29qOflNl/7BKphZV2Hp6Yhbx5snUfGaLdwtlyoc67dhg/m1IVvkvUrvLKR57SkGEjS3/fdasNRzFtkyrxlXUKzxgPLK3r3NK/eNSKOC2o+QF"
  },
  "version": 4,
  "datetime": "2019-03-13T10:28:49.136Z",
  "policy": "public",
  "requestId": "df72d473-9c24-4ffc-a6fe-8e56563b6425",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```
