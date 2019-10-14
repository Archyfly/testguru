class GistsController < ApplicationController
  before_action :find_user
  before_action :find_gist

  def index
    @gists = Gist.all
    #@user = @user.gists
  end

  def show
    gists = @user.gists
  end

  def new
  end

  def create
    @gist = Gist.new(gist_params)
  end

  private

  def gist_params
    params.require(:gist).permit(:gisturl)
  end

  def find_gist
    @gist = Gist.find(params[:id])
  end

  def find_user
    @user = current_user
  end

end
