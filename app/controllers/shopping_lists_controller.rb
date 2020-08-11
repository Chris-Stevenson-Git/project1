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

  def destroy
  end
end
