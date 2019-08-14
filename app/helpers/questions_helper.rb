module QuestionsHelper

  def question_title
    @question.title
  end

  def question_header
    @question.test.title
  end

end
