require "naver_map/version"

module NaverMap
  class NaverMap
    def initialize(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
    end

    def to_s
      "Client ID: #{@client_id}, Client Secret: #{@client_secret}"
    end

    def client_id
      @client_id
    end

    def client_secret
      @client_secret
    end
  end
end
