class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create! recipe_params
    ingredients = params[:ingredients]
    quantaties = params[:quantaties]
    units = params[:units]
    ingredient_ids = []
    ingredients.each do |i|
      id = add_ingredients_to_db(i)
      ingredient_ids.push(id)
    end
    (0..ingredients.length-1).each do |i|
          RecipeItem.create!(
            recipe_id: @recipe.id,
            ingredient_id: ingredient_ids[i],
            quantity: quantaties[i],
            unit: units[i]
          )
    end
    if params[:file].present?
      response = Cloudinary::Uploader.upload params[:file]
      @recipe.image = response['public_id']
    end
    @recipe.user_id = @current_user.id
    @recipe.save
    redirect_to recipe_path(@recipe.id)
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
    @ingredients = Ingredient.all
    if @recipe.user.id != @current_user.id
      redirect_to home_path
    end
  end

  def update
    recipe = Recipe.find params[:id]
    if recipe.user.id == @current_user.id
      ingredients = params[:ingredients]
      quantaties = params[:quantaties]
      units = params[:units]
      delete = params[:delete]
      ingredient_ids = []
      ingredients.each do |i|
        id = add_ingredients_to_db(i)
        ingredient_ids.push(id)
      end
      recipe.recipe_items.destroy_all
      # Loop through all recipe items
      (0..ingredients.length-1).each do |i|
          unless delete.include?(i.to_s)
            RecipeItem.create!(
              recipe_id: recipe.id,
              ingredient_id: ingredient_ids[i],
              quantity: quantaties[i],
              unit: units[i]
            )
          end
      end
      recipe.update recipe_params
      if params[:file].present?
        response = Cloudinary::Uploader.upload params[:file]
        recipe.image = response['public_id']
        recipe.save
      end
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

  def add_comment
    recipe = Recipe.find params[:id]
    comment = Comment.create!(comment: params[:comment], user_id: @current_user.id)
    recipe.comments << comment
    redirect_to recipe_path(recipe)
  end

  def add_items_to_list
    recipe = Recipe.find params[:id]
    recipe_items = recipe.recipe_items
    shopping_list = @current_user.shopping_lists.find_by(name: params[:list])
    redirect_to shopping_list_path(shopping_list.id)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :method, :image, ingredients:[:id, :product], recipe_items_attributes:[:id, :quantity, :unit])
  end



end
