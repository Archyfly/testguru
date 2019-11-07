class Admin::TestsController < Admin::BaseController

  # before_action :authenticate_user! # Обратный вызов, должен быть выполнен ранее двух нижних
  # так как TestsController наследуется от ApplicationController
  # то и метод :authenticate_user! тоже будет доступен.
  # Убран после подключения devise. Вместо него будет базовый контроллер, разделяющий доступ: base_controller
  before_action :set_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[edit update show start destroy update_inline]

  # после применения :authenticate_user! с использованием devise
  # этот метод больше не нужон, так как будем использовать current_user
  # чтобы связать прохождение с текущим пользователем
  # before_action :set_user, only: :start

  # before_action :find_category, only: %i[show]
  # before_action :find_author, only: %i[show]

  def index
    @category = Category.all
  end

  def show
    @questions = @test.questions
    @questions.count
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.authored_tests.new(test_params)
    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end

  def edit
    #@test = Test.find(params[:id])
  end

  def update
    if @test.update(test_params)
      redirect_to tests_url
    else
      render :edit
    end
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def destroy
    @test.destroy
    redirect_to tests_url
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  private

  def set_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :test_duration, :category_id)
  end

  def find_category
    @category = Category.find(params[:category_id])
  end

  # def find_author
  # @author = User.find(params[:user_id])
  # end

  # def find_category
  #  @category = Category.find(params[:category_id])
  # end

  #def find_author
  #  @author = current_user
  #  User.find(params[:user_id])
  #end

  # def set_user
  # @user = User.first
  # @user = User.find_by(params[:email])
  #end
end
