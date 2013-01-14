class PeopleController < ApplicationController
  def index
    response = token.get("/api/v1/people", :headers => { "Accept" => "application/json" })
    @people = JSON.parse(response.body)["people"]
  end
end
