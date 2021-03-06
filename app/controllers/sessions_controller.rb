class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to root_path, notice: "You are already logged in"
    end
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Hi, #{user.username}!"
    else
      redirect_to login_path, notice: "Password does not match username. Please try again."
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "You have successfully logged out"
  end

end
