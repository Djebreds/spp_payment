require "test_helper"

class Admins::Admin::Category::GenerationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_admin_category_generations_index_url
    assert_response :success
  end
end
