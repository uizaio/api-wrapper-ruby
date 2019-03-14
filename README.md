# Uiza

## Introduction
This is documents the public API for Uiza version 4.0.

See documents for public API for Uiza version 3.0 [here](https://github.com/uizaio/api-wrapper-ruby/tree/master_v3). Please use gem `uiza` version 1.1.0 to use API v3

The Uiza API is organized around RESTful standard.
Our API has predictable, resource-oriented URLs, and uses HTTP response codes to indicate API errors.
JSON is returned by all API responses, including errors, although our API libraries convert responses to appropriate language-specific objects.

All API requests must be made over HTTPS. Calls made over plain HTTP will fail. API requests without authentication will also fail.

## Authentication
In order, to use the Uiza, you should follow these steps:

* **Step 1:** Having an active Uiza account. (If you don't have, please get [here](https://id.uiza.io/))
* **Step 2:** Once you have an Uiza account, you can get a Token to call the APIs.

This Token will have right & permission related with your account.


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
The library needs to be configured with your account's `workspace_api_domain` and `authorization` (API key).\
Set `Uiza.workspace_api_domain` and `Uiza.authorization` with your values:

See details [here](https://docs.uiza.io/#authentication).

## Ruby
```ruby
require "uiza"
Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"
```

## ROR
Create file `your-app/config/initializers/uiza.rb`

```ruby
Uiza.app_id = ENV["APP_ID"]
Uiza.authorization = ENV["AUTHORIZATION"]
```

## Entity
These below APIs used to take action with your media files (we called Entity).

See details [here](https://github.com/uizaio/api-wrapper-ruby/blob/develop/doc/ENTITY.md).

```ruby
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

## Category
Category has been splits into 3 types: `folder`, `playlist` and `tag`. These will make the management of entity more easier.

See details [here](https://github.com/uizaio/api-wrapper-ruby/blob/develop/doc/CATEGORY.md).

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

## Storage
You can add your storage (`FTP`, `AWS S3`) with UIZA.
After synced, you can select your content easier from your storage to [create entity](https://docs.uiza.io/#create-entity).

See details [here](https://github.com/uizaio/api-wrapper-ruby/blob/master/doc/STORAGE.md).

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

## Live Streaming
These APIs used to create and manage live streaming event.
* When a Live is not start : it's named as `Event`.
* When have an `Event` , you can start it : it's named as `Feed`.

See details [here](https://github.com/uizaio/api-wrapper-ruby/blob/develop/doc/LIVE.md).

```ruby
require "json"

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

## Callback
Callback used to retrieve an information for Uiza to your server, so you can have a trigger notice about an entity is upload completed and .

See details [here](https://github.com/uizaio/api-wrapper-ruby/blob/develop/doc/CALLBACK.md).

```ruby
require "json"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

begin
  callback = Uiza::Callback.retrieve "your-callback-id"
  puts callback.id
  puts callback.url
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

## User Management
You can manage user with APIs user. Uiza have 2 levels of user:
  Admin - This account will have the highest priority, can have permission to create & manage users.
  User - This account level is under Admin level. It only manages APIs that relates to this account.

See details [here](https://github.com/uizaio/api-wrapper-ruby/blob/develop/doc/USER.md).

```ruby
require "json"

Uiza.app_id = "your-app-id"
Uiza.authorization = "your-authorization"

begin
  user = Uiza::User.retrieve "your-user-id"
  puts user.id
  puts user.username
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

## Embed Metadata
Embed metadata is information that can be embed into video/audio file. You can embed into file by adding a json compose these tag.

See details [here](https://github.com/uizaio/api-wrapper-ruby/blob/master/doc/EMBED_METADATA.md).

## Errors Code
Uiza uses conventional HTTP response codes to indicate the success or failure of an API request.
In general: Codes in the `2xx` range indicate success.
Codes in the `4xx` range indicate an error that failed given the information provided (e.g., a required parameter was omitted, a charge failed, etc.).
Codes in the `5xx` range indicate an error with Uiza's servers.

See details [here](https://github.com/uizaio/api-wrapper-ruby/blob/master/doc/ERRORS_CODE.md).

## Development
After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing
Run below command to run rspec for project.
```ruby
bundle exec rspec spec
```

Open `coverage/index.html` to see coversage of RSpec.
See details [here](https://github.com/colszowka/simplecov).

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/uizaio/api-wrapper-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct
Everyone interacting in the Uiza project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/uizaio/api-wrapper-ruby/blob/master/CODE_OF_CONDUCT.md).
