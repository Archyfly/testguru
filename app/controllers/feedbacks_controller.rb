class FeedbacksController < ApplicationController

  before_action :authenticate_user!

  def show
    @feedback = Feedback.first
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.create(feedback_params)
      if @feedback.save
        redirect_to feedback_path
      else
        render :new
      end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:feedback)
  end

end
