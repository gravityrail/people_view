class PagesController < ApplicationController
  def index
    redirect_to people_path if logged_in?
  end

  def about
  end
end
