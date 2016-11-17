class InvalidKeysError < StandardError
  def initialize(client_id, client_secret)
    message = """
    Wrong API keys
    Given Client ID: #{client_id} (Must be 20 characters of String)
    Given Client Secret: #{client_secret} (Must be 10 characters of String)
    """

    puts message
  end
end
