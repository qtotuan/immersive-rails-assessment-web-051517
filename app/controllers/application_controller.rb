class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  def index
  end

  def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def current_attraction
    @attraction = Attraction.find(params[:id])
  end

  def logged_in?
    !!current_user
  end

  def authenticate
    redirect_to new_user_path unless logged_in?
  end
end
