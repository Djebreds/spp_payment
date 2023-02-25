require "test_helper"

class Admins::Admin::Users::StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_admin_users_students_index_url
    assert_response :success
  end
end
