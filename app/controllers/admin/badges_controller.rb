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
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
    @badge.destroy
    redirect_to admin_badge_path
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def badge_params
      params.require(:badge).permit(:title, :badgeurl, :description)
    end

    def find_badge
      @badge = Badge.find(params[:badge_id])
    end
end
