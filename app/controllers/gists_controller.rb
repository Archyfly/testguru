class GistsController < ApplicationController
  before_action :find_user

  def index
    @gists = Gist.all
    #@user = @user.gists
  end

  def show
    @gist = @gist.users
  end



  # def create
  #  @question = @test.questions.new(question_params)
  #  if @question.save
  #    redirect_to test_questions_path
  #  else
  #    redirect_to :new
  #  end
  # end

  # def new
  #  @question = @test.questions.new
  # end

  # def edit
  #   @question = Question.find(params[:id])
  # end

  # def update
  #  if @question.update(question_params)
  #    redirect_to @question.test
  #  else
  #    render :edit
  #  end
  # end

  # def destroy
  #  @question.destroy
  #  redirect_to @test.questions
  # end

  private

  #def find_question
    #@question = @test.questions.find(params[:id])
  #  @question = Question.find(params[:id])
  # end

  def find_user
    @user = User.find(params[:id])
  end

end
