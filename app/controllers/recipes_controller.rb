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
    redirect_to new_desc_path(@recipe)
  end

  def add_desc
    @recipe = Recipe.find params[:id]
  end

  def update_desc
    recipe = Recipe.find params[:id]
    if recipe.user.id == @current_user.id
      recipe.update recipe_params
      redirect_to new_ingredients_path(recipe)
    else
      redirect_to home_path
    end
  end

  def add_ingredients
    @recipe = Recipe.find params[:id]
  end

  def update_ingredients
    recipe = Recipe.find params[:id]
    ingredients = params[:ingredients]
    quantaties = params[:quantaties]
    units = params[:units]
    ingredient_ids = []
    ingredients.each do |i|
      id = add_ingredients_to_db(i)
      ingredient_ids.push(id)
    end
    (0..14).each do |i|
      if ingredients[i] == ''
        next
      else
        RecipeItem.create!(
          recipe_id: recipe.id,
          ingredient_id: ingredient_ids[i],
          quantity: quantaties[i],
          unit: units[i]
        )
      end
    end
    if recipe.user.id == @current_user.id
      redirect_to new_method_path(recipe)
    else
      redirect_to home_path
    end
  end

  def add_method
    @recipe = Recipe.find params[:id]
  end

  def update_method
    recipe = Recipe.find params[:id]
    if recipe.user.id == @current_user.id
      recipe.update recipe_params
      redirect_to new_image_path(recipe)
    else
      redirect_to home_path
    end
  end

  def add_image
    @recipe = Recipe.find params[:id]
  end

  def add_image_upload
    @recipe = Recipe.find params[:id]
  end

  def update_image
    recipe = Recipe.find params[:id]
    if recipe.user.id == @current_user.id
      recipe.update recipe_params
      redirect_to recipe_path(recipe)
    else
      redirect_to home_path
    end
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
      ingredient_ids = []
      ingredients.each do |i|
        id = add_ingredients_to_db(i)
        ingredient_ids.push(id)
      end

      # Loop through all 15 items
      (0..14).each do |i|
        # set recipe_item_id to the correct ID
        if RecipeItem.find_by(ingredient_id: recipe.ingredients.pluck(:id)[i]) != nil
          the_recipe_item_id = RecipeItem.find_by(ingredient_id: recipe.ingredients.pluck(:id)[i]).id
        else
          the_recipe_item_id = nil
        end
        # check if the new ingredient item exists in the DB
        the_ingredient = Ingredient.find_by(product: ingredients[i])

        # if it doesn't exist in the DB then create it
        if the_ingredient == nil
          the_ingredient = Ingredient.create!(product: ingredient)
        end
        # If there is no recipe item
        if the_recipe_item_id == nil
          puts '********************************************'
          puts '********************************************'
          puts ingredients[i]
          puts '********************************************'
          puts '********************************************'
          if ingredients[i] != ''
            RecipeItem.create!(
              recipe_id: recipe.id,
              ingredient_id: the_ingredient.id,
              quantity: quantaties[i],
              unit: units[i]
            )
          else
            next
          end
        else
          RecipeItem.find_by(id: the_recipe_item_id).update(
            ingredient_id: the_ingredient.id,
            quantity: quantaties[i],
            unit: units[i]
          )
        end
      end
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
    params.require(:recipe).permit(:title, :description, :method, :image, ingredients:[:id, :product], recipe_items_attributes:[:id, :quantity, :unit])
  end

  def add_ingredients_to_db(ingredient)
    if Ingredient.find_by(product: ingredient) == nil
      item = Ingredient.create!(product: ingredient)
      item.id
    else
      Ingredient.find_by(product: ingredient).id
    end
  end #add ingredeints function

end
