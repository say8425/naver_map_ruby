require "naver_map/version"
require 'rest-client'

module NaverMap
  class NaverMap
    attr_accessor :client_id, :client_secret

    def initialize(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
    end

    def coordinates_to_address(address)
      url = 'https://openapi.naver.com/v1/map/geocode'
      RestClient.get(url, params: { query: address }, 'X-Naver-Client-Id': @client_id, 'X-Naver-Client-Secret': @client_secret).body
    end

    def to_s
      "Client ID: #{@client_id}, Client Secret: #{@client_secret}"
    end
  end
end
