require 'minitest/autorun'
require 'naver_map'

class TestNaverMap < Minitest::Test
  def test_address_to_coordinates
    naver_map = NaverMap.new('9t01a7LRijYCbU1PEOlR', 'VY9dCKWgEa')
    assert_equal([{:x=>127.0452879, :y=>37.5454765}], naver_map.address_to_coordinates('서울특별시 성동구 왕십리로 88 노벨빌딩 4층'),
                 'Address is not well converted in coordinates')
  end
end
