class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new recipe_params
    if params[:file].present?
      response = Cloudinary::Uploader.upload params[:file]
      @recipe.image = response['public_id']
    end
    @recipe.user_id = @current_user.id
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  def index
    @recipes = @current_user.recipes.all
  end

  def show
    @recipe = Recipe.find params[:id]
    @timestamp = since_time(@recipe.created_at)
  end

  def edit
    @recipe = Recipe.find params[:id]
    if @recipe.user.id != @current_user.id
      redirect_to home_path
    end
  end

  def update
    recipe = Recipe.find params[:id]
    if recipe.user.id == @current_user.id
      recipe.update recipe_params
      redirect_to recipe_path(recipe)
    else
      redirect_to home_path
    end
  end

  def destroy
    recipe = Recipe.find params[:id]
    if recipe.user.id == @current_user.id
      recipe.destroy
    end
    redirect_to home_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :method, :image)
  end

end
