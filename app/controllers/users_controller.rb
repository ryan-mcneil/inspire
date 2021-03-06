class UsersController < ApplicationController
  def new
    unless current_user
      @user = User.new
    else
      redirect_to root_path, notice: "You are already logged in"
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Please complete all fields and enter a unique email address"
      redirect_to register_path
    end
  end
  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
