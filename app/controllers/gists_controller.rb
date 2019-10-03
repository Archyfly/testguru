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

  private

  def find_gist
    @gist = Gist.find(params[:id])
  end

  def find_user
    @user = current_user
  end

end
