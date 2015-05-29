# Store file uploads in the database

This gem allows to store [`carrierwave`](https://github.com/carrierwaveuploader/carrierwave)
uploads in the database, eg. on platforms with ephemeral filesystems like Heroku.

## Installation

```ruby
# In: Gemfile
gem 'carrierwave-blob', github: "samvincent/carrierwave-blob"
```

## Usage

1. Setup your uploader to use the _blob_ storage:

```ruby
# In: app/uploaders/picture_uploader.rb
storage CarrierWave::Storage::Blob
```

2. Generate a migration for your model:

```ruby
rails generate carrier_wave_blob_migration Idea
```

3. Execute the migrations:

```ruby
rake db:migrate
```

-----

This is a fork of [a found gist](http://gist.stutostu.com/karmi/f1dc8c75d67b92b23a55) by @karmi.
