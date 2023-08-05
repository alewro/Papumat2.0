require "application_system_test_case"

class RecipeDonesTest < ApplicationSystemTestCase
  setup do
    @recipe_done = recipe_dones(:one)
  end

  test "visiting the index" do
    visit recipe_dones_url
    assert_selector "h1", text: "Recipe dones"
  end

  test "should create recipe done" do
    visit recipe_dones_url
    click_on "New recipe done"

    check "Is done" if @recipe_done.is_done
    click_on "Create Recipe done"

    assert_text "Recipe done was successfully created"
    click_on "Back"
  end

  test "should update Recipe done" do
    visit recipe_done_url(@recipe_done)
    click_on "Edit this recipe done", match: :first

    check "Is done" if @recipe_done.is_done
    click_on "Update Recipe done"

    assert_text "Recipe done was successfully updated"
    click_on "Back"
  end

  test "should destroy Recipe done" do
    visit recipe_done_url(@recipe_done)
    click_on "Destroy this recipe done", match: :first

    assert_text "Recipe done was successfully destroyed"
  end
end
