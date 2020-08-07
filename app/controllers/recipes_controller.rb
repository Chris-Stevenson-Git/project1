class RecipesController < ApplicationController
  def new
  end

  def create
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find params[:id]
    @timestamp = since_time(@recipe.created_at)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
