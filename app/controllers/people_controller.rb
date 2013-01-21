class PeopleController < ApplicationController
  def index
    @current_page = (params[:page] || 1).to_i
    response = token.get("/api/v1/people", :headers => standard_headers, :params => { page: @current_page })
    @people = JSON.parse(response.body)["people"].map { |person_data| Person.from_hash(person_data) }
  end

  def edit
    @person = get_person(params[:id])
  end

  def update
    set_person(params[:id], params[:person])
    flash[:success] = "Updated person successfully"
    redirect_to edit_person_path(:id => params[:id])
  rescue OAuth2::Error => e
    flash[:error] = "There was an error"
    redirect_to edit_person_path(:id => params[:id])
  end

  private

  def get_person(id)
    response = token.get("/api/v1/people/#{id}", :headers => standard_headers)
    hash = JSON.parse(response.body)["person"]
    Person.from_hash(hash)
  end

  def set_person(id, attributes)
    options = {
      :headers => standard_headers,
      :body => {
        person: attributes
      }.to_json
    }

    token.put("/api/v1/people/#{id}", options)
  end
end
