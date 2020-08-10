require 'test_helper'

class RecipeItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get recipe_items_new_url
    assert_response :success
  end

  test "should get create" do
    get recipe_items_create_url
    assert_response :success
  end

  test "should get index" do
    get recipe_items_index_url
    assert_response :success
  end

  test "should get show" do
    get recipe_items_show_url
    assert_response :success
  end

  test "should get edit" do
    get recipe_items_edit_url
    assert_response :success
  end

  test "should get update" do
    get recipe_items_update_url
    assert_response :success
  end

  test "should get destroy" do
    get recipe_items_destroy_url
    assert_response :success
  end

end
