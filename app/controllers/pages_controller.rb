class PagesController < ApplicationController
  def index
    @auth_path = client.auth_code.authorize_url(:redirect_uri => redirect_uri)
  end

  def about
  end
end
