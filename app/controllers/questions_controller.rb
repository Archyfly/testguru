class QuestionsController < ApplicationController
#before_action :find_question#, only: %i[show]
before_action :find_test#, only: %i[create]


  def index
    @test = Test.first
    @questions = Question.all
    #result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    #render plain: 'All tests'
    #render html: '<h1>All questions</h1>'.html_safe # выводим как простой html, html_safe - строка безопасна
    #render json: {questions: Question.all}
  end

  def show
    #render inline: '<%= @question.title %>'
    #find_question
  end

  def create
    question_new = Question.create!(question_params)
    #question_new = @Question.create!(question_params)
    if question_new.save
      puts 'Question sucessfully created'
    else
      puts 'question not created...'
    end

    #render plain: question.inspect

    #question_new.save
  end

  def new
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  #def find_question
  #  @question = Question.find_by(params[:test_id])
   #end

  def find_test
    @test_q = params[:test_id]

  end

end
