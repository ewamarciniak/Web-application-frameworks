require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  setup do
    @recipe = recipes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipe" do
    assert_difference('Recipe.count') do
      post :create, recipe: { calories_per_portion: @recipe.calories_per_portion, cooking_time: @recipe.cooking_time, directions: @recipe.directions, integer: @recipe.integer, number_of_portions: @recipe.number_of_portions, preparation_time: @recipe.preparation_time, shopping_list: @recipe.shopping_list, text: @recipe.text, title: @recipe.title }
    end

    assert_redirected_to recipe_path(assigns(:recipe))
  end

  test "should show recipe" do
    get :show, id: @recipe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recipe
    assert_response :success
  end

  test "should update recipe" do
    put :update, id: @recipe, recipe: { calories_per_portion: @recipe.calories_per_portion, cooking_time: @recipe.cooking_time, directions: @recipe.directions, integer: @recipe.integer, number_of_portions: @recipe.number_of_portions, preparation_time: @recipe.preparation_time, shopping_list: @recipe.shopping_list, text: @recipe.text, title: @recipe.title }
    assert_redirected_to recipe_path(assigns(:recipe))
  end

  test "should destroy recipe" do
    assert_difference('Recipe.count', -1) do
      delete :destroy, id: @recipe
    end

    assert_redirected_to recipes_path
  end
end
