class PagesController < ApplicationController
  def index
    redirect_to people_path if logged_in?
  end

  def about
  end

  def api_console
  end

  def api_request
    req = params[:api]
    path = req[:path]
    method = req[:action]
    body = req[:body]
    rsp = token.send method, path, :body => body, :headers => standard_headers

    @code = JSON.parse(rsp.body)
    @code = JSON.pretty_generate @code

    @code = CodeRay.scan(@code, :json).div(:line_numbers => :table)
    render :api_console
  end
end
