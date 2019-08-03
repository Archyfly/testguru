class QuestionsController < ApplicationController
before_action :find_question #, only: %i[show]
#before_action :find_test#, only: %i[create]
 before_action :set_test#, only: %i[create]

  def index
    # @test = Test.first
    @questions = Question.all
    # result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    # render plain: 'All tests'
    # render html: '<h1>All questions</h1>'.html_safe # выводим как простой html, html_safe - строка безопасна
    # render json: {questions: Question.all}
  end

  def show
    #render inline: '<%= @question.title %>'
    #find_question
    begin
      find_question
    rescue
      raise "Question not found"
    end
  end

  def create
    question_new = @test.questions.new(question_params)
    if question_new.save
      puts "Question sucessfully created"
    else
      raise "Create new question failed"
    end
      render plain: question_new.inspect
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
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find_by(params[:test_id])
  end

  # def find_test
  #   @test_q = params[:test_id]
  # end

end
