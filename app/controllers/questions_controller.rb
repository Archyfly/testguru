class QuestionsController < ApplicationController
before_action :set_test, only: %i[create new]
before_action :find_question, only: %i[show edit update destroy]

  def index
    @questions = Question.all
  end

  def show
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def find_question
    #@question = @test.questions.find(params[:id])
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

end
