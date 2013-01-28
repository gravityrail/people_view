class ApplicationController < ActionController::Base
  protect_from_forgery

  delegate :access_token, :to => :credential

  helper_method :logged_in?

  rescue_from OAuth2::Error, :with => :reset_token


  private

  def reset_token(error)
    if error.response.status == 401
      session[:token_string] = nil
      session[:code] = nil
      redirect_to root_path
    else
      raise error
    end
  end

  def token
    credential.access_token
  end

  def logged_in?
    credential.present?
  end

  def credential
    @credential ||= Credential.find_by_id(session[:credential_id])
  end

  def standard_headers
    { "Accept" => "application/json", "Content-Type" => "application/json" }
  end
end
