class PeopleController < ApplicationController
  def index
    @current_page = (params[:page] || 1).to_i
    response = token.get("/api/v1/people", :headers => { "Accept" => "application/json" }, :params => { page: @current_page })
    @people = JSON.parse(response.body)["people"].map { |person_data| Person.from_hash(person_data) }
  end

  def edit
    @person = get_person(params[:id])
  end

  def update
    set_person(params[:id], params[:person])
    redirect_to edit_person_path(:id => params[:id])
  end

  private

  def get_person(id)
    response = token.get("/api/v1/people/#{id}", :headers => { "Accept" => "application/json" })
    hash = JSON.parse(response.body)["person"]
    Person.from_hash(hash)
  end

  def set_person(id, attributes)
    options = {
      :headers => {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      },
      :body => {
        person: attributes
      }.to_json
    }

    token.put("/api/v1/people/#{id}", options)
  end
end
