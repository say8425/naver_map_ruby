require 'naver_map/version'
require 'rest-client'
require 'json'

class NaverMap
  attr_reader :client_id, :client_secret

  GEOCODE_REQUEST_URL = 'https://openapi.naver.com/v1/map/geocode'.freeze
  REVERSE_GEOCODE_URL = 'https://openapi.naver.com/v1/map/reversegeocode'.freeze

  def initialize(client_id, client_secret)
    @client_id = client_id
    @client_secret = client_secret
  end

  def address_to_coordinates(address)
    response = query(GEOCODE_REQUEST_URL, address).body
    extract_result(response, :point) # Second argument should be a symbol
  end

  def coordinates_to_address(axis_x, axis_y)
    response = query(REVERSE_GEOCODE_URL, axis_x, axis_y).body
    extract_result(response, :address)
  end

  def to_s
    "Client ID: #{client_id}, Client Secret: #{client_secret}"
  end

  private

  def request_to_naver(url, *params)
    RestClient.get(url, params: { query: params.join(',') },
                   'X-Naver-Client-Id': client_id,
                   'X-Naver-Client-Secret': client_secret)
  end

  def query(url, *params)
    request_to_naver(url, params)
  rescue RestClient::ExceptionWithResponse => err
    err.response.body
  end

  def get_result(body)
    JSON.parse(body, symbolize_names: true)[:result]
  end

  def extract_result(content, result_type)
    result = get_result(content)[:items]

    return result.first[result_type] unless result.size > 1
    result.map { |element| element[result_type] }
  end
end
