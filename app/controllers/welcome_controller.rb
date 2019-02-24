class WelcomeController < ApplicationController

  def index
    unless current_user
      redirect_to '/login', notice: "You must log in first"
    end
  end
end
