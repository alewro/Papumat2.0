require "application_system_test_case"

class MealPlansTest < ApplicationSystemTestCase
  setup do
    @meal_plan = meal_plans(:one)
  end

  test "visiting the index" do
    visit meal_plans_url
    assert_selector "h1", text: "Meal plans"
  end

  test "should create meal plan" do
    visit meal_plans_url
    click_on "New meal plan"

    fill_in "End date", with: @meal_plan.end_date
    fill_in "Start date", with: @meal_plan.start_date
    click_on "Create Meal plan"

    assert_text "Meal plan was successfully created"
    click_on "Back"
  end

  test "should update Meal plan" do
    visit meal_plan_url(@meal_plan)
    click_on "Edit this meal plan", match: :first

    fill_in "End date", with: @meal_plan.end_date
    fill_in "Start date", with: @meal_plan.start_date
    click_on "Update Meal plan"

    assert_text "Meal plan was successfully updated"
    click_on "Back"
  end

  test "should destroy Meal plan" do
    visit meal_plan_url(@meal_plan)
    click_on "Destroy this meal plan", match: :first

    assert_text "Meal plan was successfully destroyed"
  end
end
