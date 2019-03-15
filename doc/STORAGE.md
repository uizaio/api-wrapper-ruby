## Storage
You can add your storage (FTP, AWS S3) with UIZA.
After synced, you can select your content easier from your storage to [create entity](https://docs.uiza.io/#create-entity).

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Storage).

## Add a storage
You can sync your storage (FTP, AWS S3) with UIZA.
After synced, you can select your content easier from your storage to [create entity](https://docs.uiza.io/#create-entity).

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Storage-create_storage).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

params = {
  name: "FTP Uiza",
  description: "FTP of Uiza, use for transcode",
  storageType: "ftp",
  host: "ftp-example.uiza.io",
  username: "example user",
  password: "example password",
  description: "example description"
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
```json
{
  "data": {
    "id": "f8819781-df28-410f-8cb1-ee3a29523840",
    "name": "FTP Uiza",
    "description": "example description",
    "storageType": "ftp",
    "usageType": "input",
    "bucket": nil,
    "prefix": nil,
    "host": "ftp-example.uiza.io",
    "awsAccessKey": nil,
    "awsSecretKey": nil,
    "username": "example user",
    "password": "example password",
    "region": nil,
    "port": nil,
    "createdAt": "2019-03-13T11:21:26.000Z",
    "updatedAt": nil
  },
  "version": 4,
  "datetime": "2019-03-13T11:21:26.707Z",
  "policy": "public",
  "requestId": "9e49aa2e-2e52-497f-b858-3ae172986a54",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Retrieve a storage
Get information of your added storage (`FTP` or `AWS S3`).

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Storage-list_storage).

```ruby

Uiza.app_id = "your-app-id"
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
```json
{
  "data": {
    "id": "f8819781-df28-410f-8cb1-ee3a29523840",
    "name": "FTP Uiza",
    "description": "example description",
    "storageType": "ftp",
    "usageType": "input",
    "bucket": nil,
    "prefix": nil,
    "host": "ftp-example.uiza.io",
    "awsAccessKey": nil,
    "awsSecretKey": nil,
    "username": "example user",
    "password": "example password",
    "region": nil,
    "port": nil,
    "createdAt": "2019-03-13T11:21:26.000Z",
    "updatedAt": nil
  },
  "version": 4,
  "datetime": "2019-03-13T11:21:26.707Z",
  "policy": "public",
  "requestId": "9e49aa2e-2e52-497f-b858-3ae172986a54",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Update storage
Update storage's information.

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Storage-update_storage).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

params = {
  id: "your-storage-id",
  name: "FTP Uiza edited",
  host: "ftp-example.uiza.io",
  storageType: "s3"
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
```json
{
  "data": {
    "id": "f8819781-df28-410f-8cb1-ee3a29523840",
    "name": "FTP Uiza edited",
    "description": "example description",
    "storageType": "s3",
    "usageType": "input",
    "bucket": nil,
    "prefix": nil,
    "host": "ftp-example.uiza.io",
    "awsAccessKey": nil,
    "awsSecretKey": nil,
    "username": "example username",
    "password": "example password",
    "region": nil,
    "port": 80,
    "createdAt": "2019-03-13T11:21:26.000Z",
    "updatedAt": nil
  },
  "version": 4,
  "datetime": "2019-03-13T11:40:36.334Z",
  "policy": "public",
  "requestId": "da83e775-33a5-4ced-8074-144d1eeb5d9e",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```

## Remove storage
Remove storage that added to Uiza.

See details [here](https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Storage-delete_storage).

```ruby
require "uiza"

Uiza.app_id = "your-app-id"
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
```json
{
  "data": {
    "id": "f8819781-df28-410f-8cb1-ee3a29523840",
    "name": "FTP Uiza edited",
    "description": "example description",
    "storageType": "s3",
    "usageType": "input",
    "bucket": nil,
    "prefix": nil,
    "host": "ftp-example.uiza.io",
    "awsAccessKey": nil,
    "awsSecretKey": nil,
    "username": "example username",
    "password": "example password",
    "region": nil,
    "port": 80,
    "createdAt": "2019-03-13T11:21:26.000Z",
    "updatedAt": nil
  },
  "version": 4,
  "datetime": "2019-03-13T11:42:38.205Z",
  "policy": "public",
  "requestId": "d864a038-401c-470e-87b0-c282122a4d64",
  "serviceName": "api-v4",
  "message": "OK",
  "code": 200,
  "type": "SUCCESS"
}
```
