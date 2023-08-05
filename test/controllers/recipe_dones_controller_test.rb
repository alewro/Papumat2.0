require "test_helper"

class RecipeDonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_done = recipe_dones(:one)
  end

  test "should get index" do
    get recipe_dones_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_done_url
    assert_response :success
  end

  test "should create recipe_done" do
    assert_difference("RecipeDone.count") do
      post recipe_dones_url, params: { recipe_done: { is_done: @recipe_done.is_done } }
    end

    assert_redirected_to recipe_done_url(RecipeDone.last)
  end

  test "should show recipe_done" do
    get recipe_done_url(@recipe_done)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_done_url(@recipe_done)
    assert_response :success
  end

  test "should update recipe_done" do
    patch recipe_done_url(@recipe_done), params: { recipe_done: { is_done: @recipe_done.is_done } }
    assert_redirected_to recipe_done_url(@recipe_done)
  end

  test "should destroy recipe_done" do
    assert_difference("RecipeDone.count", -1) do
      delete recipe_done_url(@recipe_done)
    end

    assert_redirected_to recipe_dones_url
  end
end
