class FeedbacksController < ApplicationController

  before_action :authenticate_user!

  def index
    @feedbacks = Feedback.all
  end

  def new
    @feedback = Feedback.new
  end

  def show
    render :root
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)
      if @feedback.save
        #FeedbacksMailer.feedback_mail(current_user, @feedback).deliver_now
        redirect_to feedbacks_url
      else
        render :new
      end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:feedback)
  end

end
