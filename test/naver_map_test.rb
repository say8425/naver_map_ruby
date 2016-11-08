require 'minitest/autorun'
require 'naver_map'

class TestNaverMap < Minitest::Test
  def setup
    @naver_map = NaverMap.new('9t01a7LRijYCbU1PEOlR', 'VY9dCKWgEa')
  end

  def test_address_to_coordinates
    assert_equal([{:x=>127.0452879, :y=>37.5454765}], @naver_map.address_to_coordinates('서울특별시 성동구 왕십리로 88 노벨빌딩 4층'),
                 'Address is not well converted in coordinates')
  end

  def test_cordinates_to_address
    assert_equal ["경기도 성남시 분당구 정자동 257-1"], @naver_map.coordinates_to_address("127.1141382", "37.3599968")
  end
end
