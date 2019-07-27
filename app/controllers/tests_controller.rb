class TestsController < ApplicationController
  def index
    #byebug
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]

    #render plain: 'All tests'
    render plain: result.join("\n")
  end

  def show
    redirect_to root_path
  end

  def new
    # controller_name
    # action_name
  end

  def create
    #result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    #render plain: result.join("\n")

    test = Test.create(test_params)
    render plain: test.inspect
  end

  private

   def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def start
    render plain: 'Start certain test'
  end
end
