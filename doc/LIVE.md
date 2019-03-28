## Live Streaming
These APIs used to create and manage live streaming event.
* When a Live is not start : it's named as `Event`.
* When have an Event , you can start it : it's named as `Feed`.

See details [here](https://docs.uiza.io/v4/#live-streaming).

## Create a live event
These APIs use to create a live streaming and manage the live streaming input (output).
A live stream can be set up and start later or start right after set up.
Live Channel Minutes counts when the event starts.

See details [here](https://docs.uiza.io/v4/#create-a-live-event).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

params = {
  name: "Sample Event",
  mode: "push",
  resourceMode: "single",
  encode: 0,
  description: "This is a sample event"
}

begin
  live = Uiza::Live.create params
  puts live.id
  puts live.name
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
    "id": "d956f4a2-a3a8-4c7d-a738-98e6b1433d70",
    "name": "Sample Event",
    "description": "This is a sample event",
    "mode": "push",
    "resourceMode": "single",
    "encode": 0,
    "channelName": "9a5a1280-1ccf-458d-a77c-85c0d17f7fb7",
    "lastPresetId": nil,
    "lastFeedId": nil,
    "poster": nil,
    "thumbnail": nil,
    "linkPublishSocial": nil,
    "linkStream": nil,
    "lastPullInfo": nil,
    "lastPushInfo": nil,
    "lastProcess": nil,
    "eventType": nil,
    "drm": 0,
    "dvr": 0,
    "createdAt": "2019-03-13T12:07:45.000Z",
    "updatedAt": "2019-03-13T12:07:45.000Z"
  },
  "version": 4,
  "datetime": "2019-03-13T12:07:45.342Z",
  "policy": "public",
  "requestId": "4f3db256-1bac-4ba4-90f0-83e8aa5bb403",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Retrieve a live event
Retrieves the details of an existing event.
You need only provide the unique identifier of event that was returned upon Live event creation.

See details [here](https://docs.uiza.io/v4/#retrieve-a-live-event).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

begin
  live = Uiza::Live.retrieve "your-live-id"
  puts live.id
  puts live.name
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
    "id": "d956f4a2-a3a8-4c7d-a738-98e6b1433d70",
    "name": "Sample Event",
    "description": "This is a sample event",
    "mode": "push",
    "resourceMode": "single",
    "encode": 0,
    "channelName": "9a5a1280-1ccf-458d-a77c-85c0d17f7fb7",
    "lastPresetId": nil,
    "lastFeedId": nil,
    "poster": nil,
    "thumbnail": nil,
    "linkPublishSocial": nil,
    "linkStream": nil,
    "lastPullInfo": nil,
    "lastPushInfo": nil,
    "lastProcess": nil,
    "eventType": nil,
    "drm": 0,
    "dvr": 0,
    "createdAt": "2019-03-13T12:07:45.000Z",
    "updatedAt": "2019-03-13T12:07:45.000Z"
  },
  "version": 4,
  "datetime": "2019-03-13T12:07:45.342Z",
  "policy": "public",
  "requestId": "4f3db256-1bac-4ba4-90f0-83e8aa5bb403",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Update a live event
Update the specific Live event by edit values of parameters.

See details [here](https://docs.uiza.io/v4/#update-a-live-event).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

params = {
  id: "your-live-id",
  name: "live test",
  mode: "pull",
  encode: 0,
  dvr: 1,
  resourceMode: "single"
}

begin
  live = Uiza::Live.update params
  puts live.id
  puts live.name
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
    "id": "40197661-4e43-4b6f-a555-4b87708650b1",
    "name": "Sample Live updated",
    "description": nil,
    "mode": "push",
    "resourceMode": "single",
    "encode": 0,
    "channelName": "44461a2e-ff43-4fe0-862e-fce72e7f6201",
    "lastPresetId": nil,
    "lastFeedId": "5eef64c2-a375-40a7-8de9-aff7b2becea3",
    "poster": nil,
    "thumbnail": nil,
    "linkPublishSocial": nil,
    "linkStream": nil,
    "lastPullInfo": nil,
    "lastPushInfo": [
      {
        "streamUrl": "rtmp://stag-asia-southeast1-u-01-gw.uizadev.io:1935/push-only",
        "streamKey": "44461a2e-ff43-4fe0-862e-fce72e7f6201?token=857767c06f2d70cf525d1c302d69e034&ulasId=57ee741f-3daf-11e9-89c5-02c1b5b83c1a"
      }
    ],
    "lastProcess": "stop",
    "eventType": nil,
    "drm": 0,
    "dvr": 0,
    "createdAt": "2019-03-12T07:08:30.000Z",
    "updatedAt": "2019-03-12T07:08:30.000Z"
  },
  "version": 4,
  "datetime": "2019-03-13T12:10:49.776Z",
  "policy": "public",
  "requestId": "9ab44ac2-2983-4268-ba6a-5aae25297481",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Start a live feed
These API use to start a live event that has been create success.
The Live channel minute start count whenever the event start success

See details [here](https://docs.uiza.io/v4/#start-a-live-feed).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

begin
  live = Uiza::Live.start_feed "your-live-id"
  puts live.id
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
    "id": "40197661-4e43-4b6f-a555-4b87708650b1"
  },
  "version": 4,
  "datetime": "2019-03-13T12:13:38.556Z",
  "policy": "public",
  "requestId": "6aaa5abb-df16-4c64-a9fe-0b8e0398aa7f",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Get view of live feed
This API use to get a live view status . This view only show when event has been started and being processing.

See details [here](https://docs.uiza.io/v4/#retrieve-views).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

begin
  response = Uiza::Live.get_view "your-live-id"
  puts response.watchnow
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
    "watchnow": 0
  },
  "version": 4,
  "datetime": "2019-03-13T12:17:17.416Z",
  "policy": "public",
  "requestId": "ed933ac0-e5ed-46c8-91eb-88e0c39577fc",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Stop a live feed
Stop live event

See details [here](https://docs.uiza.io/v4/#stop-a-live-feed).

```ruby
require "uiza"
Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

begin
  live = Uiza::Live.stop_feed "your-live-id"
  puts live.id
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
    "id": "40197661-4e43-4b6f-a555-4b87708650b1"
  },
  "version": 4,
  "datetime": "2019-03-13T12:13:38.556Z",
  "policy": "public",
  "requestId": "6aaa5abb-df16-4c64-a9fe-0b8e0398aa7f",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## List all recorded files
Retrieves list of recorded file after streamed (only available when your live event has turned on Record feature)

See details [here](https://docs.uiza.io/v4/#list-recorded-files).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

params = {
  limit: 2
}

begin
  lives = Uiza::Live.list_recorded params
  # params is optional
  # or lives = Uiza::Live.list_recorded
  puts live.first.id
  puts live.first.entityId
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
      "id": "40197661-4e43-4b6f-a555-4b87708650b1",
      "name": "Sample Live updated",
      "description": nil,
      "mode": "push",
      "resourceMode": "single",
      "encode": 0,
      "channelName": "44461a2e-ff43-4fe0-862e-fce72e7f6201",
      "lastPresetId": nil,
      "lastFeedId": "2d90d8f9-bf97-455a-b3d6-1a5dec487381",
      "poster": nil,
      "thumbnail": nil,
      "linkPublishSocial": nil,
      "linkStream": nil,
      "lastPullInfo": nil,
      "lastPushInfo": [
        {
          "streamUrl": "rtmp://stag-asia-southeast1-u-01-gw.uizadev.io:1935/push-only",
          "streamKey": "44461a2e-ff43-4fe0-862e-fce72e7f6201?token=857767c06f2d70cf525d1c302d69e034&ulasId=57ee741f-3daf-11e9-89c5-02c1b5b83c1a"
        }
      ],
      "lastProcess": "init",
      "eventType": nil,
      "drm": 0,
      "dvr": 0,
      "createdAt": "2019-03-12T07:08:30.000Z",
      "updatedAt": "2019-03-12T07:08:30.000Z"
    }
  ],
  "version": 4,
  "datetime": "2019-03-13T12:19:42.074Z",
  "policy": "public",
  "requestId": "e7621f67-27ba-43a8-8ae1-6da48b0a6b03",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Delete a record file
Delete a recorded file

See details [here](https://docs.uiza.io/v4/#delete-a-record-file).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

begin
  live = Uiza::Live.delete "your-record-id" #Identifier of record (get from list record)
  puts live.id
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
    "id": "40197661-4e43-4b6f-a555-4b87708650b1"
  },
  "version": 4,
  "datetime": "2019-03-13T12:22:54.735Z",
  "policy": "public",
  "requestId": "20649dd3-41f5-4762-8c37-96aaac4f6498",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Convert into VOD
Convert recorded file into VOD entity. After converted, your file can be stream via Uiza's CDN.

See details [here](https://docs.uiza.io/v4/#convert-into-vod).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

begin
  live = Uiza::Live.convert_to_vod "your-record-id" #Identifier of record (get from list record)
  puts live.id
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
    "id": "40197661-4e43-4b6f-a555-4b87708650b1",
    "name": "Sample Live updated",
    "description": nil,
    "mode": "push",
    "resourceMode": "single",
    "encode": 0,
    "channelName": "44461a2e-ff43-4fe0-862e-fce72e7f6201",
    "lastPresetId": nil,
    "lastFeedId": "2d90d8f9-bf97-455a-b3d6-1a5dec487381",
    "poster": nil,
    "thumbnail": nil,
    "linkPublishSocial": nil,
    "linkStream": nil,
    "lastPullInfo": nil,
    "lastPushInfo": [
      {
        "streamUrl": "rtmp://stag-asia-southeast1-u-01-gw.uizadev.io:1935/push-only",
        "streamKey": "44461a2e-ff43-4fe0-862e-fce72e7f6201?token=857767c06f2d70cf525d1c302d69e034&ulasId=57ee741f-3daf-11e9-89c5-02c1b5b83c1a"
      }
    ],
    "lastProcess": "init",
    "eventType": nil,
    "drm": 0,
    "dvr": 0,
    "createdAt": "2019-03-12T07:08:30.000Z",
    "updatedAt": "2019-03-12T07:08:30.000Z"
  },
  "version": 4,
  "datetime": "2019-03-13T12:13:38.556Z",
  "policy": "public",
  "requestId": "6aaa5abb-df16-4c64-a9fe-0b8e0398aa7f",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```
