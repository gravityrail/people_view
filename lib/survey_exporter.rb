class SurveyExporter
  attr_reader :survey
  def initialize(survey)
    @survey = survey
  end

  def export
    export_survey
  end

  private

  def export_survey
    connection.post("/api/v1/surveys", body: parameters.to_json, headers: json_headers)
  end

  def token
    @token ||= OAuth2::AccessToken.new(client, token_string)
  end
  alias_method :connection, :token

  def token_string
    "50315e143c49315a7016a82e94fc8d25e6c074e4aeef0f678c83d15879f08535"
  end

  def client
    OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, :site => site_path)
  end

  def site_path
    "http://3dna.nbuild.local:3001"
  end

  def parameters
    {
      survey: survey_presenter.to_hash
    }
  end

  def survey_presenter
    NationBuilder::SurveyPresenter.new(survey)
  end

  def json_headers
    { "Content-Type" => "application/json", "Accept" => "application/json" }
  end
end

module NationBuilder
  class SurveyPresenter
    attr_reader :survey
    def initialize(survey)
      @survey = survey
    end

    def to_hash
      {
        status: "published",
        name: survey.title,
        slug: "external_survey_#{survey.to_param}",
        site_slug: "3dna",
        questions: survey.questions.map { |question| QuestionPresenter.new(question).to_hash }
      }
    end
  end

  class QuestionPresenter
    attr_reader :question
    def initialize(question)
      @question = question
    end

    def to_hash
      {
        type: "multiple",
        status: "published",
        slug: "external_question_#{question.to_param}",
        prompt: question.content,
        choices: possible_responses_hash
      }
    end

    def possible_responses_hash
      question.possible_responses.map { |possible_response| PossibleResponsePresenter.new(possible_response).to_hash }
    end
  end

  class PossibleResponsePresenter
    attr_reader :possible_response
    def initialize(possible_response)
      @possible_response = possible_response
    end

    def to_hash
      {
        name: possible_response.content
      }
      # feedback string in this hash if wanted
    end
  end
end
