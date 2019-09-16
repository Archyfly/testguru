class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if user.type = 'Admin' ? redirect_to questions_path : redirect_to answers_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your email and password please...'
      flash[:test] = 'Fix it please'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
