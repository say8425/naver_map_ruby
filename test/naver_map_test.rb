require 'minitest/autorun'
require 'naver_map'

class TestNaverMap < Minitest::Test
  def setup
    @naver_map = NaverMap.new('9t01a7LRijYCbU1PEOlR', 'VY9dCKWgEa')
  end

  def test_address_to_coordinates
    # if there's no parenthesis in this test, it throws syntax error.
    # because Ruby recognizes the first argument as a block.
    assert_equal({ x: 127.0452879, y: 37.5454765 },
                @naver_map.address_to_coordinates('서울특별시 성동구 왕십리로 88 노벨빌딩 4층'),
                'The coordinates has to be hash contains x-axis and y-axis')
  end

  def test_coordinates_to_address
    assert_equal '경기도 성남시 분당구 정자동 257-1',
                 @naver_map.coordinates_to_address('127.1141382', '37.3599968'),
                 'The address has to be string'
  end

  def test_return_array_on_multiple_value
    # TODO: Find another example for address_to_coordinates method.
    expected_result = ['경기도 성남시 분당구 정자동 178-1',
                       '경기도 성남시 분당구 불정로 6 그린팩토리']
    assert_equal expected_result,
                 @naver_map.coordinates_to_address('127.1052133', '37.3595316'),
                 'The results should be array if it has more than one item'
  end

  def test_print_errors
    wrong_input = @naver_map.address_to_coordinates('경기도 코엑스')
    assert wrong_input.keys == [:errorMessage, :errorCode]
  end

  def test_raising_unknown_error
    # TODO: Introduce appropriate conditions raising error
    skip
  end
end
