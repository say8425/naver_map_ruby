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

### Getting coordinates with address 
 
```ruby
city_hall.address_to_coordinates('서울특별시 중구 세종대로 110 서울특별시청')
=> {:x=>126.9783882, :y=>37.5666103} 
```
The address will be converted into coordinates and returned. But coordinates can be plural.
In this case, coordinates will be returned in array. And when your address is not clear,
then this case occurred frequently. For example your address parameter is
'서울특별시 중구'. Then you'll get many coordinates values.

### Getting address with coordinates

```ruby
city_hall.coordinates_to_address(126.9783882, 37.5666103)
=> ["서울특별시 중구 태평로1가 31", "서울특별시 중구 세종대로 110 서울시청"]
```

The coordinates will be converted into address. And address also can be can be plural.

## Contributing

Bug reports and pull requests are welcome.

## License

MIT
