require "test_helper"

class Admins::Admin::BudgetSppsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_admin_budget_spps_index_url
    assert_response :success
  end
end
