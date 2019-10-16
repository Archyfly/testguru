class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
  end

  def show
  
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @update.update(user_params)
      redirect_to users_url
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email)
  end

end
