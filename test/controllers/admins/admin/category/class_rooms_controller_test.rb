require "test_helper"

class Admins::Admin::Category::ClassRoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_admin_category_class_rooms_index_url
    assert_response :success
  end
end
