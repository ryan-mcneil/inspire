class WelcomeController < ApplicationController

  def index
    if current_user && params[:inspire]
      @facade = RecommendationFacade.new(current_user)
    elsif !current_user
      redirect_to '/login', notice: "You must log in first"
    end
  end
end
