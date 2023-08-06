require "application_system_test_case"

class AllProductsTest < ApplicationSystemTestCase
  setup do
    @all_product = all_products(:one)
  end

  test "visiting the index" do
    visit all_products_url
    assert_selector "h1", text: "All products"
  end

  test "should create all product" do
    visit all_products_url
    click_on "New all product"

    fill_in "Category", with: @all_product.category
    fill_in "Name", with: @all_product.name
    click_on "Create All product"

    assert_text "All product was successfully created"
    click_on "Back"
  end

  test "should update All product" do
    visit all_product_url(@all_product)
    click_on "Edit this all product", match: :first

    fill_in "Category", with: @all_product.category
    fill_in "Name", with: @all_product.name
    click_on "Update All product"

    assert_text "All product was successfully updated"
    click_on "Back"
  end

  test "should destroy All product" do
    visit all_product_url(@all_product)
    click_on "Destroy this all product", match: :first

    assert_text "All product was successfully destroyed"
  end
end
