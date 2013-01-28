class OauthController < ApplicationController
  def callback
    credential = current_nation.credentials.create
    credential.request_access_token!(params[:code], callback_url)
    session[:credential_id] = credential.id
    redirect_to people_path
  end

  def authorize
    set_current_nation
    redirect_to client.auth_code.authorize_url(
      :redirect_uri => callback_url
    )
  end

  def deauthorize
    credential.destroy if credential
    session[:current_nation] = nil
    session[:credential_id] = nil
    redirect_to root_path
  end

  private

  def client
    current_nation.client
  end

  def set_current_nation
    session[:current_nation] = params[:nation][:slug]
  end

  def current_nation
    @current_nation ||= Nation.where(slug: session[:current_nation]).first
  end
end
