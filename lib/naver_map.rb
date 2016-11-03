require 'naver_map/version'
require 'rest-client'
require 'json'

class NaverMap
  attr_accessor :client_id, :client_secret

  def initialize(client_id, client_secret)
    @client_id = client_id
    @client_secret = client_secret
  end

  def address_to_coordinates(address)
    url = 'https://openapi.naver.com/v1/map/geocode'
    response = RestClient.get(url, params: { query: address }, 'X-Naver-Client-Id': @client_id,
                              'X-Naver-Client-Secret': @client_secret)
    result = JSON.parse(response.body, symbolize_names: true)[:result]
    result[:items].map do |element| element[:point] end
  rescue RestClient::ExceptionWithResponse => err
    err.response.body
  end


  def query(address)
    url = 'https://openapi.naver.com/v1/map/geocode'
    response = RestClient.get(url, params: { query: address }, 'X-Naver-Client-Id': @client_id,
                              'X-Naver-Client-Secret': @client_secret)
    JSON.parse(response.body, symbolize_names: true)[:result]
  rescue RestClient::ExceptionWithResponse => err
    err.response.body
  end

  def to_s
    "Client ID: #{@client_id}, Client Secret: #{@client_secret}"
  end
end
