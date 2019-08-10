class QuestionsController < ApplicationController
before_action :set_test#, only: %i[create, edit, update]
before_action :find_question, only: %i[show, edit, destroy]


  def index
    @questions = Question.all
  end

  def show
    #@question = @test.questions.find(params[:id])
    find_question
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      redirect_to :new
    end
  end

  def new
    @question = @test.questions.new
  end

  def edit
    #@question = Question.find(params[:id])
    find_question
  end

  def update
    if @test.questions.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to :questions
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def find_question
    @question = @test.questions.find(params[:id])
  end

  def set_test
    @test = Test.find_by(params[:test_id])
  end

end
