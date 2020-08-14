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
      delete = params[:delete]
      ingredient_ids = []
      ingredients.each do |i|
        id = add_ingredients_to_db(i)
        ingredient_ids.push(id)
      end
      shopping_list.shopping_list_items.destroy_all
      # Loop through all recipe items
      (0..ingredients.length-1).each do |i|
          unless delete.include?(i.to_s)
            ShoppingListItem.create!(
              shopping_list_id: shopping_list.id,
              ingredient_id: ingredient_ids[i],
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
