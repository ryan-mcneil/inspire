class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Hi, #{user.username}!"
    elsif user
      redirect_to login_path, notice: "Password does not match username. Please try again."
    end
  end

end
