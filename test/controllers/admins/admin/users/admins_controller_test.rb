require "test_helper"

class Admins::Admin::Users::AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_admin_users_admins_index_url
    assert_response :success
  end
end
