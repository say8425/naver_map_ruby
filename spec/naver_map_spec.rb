require 'rspec'
require 'naver_map'

describe NaverMap do
  describe '.address_to_coordinates' do

    let(:nm) { NaverMap.new('9t01a7LRijYCbU1PEOlR', 'VY9dCKWgEa') }

    context 'given an address' do
      it 'return coordinates' do
        nm.address_to_coordinates('서울특별시 성동구 왕십리로 88 노벨빌딩 4층').should == [{:x=>127.0452879, :y=>37.5454765}]
      end
    end
  end

end