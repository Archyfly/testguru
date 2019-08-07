class QuestionsController < ApplicationController
before_action :find_question #, only: %i[show]
before_action :set_test #, only: %i[create]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to question
    else
      redirect_to :new
    end
  end

  def new
  end

  def edit
    @questions.update(question_params)
  end

  def update
    @questions.update(question_params)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to question_path
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def find_question
    @question = Question.find_by(params[:id])
  end

  def set_test
    @test = Test.find_by(params[:test_id])
  end

end
