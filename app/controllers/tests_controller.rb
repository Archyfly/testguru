class TestsController < ApplicationController
  before_action :find_test, only: %i[edit, update, show]
  #before_action :find_category, only: %i[show]
#  before_action :find_author, only: %i[show]

  def index
    #byebug
    #result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    #render plain: result.join("\n")
    @tests = Test.all
    @category = Category.all

  end

  def show
    @test = Test.find(params[:id])
    @questions = @test.questions
    @questions.count
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
    @test = Test.find(params[:id])
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
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

end
