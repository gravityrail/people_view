class Credential < ActiveRecord::Base
  delegate :client, to: :nation
  attr_accessible :nation, :token
  belongs_to :nation

  def request_access_token!(code, redirect_uri)
    @access_token = client.auth_code.get_token(code, redirect_uri: redirect_uri)
    self.update_attributes!(:token => @access_token.token)
    @access_token
  end

  def access_token
    @access_token ||= OAuth2::AccessToken.new client, token
  end
end
