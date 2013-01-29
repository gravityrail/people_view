class QuestionExporter
  attr_reader :question, :nationbuilder_survey_id, :connection
  def initialize(nationbuilder_survey_id, question, connection)
    @nationbuilder_survey_id = nationbuilder_survey_id
    @question = question
    @connection = connection
  end

  def export
    connection.post("/api/v1/questions", parameters)
  end

  private
  def parameters
    {
      survey_page_id: nationbuilder_survey_id,
      question: question_presenter.to_hash
    }
  end

  def question_presenter
    NationBuilderQuestionPresenter.new(question)
  end

end

class NationBuilderQuestionPresenter
  attr_reader :question
  def initialize(question)
    @question = question
  end

  def to_hash
    {
      content: question.content,
      slug: question.to_param,
      possible_responses_attributes: responses_attributes
    }
  end

  def responses_attributes
    question.possible_responses.map { |res| { :name => res.content } }
  end
end
