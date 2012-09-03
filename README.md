# Capistrano::Lingr

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-lingr'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-lingr

## Usage

		require 'capistrano/lingr'
		
    set :lingr_config, {
      :room_id => "hoge",
      :bot_id => "huga",
      :secret => "fizz"
      }

		after :deploy, 'notify:lingr'
		
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
