class TestsController < ApplicationController

  before_action :authenticate_user! # Обратный вызов, должен быть выполнен ранее двух нижних
  # так как TestsController наследуется от ApplicationController
  # то и метод :authenticate_user! тоже будет доступен.
  before_action :find_test, only: %i[start]

  # после применения :authenticate_user! с использованием devise
  # этот метод больше не нужон, так как будем использовать current_user
  # чтобы связать прохождение с текущим пользователем
  # before_action :set_user, only: :start

  # before_action :find_category, only: %i[show]
  # before_action :find_author, only: %i[show]

  def index
    #byebug
    #result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    #render plain: result.join("\n")
    @tests = Test.all
    @category = Category.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

   def find_test
     @test = Test.find(params[:id])
   end

  #def test_params
  #  params.require(:test).permit(:title, :level, :category_id, :author_id)
  #end

  def find_category
    @category = Category.find(params[:category_id])
  end

  # def find_author
  #  @author = User.find(params[:user_id])
  # end

  # def set_user
  # @user = User.first
  # @user = User.find_by(params[:email])
  #end
end
