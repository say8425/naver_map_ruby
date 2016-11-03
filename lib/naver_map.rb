require "naver_map/version"

module NaverMap
  class NaverMap
    attr_accessor :client_id, :client_secret

    def initialize(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
    end

    def to_s
      "Client ID: #{@client_id}, Client Secret: #{@client_secret}"
    end
  end
end
