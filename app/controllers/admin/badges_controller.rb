class Admin::BadgesController < ApplicationController
  #before_action :find_question, only: %i[new create]
  #before_action :set_answer, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = current_user.badges.new
  end

  def edit
  end

  def create
    @badge = current_user.badges.new(badge_params)

    if @badge.save
      redirect_to [:admin, @badge], notice: "Badge was successfully created."
    else
      render :new
    end
  end

  def update
    #if @answer.update(answer_params)
    #  redirect_to admin_question_path(@answer), notice: "Answer was successfully updated."
    #else
    #  render :edit
    #end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badge_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_answer
    #  @answer = Answer.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def badge_params
      params.require(:badge).permit(:title, :badgeurl, :description)
    end

    def find_badge
      @badge = Badge.find(params[:badge_id])
    end
end
