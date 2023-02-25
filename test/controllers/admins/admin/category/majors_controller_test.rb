require "test_helper"

class Admins::Admin::Category::MajorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_admin_category_majors_index_url
    assert_response :success
  end
end
