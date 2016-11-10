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
    err.response
  end

  def render_json(body)
    JSON.parse(body, symbolize_names: true)
  end

  def extract_result(content, result_type)
    result_json  = render_json(content)

    if result_json[:result]
      result_items = result_json[:result][:items]

      return result_items.first[result_type] unless result_items.size > 1
      result_items.map { |item| item[result_type] }
    else
      result_json
    end
  end
end
