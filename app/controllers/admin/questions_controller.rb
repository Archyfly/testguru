class Admin::QuestionsController < Admin::BaseController
before_action :set_test, only: %i[create new]
before_action :find_question, only: %i[show edit update destroy]

  def index
    @questions = Question.all
  end

  def show
    @question = question.test
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to [:admin, @question.test], notice: t('.success')
    else
      redirect_to :new
    end
  end

  def new
    @question = @test.questions.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    if @question.update(question_params)
      redirect_to @question.test
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @test.questions
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def find_question
    #@question = @test.questions.find(params[:id])
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

end
