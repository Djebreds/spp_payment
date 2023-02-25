require "test_helper"

class Admins::Admin::PaymentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_admin_payments_index_url
    assert_response :success
  end
end
