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
