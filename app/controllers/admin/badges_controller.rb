class Admin::BadgesController < ApplicationController
  #before_action :find_question, only: %i[new create]
  #before_action :set_answer, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to [:admin, @badges], notice: "Badge was successfully created."
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
