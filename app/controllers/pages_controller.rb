class PagesController < ApplicationController
  def welcome
    if session[:user_id].present?
      redirect_to home_path
    end
  end

  def home
    @recipes = Recipe.all
  end
end
