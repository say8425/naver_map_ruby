# NaverMap

[![Gem Version](https://badge.fury.io/rb/naver_map.svg)](https://badge.fury.io/rb/naver_map)
[![Build Status](https://travis-ci.org/say8425/naver_map_ruby.svg?branch=master)](https://travis-ci.org/say8425/naver_map_ruby)

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

### Get coordinates with address 
 
```ruby
city_hall.address_to_coordinates('서울특별시 중구 세종대로 110 서울특별시청')
=> [{:x=>126.9783882, :y=>37.5666103}] 
```

The return value is array, cuz coordinates can be multiple values.
But we are plan to when return is single value then make return is not array.

### Getting address with coordinates

```ruby
city_hall.coordinates_to_address(126.9783882, 37.5666103)
=> ["서울특별시 중구 태평로1가 31", "서울특별시 중구 세종대로 110 서울시청"]
```

Address also can be multiple values. So value is array.

## Contributing

Bug reports and pull requests are welcome.

## License
MIT