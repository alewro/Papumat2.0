require "application_system_test_case"

class RecipeCategoriesTest < ApplicationSystemTestCase
  setup do
    @recipe_category = recipe_categories(:one)
  end

  test "visiting the index" do
    visit recipe_categories_url
    assert_selector "h1", text: "Recipe categories"
  end

  test "should create recipe category" do
    visit recipe_categories_url
    click_on "New recipe category"

    fill_in "Name", with: @recipe_category.name
    click_on "Create Recipe category"

    assert_text "Recipe category was successfully created"
    click_on "Back"
  end

  test "should update Recipe category" do
    visit recipe_category_url(@recipe_category)
    click_on "Edit this recipe category", match: :first

    fill_in "Name", with: @recipe_category.name
    click_on "Update Recipe category"

    assert_text "Recipe category was successfully updated"
    click_on "Back"
  end

  test "should destroy Recipe category" do
    visit recipe_category_url(@recipe_category)
    click_on "Destroy this recipe category", match: :first

    assert_text "Recipe category was successfully destroyed"
  end
end
