require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @title = "A very great book #{rand(1000)}"
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "Should see elements in the products index" do
    get products_url
    assert_select "a", "New product"
    assert_select "table tbody"
    assert_select "table tfoot"
    assert_select "table tbody tr td img"
    assert_select "table tbody tr td ul li a", "Show"
    assert_select "table tbody tr td ul li a", "Edit"
    assert_select "table tbody tr td ul li a", "Destroy"
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @title } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @title } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
