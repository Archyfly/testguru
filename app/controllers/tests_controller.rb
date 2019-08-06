class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

  def index
    #byebug
    #result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    #render plain: result.join("\n")
    @tests = Test.all
  end

  def show
    #render inline: '<%= @test.title %>'
    @test = Test.find(params[:id])
  end

  def new
  end

  def create
    test = Test.new(test_params)
    if test.save
      redirect_to test
    else
      redirect_to :new
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

end
