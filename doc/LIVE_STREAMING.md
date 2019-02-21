## Live Streaming
These APIs used to create and manage live streaming event.
* When a Live is not start : it's named as `Event`.
* When have an Event , you can start it : it's named as `Feed`.

See details [here](https://docs.uiza.io/#live-streaming).

## Create a live event
These APIs use to create a live streaming and manage the live streaming input (output).
A live stream can be set up and start later or start right after set up.
Live Channel Minutes counts when the event starts.

See details [here](https://docs.uiza.io/#create-a-live-event).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {
  name: "test event",
  mode: "push",
  encode: 1,
  dvr: 1,
  description: "This is for test event",
  poster: "https://example.com/poster.jpeg",
  thumbnail: "https://example.com/poster.jpeg",
  linkStream: [
      "https://playlist.m3u8"
  ],
  resourceMode: "single"
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
```ruby
{
  "id": "8b83886e-9cc3-4eab-9258-ebb16c0c73de",
  "name": "checking 01",
  "description": "checking",
  "mode": "pull",
  "resourceMode": "single",
  "encode": 0,
  "channelName": "checking-01",
  "lastPresetId": null,
  "lastFeedId": null,
  "poster": "https://example.com/poster.jpeg",
  "thumbnail": "https://example.com/thumbnail.jpeg",
  "linkPublishSocial": null,
  "linkStream": "[\"https://www.youtube.com/watch?v=pQzaHPoNX1I\"]",
  "lastPullInfo": null,
  "lastPushInfo": null,
  "lastProcess": null,
  "eventType": null,
  "createdAt": "2018-06-21T14:33:36.000Z",
  "updatedAt": "2018-06-21T14:33:36.000Z"
}
```

## Retrieve a live event
Retrieves the details of an existing event.
You need only provide the unique identifier of event that was returned upon Live event creation.

See details [here](https://docs.uiza.io/#retrieve-a-live-event).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
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
```ruby
{
  "id": "8b83886e-9cc3-4eab-9258-ebb16c0c73de",
  "name": "checking 01",
  "description": "checking",
  "mode": "pull",
  "resourceMode": "single",
  "encode": 0,
  "channelName": "checking-01",
  "lastPresetId": null,
  "lastFeedId": null,
  "poster": "https://example.com/poster.jpeg",
  "thumbnail": "https://example.com/thumbnail.jpeg",
  "linkPublishSocial": null,
  "linkStream": "[\"https://www.youtube.com/watch?v=pQzaHPoNX1I\"]",
  "lastPullInfo": null,
  "lastPushInfo": null,
  "lastProcess": null,
  "eventType": null,
  "createdAt": "2018-06-21T14:33:36.000Z",
  "updatedAt": "2018-06-21T14:33:36.000Z"
}
```
