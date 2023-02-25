require "test_helper"

class Admins::Admin::PaymentMethodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_admin_payment_methods_index_url
    assert_response :success
  end
end
