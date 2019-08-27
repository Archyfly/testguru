class TestsController < ApplicationController
  before_action :find_test, only: %i[edit update show start]
  before_action :set_user, only: :start

  # before_action :find_category, only: %i[show]
  # before_action :find_author, only: %i[show]

  def index
    @tests = Test.all
    @category = Category.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
    #@test = Test.find(params[:id])
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

   def find_test
     @test = Test.find(params[:id])
   end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def find_category
    @category = Category.find(params[:category_id])
  end

  def find_author
    @author = User.find(params[:user_id])
  end

  def set_user
    @user = User.first
  end
end
