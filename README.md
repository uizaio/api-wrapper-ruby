# Uiza

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/uiza`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "uiza"
```

And then execute:

```ruby
$ bundle
```

Or install it yourself as:

```ruby
$ gem install uiza
```

### Requirements

* Ruby 2.0+.

## Usage

The library needs to be configured with your account's `workspace_api_domain` and `authorization` (API key).
See details [here](https://docs.uiza.io/#authentication).
Set `Uiza.workspace_api_domain` and `Uiza.authorization` with your values:

## Ruby
```ruby
require "uiza"
Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"
```

## ROR
Create file `your-app/config/initializers/uiza.rb`
```ruby
Uiza.workspace_api_domain = ENV["WORKSPACE_API_DOMAIN"]
Uiza.authorization = ENV["AUTHORIZATION"]
```

## Entity
These below APIs used to take action with your media files (we called Entity)
See details [here](https://docs.uiza.io/#video).

## Create entity
Create entity using full URL. Direct HTTP, FTP or AWS S3 link are acceptable.
See details [here](https://docs.uiza.io/#create-entity).

```ruby
require "uiza"
require "json"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {
  name: "Sample Video",
  url: "https://example.com/video.mp4",
  inputType: "http",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
}
response = Uiza::Entity.create params
response = JSON.parse response
response["data"]["id"]
```

## Retrieve entity
Get detail of entity including all information of entity.
See details [here](https://docs.uiza.io/#retrieve-an-entity).

```ruby
require "uiza"
require "json"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

response = Uiza::Entity.retrieve "your-entity-id"
response = JSON.parse response
response["data"]["id"]
```
## List all entities
Get list of entities including all detail.
See details [here](https://docs.uiza.io/#list-all-entities).

```ruby
require "uiza"
require "json"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {
  publishToCdn: "not-ready",
  metadataId: "your-folder/playlist-id"
}
response = Uiza::Entity.list params
response = JSON.parse response
response["data"].first["id"]
```

## Update entity
Update entity's information.
See details [here](https://docs.uiza.io/#update-an-entity).

```ruby
require "uiza"
require "json"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {
  id: "Id edited",
  name: "Name edited",
  description: "Description edited"
}
response = Uiza::Entity.update params
response = JSON.parse response
response["data"]["id"]
```

## Delete entity
Delete entity.
See details [here](https://docs.uiza.io/#delete-an-entity).

```ruby
require "uiza"
require "json"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

response = Uiza::Entity.update params
response = JSON.parse response
response["data"]["id"]
```

## Search entity
Search entity base on keyword entered
See details [here](https://docs.uiza.io/#search-entity).

```ruby
require "uiza"
require "json"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {keyword: "sample"}
response = Uiza::Entity.search params
response = JSON.parse response
response["data"].first["id"]
```

## Publish entity to CDN
Publish entity to CDN, use for streaming
See details [here](https://docs.uiza.io/#publish-entity-to-cdn).

```ruby
require "uiza"
require "json"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

response = Uiza::Entity.publish "your-entity-id"
response = JSON.parse response
response["data"].["message"]
```

## Get status publish
Publish entity to CDN, use for streaming
See details [here](https://docs.uiza.io/#get-status-publish).

```ruby
require "uiza"
require "json"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

response = Uiza::Entity.get_status_publish "your-entity-id"
response = JSON.parse response
response["data"].["status"]
```

## Get AWS upload key
This API will be return the bucket temporary upload storage & key for upload, so that you can push your file to Uiza’s storage and get the link for URL upload & create entity
See details [here](https://docs.uiza.io/#get-aws-upload-key).

```ruby
require "uiza"
require "json"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

response = Uiza::Entity.get_aws_upload_key
response = JSON.parse response
response["data"].["temp_access_secret"]
```

## Storage
You can add your storage (FTP, AWS S3) with UIZA. After synced, you can select your content easier from your storage to create entity.
See details [here](https://docs.uiza.io/#storage).

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/uizaio/api-wrapper-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Uiza project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/uizaio/api-wrapper-ruby/blob/master/CODE_OF_CONDUCT.md).
