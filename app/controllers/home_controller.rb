class HomeController < ApplicationController
  def index
    redirect_to minutes_path if user_signed_in?
  end
end
