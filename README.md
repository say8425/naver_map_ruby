# NaverMap

This is ruby gem for using Naver Map API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'naver_map'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install naver_map

## Usage

```ruby
require 'naver_map'

city_hall = NaverMap.new('input your client id', 'input your client secret')
```

First you need to confirm your Naver API client id and client secret key. You can confirm it at [Naver Developer Application page](https://developers.naver.com/appinfo).
Then you can initialize `naver_map` with your client id and client secret key.
 
```ruby
city_hall.address_to_coordinates('서울특별시 중구 세종대로 110 서울특별시청')
=> [{:x=>126.9783882, :y=>37.5666103}] 
```

Current version of naver_map gem can only show coordinates through address.

## Contributing

Bug reports and pull requests are welcome.
