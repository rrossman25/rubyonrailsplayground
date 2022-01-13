require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Sports")
    @category2 = Category.create(name: "Entertainment")
  end
  test "should show categories listing" do
    get '/categories'
    assert_select "a[href=?]", category_path(@category), text: @category.name.downcase
    assert_select "a[href=?]", category_path(@category2), text: @category2.name.downcase
  end
end
