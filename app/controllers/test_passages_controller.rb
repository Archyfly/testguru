class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show

  end

  def result

  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    @created_gist_url = result.url
    gist_to_table if result

    flash_options = if result
        { notice: t('.success') }
      else
        { alert: t('.failure') }
      end
    flash[:alert] = "link_to 'Gist question', #{@created_gist_url}"


    redirect_to @test_passage, flash_options

  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist_to_table
    gist = Gist.new(user_id: current_user.id, question_id: @test_passage.current_question.id, gisturl: @created_gist_url)
    gist.save
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
