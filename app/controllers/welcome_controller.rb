class WelcomeController < ApplicationController

  def index
    unless current_user
      redirect_to '/login'
    end
  end
end
