require "test_helper"

class AllProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @all_product = all_products(:one)
  end

  test "should get index" do
    get all_products_url
    assert_response :success
  end

  test "should get new" do
    get new_all_product_url
    assert_response :success
  end

  test "should create all_product" do
    assert_difference("AllProduct.count") do
      post all_products_url, params: { all_product: { category: @all_product.category, name: @all_product.name } }
    end

    assert_redirected_to all_product_url(AllProduct.last)
  end

  test "should show all_product" do
    get all_product_url(@all_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_all_product_url(@all_product)
    assert_response :success
  end

  test "should update all_product" do
    patch all_product_url(@all_product), params: { all_product: { category: @all_product.category, name: @all_product.name } }
    assert_redirected_to all_product_url(@all_product)
  end

  test "should destroy all_product" do
    assert_difference("AllProduct.count", -1) do
      delete all_product_url(@all_product)
    end

    assert_redirected_to all_products_url
  end
end
