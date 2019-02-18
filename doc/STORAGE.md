## Storage
You can add your storage (FTP, AWS S3) with UIZA.
After synced, you can select your content easier from your storage to create entity.

See details [here](https://docs.uiza.io/#storage).

## Add a storage
You can sync your storage (FTP, AWS S3) with UIZA.\
After synced, you can select your content easier from your storage to create entity.

See details [here](https://docs.uiza.io/#add-a-storage).

```ruby
require "uiza"
require "json"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {
  name: "FTP Uiza edited",
  description: "FTP of Uiza, use for transcode",
  storageType: "ftp",
  host: "your-host"
}

response = Uiza::Entity.add params
response = JSON.parse response
response["data"]["id"]
```

## Retrieve a storage
Get information of your added storage (FTP or AWS S3).

See details [here](https://docs.uiza.io/#retrieve-a-storage).

```ruby
require "uiza"
require "json"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

response = Uiza::Entity.retrieve "your-storage-id"
response = JSON.parse response
response["data"]["id"]
```

## Update storage
Update storage's information.

See details [here](https://docs.uiza.io/#update-storage).

```ruby
require "uiza"
require "json"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {
  id: "your-storage-id",
  name: "FTP Uiza edited",
  description: "FTP of Uiza, use for transcode",
  storageType: "ftp",
  host: "your-host"
}

response = Uiza::Entity.update params
```

## Remove storage
Remove storage that added to Uiza.

See details [here](https://docs.uiza.io/#remove-storage).

```ruby
require "uiza"
require "json"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

response = Uiza::Entity.remove "your-storage-id"
```
