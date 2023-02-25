require "test_helper"

class Admins::Admin::Users::StaffsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_admin_users_staffs_index_url
    assert_response :success
  end
end
