class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

  def index
    #byebug
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: result.join("\n")
  end

  def show
    render inline: '<%= @test.title %>'
  end

  def new

  end

  def create
    test = Test.create(test_params)
    render plain: test.inspect
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def start
    render plain: 'Start certain test'
  end
end
