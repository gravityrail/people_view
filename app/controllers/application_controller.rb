class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  rescue_from OAuth2::Error, :with => :reset_token

  def reset_token(error)
    if error.response.status == 401
      session[:token_string] = nil
      session[:code] = nil
      redirect_to root_path
    else
      raise error
    end
  end

  def client
    OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, :site => site_path)
  end

  def token
    return @token if @token
    if token_string.present?
      @token = OAuth2::AccessToken.new(client, token_string)
    else
      @token = client.auth_code.get_token(code, redirect_uri: redirect_uri)
      session[:token_string] = token.token
    end
    @token
  end

  def token_string
    session[:token_string]
  end

  helper_method :logged_in?
  def logged_in?
    token_string.present?
  end

  def code
    session[:code]
  end

  def site_path
    "http://#{current_nation_slug}.nbuild.local:3001"
  end

  def current_nation_slug
    "3dna"
  end

  def redirect_uri
    # "http://localhost:3000/callback"
    callback_url
  end

  def standard_headers
    { "Accept" => "application/json", "Content-Type" => "application/json" }
  end
end
