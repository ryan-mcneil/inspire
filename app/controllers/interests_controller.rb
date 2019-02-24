class InterestsController < ApplicationController

  def index
    if current_user
      @interests = Interest.where(user_id: current_user.id)
    else
      redirect_to '/login', notice: "You must log in first"
    end
  end
end
