class InterestsController < ApplicationController

  def index
    if current_user
      @interests = Interest.where(user: current_user)
      @interest = Interest.new
    else
      redirect_to '/login', notice: "You must log in first"
    end
  end

  def create
    user = current_user
    interest = user.interests.new(interest_params)
    if interest.save
      redirect_to '/interests', notice: "#{params[:interest][:name].titleize} has been successfully added"
    else
      redirect_to '/interests', notice: "Something went wrong. Try Again"
    end
  end

  private

  def interest_params
    params.require(:interest).permit(:name)
  end
end
