class ApplicationController < ActionController::Base

  before_action :set_locale


  def default_url_options
    { lang: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def user_path
    @user_path = request.path
  end

  # def authenticate_user!
  #  unless current_user
      # flash[:alert] = 'Are you Guru? Verify your email and password please. ' Код ниже
      # позовляет также вызвать flash[:alert] без явного вызова метода flash
  #    redirect_to login_path, alert: 'Are you Guru? Verify your email and password please. '
  #  end

  #  cookies[:id] = current_user&.id
  #  cookies[:email] = current_user&.email

  # end

  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  # end

  # def logged_in?
  #  current_user.present?
  # end

end
