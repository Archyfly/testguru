class QuestionsController < ApplicationController

  def index
    @questions = Question.all

    #result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]

    #render plain: 'All tests'
    #render plain: result.join("\n")
  end

  def show

     #render inline: '<%= @question.title %>'
  end

  def create
    question = Question.create(question_params)
    #render plain: question.inspect
    @question.save
    redirect_to @question
  end

  def new
  end



  private

  def question_params
    params.require(:question).permit(:title, :test_id)
  end

  def find_question
    @question = Question.find(params[:id])
  end

end
