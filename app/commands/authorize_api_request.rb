class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  attr_reader :headers

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token # If User.find() is nil, @user is nil
    @user || errors.add(:token, "Invalid Token Provided") && nil # Otherwise, return the user or throw an error
  end

  ##
  # Decode the token received from +AuthorizeApiRequest::http_auth_header+ using
  # +JsonWebToken::decode+ method
  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  ##
  # Extract the token from the authorization header that was received upon initialization
  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(" ").last
    else
      errors.add(:token, 'Missing Token')
    end
    nil
  end
end