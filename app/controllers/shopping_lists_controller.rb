class ShoppingListsController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show
    @shopping_list = ShoppingList.find params[:id]
  end

  def update
    shopping_list = ShoppingList.find params[:id]
    if shopping_list.users.pluck(:id).include?(@current_user.id)
      ingredients = params[:ingredients]
      quantaties = params[:quantaties]
      units = params[:units]
      ingredient_ids = []
      ingredients.each do |i|
        id = add_ingredients_to_db(i)
        ingredient_ids.push(id)
      end
      loop_length = ingredients.length - 1

      # Loop through all ingredient params
      (0..loop_length).each do |i|
        # set recipe_item_id to the correct ID
        if ShoppingListItem.find_by(ingredient_id: shopping_list.ingredients.pluck(:id)[i]) != nil
          the_shopping_list_item_id = ShoppingListItem.find_by(ingredient_id: shopping_list.ingredients.pluck(:id)[i]).id
        else
          the_shopping_list_item_id = nil
        end
        # check if the new ingredient item exists in the DB
        the_ingredient = Ingredient.find_by(product: ingredients[i])

        # if it doesn't exist in the DB then create it
        if the_ingredient == nil
          the_ingredient = Ingredient.create!(product: ingredient)
        end
        # If there is no shopping_list item
        if the_shopping_list_item_id == nil
          if ingredients[i] != ''
            ShoppingListItem.create!(
              shopping_list_id: shopping_list.id,
              ingredient_id: the_ingredient.id,
              quantity: quantaties[i],
              unit: units[i]
            )
          else
            next
          end
        else
          ShoppingListItem.find_by(id: the_shopping_list_item_id).update(
            ingredient_id: the_ingredient.id,
            quantity: quantaties[i],
            unit: units[i]
          )
        end
      end
      redirect_to shopping_list_path(shopping_list.id)
    else
      redirect_to home_path
    end
  end

  def add_user
    shopping_list = ShoppingList.find params[:id]
    email = params[:email]
    user = User.find_by(email: email)
    if user != nil
      user.shopping_lists << shopping_list
    end
    redirect_to shopping_list_path(shopping_list.id)
  end

  def destroy
  end
end
