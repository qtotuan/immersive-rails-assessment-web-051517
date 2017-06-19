class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      render 'new'
    end
  end

  def show
    if logged_in?

    else
      redirect_to root_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
