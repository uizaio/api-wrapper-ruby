## Storage
You can add your storage (FTP, AWS S3) with UIZA.
After synced, you can select your content easier from your storage to [create entity](https://docs.uiza.io/#create-entity).

See details [here](https://docs.uiza.io/#storage).

## Add a storage
You can sync your storage (FTP, AWS S3) with UIZA.
After synced, you can select your content easier from your storage to [create entity](https://docs.uiza.io/#create-entity).

See details [here](https://docs.uiza.io/#add-a-storage).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {
  name: "FTP Uiza",
  description: "FTP of Uiza, use for transcode",
  storageType: "ftp",
  host: "ftp-example.uiza.io"
}

begin
  storage = Uiza::Storage.add params
  puts storage.id
  puts storage.name
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
  "id": "cd003123-7ec9-4f3a-9d7c-f2de93e83e49",
  "name": "FTP Uiza",
  "description": "FTP of Uiza, use for transcode",
  "storageType": "ftp",
  "usageType": "input",
  "bucket": null,
  "prefix": null,
  "host": "ftp-exemple.uiza.io",
  "awsAccessKey": null,
  "awsSecretKey": null,
  "username": "uiza",
  "password": "=5;9x@LPsd+w7qW",
  "region": null,
  "port": 21,
  "createdAt": "2018-06-19T03:01:56.000Z",
  "updatedAt": "2018-06-19T03:01:56.000Z"
}
```

## Retrieve a storage
Get information of your added storage (`FTP` or `AWS S3`).

See details [here](https://docs.uiza.io/#retrieve-a-storage).

```ruby
require "json"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

begin
  storage = Uiza::Storage.retrieve "your-storage-id"
  puts storage.id
  puts storage.name
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
  "id": "cd003123-7ec9-4f3a-9d7c-f2de93e83e49",
  "name": "FTP Uiza",
  "description": "FTP of Uiza, use for transcode",
  "storageType": "ftp",
  "usageType": "input",
  "bucket": null,
  "prefix": null,
  "host": "ftp-exemple.uiza.io",
  "awsAccessKey": null,
  "awsSecretKey": null,
  "username": "uiza",
  "password": "=5;9x@LPsd+w7qW",
  "region": null,
  "port": 21,
  "createdAt": "2018-06-19T03:01:56.000Z",
  "updatedAt": "2018-06-19T03:01:56.000Z"
}
```

## Update storage
Update storage's information.

See details [here](https://docs.uiza.io/#update-storage).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {
  id: "your-storage-id",
  name: "FTP Uiza edited",
  host: "ftp-example.uiza.io",
  port: 21,
  storageType: "ftp"
}

begin
  storage = Uiza::Storage.update params
  puts storage.id
  puts storage.name
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
  "id": "cd003123-7ec9-4f3a-9d7c-f2de93e83e49",
  "name": "FTP Uiza edited",
  "description": "FTP of Uiza, use for transcode",
  "storageType": "ftp",
  "usageType": "input",
  "bucket": null,
  "prefix": null,
  "host": "ftp-exemple.uiza.io",
  "awsAccessKey": null,
  "awsSecretKey": null,
  "username": "uiza",
  "password": "=5;9x@LPsd+w7qW",
  "region": null,
  "port": 21,
  "createdAt": "2018-06-19T03:01:56.000Z",
  "updatedAt": "2018-06-19T03:01:56.000Z"
}
```

## Remove storage
Remove storage that added to Uiza.

See details [here](https://docs.uiza.io/#remove-storage).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

begin
  storage = Uiza::Storage.remove "your-storage-id"
  puts storage.id
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
  "id": "cd003123-7ec9-4f3a-9d7c-f2de93e83e49"
}
```
