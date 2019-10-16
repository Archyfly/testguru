class Admin::GistsController < ApplicationController

  def index
    @gists = Gist.all

  end

  def show
    gists = @user.gists
  end


end
