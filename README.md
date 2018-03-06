# tinder-ruby

A Ruby interface to the Tinder API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tinder-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tinder-ruby

## Usage

Specify `FB_TOKEN`

```text
# Create [project root]/.env
FB_TOKEN = AAABBBCCCDDDEEEFFF...
```

Initialize a client

```ruby
require 'tinder'

token = ENV['FB_TOKEN']
client = Tinder::Client.new(token)
```

Get your own profile data

```ruby
client.profile
```

Get match recommendations

```ruby
client.recs
```

Change your search preferences

```ruby
client.change_filter(
  age_filter_min: 18,
  age_filter_max: 30,
  gender: 0,
  gender_filter: 1,
  distance_filter: 50
)
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
