module QuestionsHelper

  def question_header(question)
    if question.persisted?
      "Edit #{question.title} Question"
    else
      "Create New #{question.title} Question"
    end
  end



  # def question_title
  #   @question.title
  # end

  # def question_header
  #   @question.test.title
  # end

end
