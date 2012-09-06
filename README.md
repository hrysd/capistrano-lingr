# Capistrano::Lingr [![Build Status](https://secure.travis-ci.org/rochefort/gem-search.png)](http://travis-ci.org/rochefort/gem-search)

Notify to Lingr after deploy by Capistrano

## Installation

Add this line to your application's Gemfile:

```rb
gem 'capistrano-lingr'
```

And then execute: `bundle install`

## Usage

before using gem, need to make bot of Lingr.
[Lingr/developer](http://lingr.com/developer)

In `config/deploy.rb`

```rb
require 'capistrano/lingr'
		
set :lingr_config, {
  room_id: "hoge",
  bot_id:  "huga",
  secret:  "piyo",
  text: "DEPROY DONE!!!" # You can specify the string you want. but not required.
}

after :deploy, 'notify:lingr'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
