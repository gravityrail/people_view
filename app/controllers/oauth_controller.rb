class OauthController < ApplicationController
  def callback
    session[:code] = params[:code]
    redirect_to people_path
  end
end
