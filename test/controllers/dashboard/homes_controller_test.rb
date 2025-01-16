require "test_helper"

module Dashboard
  class HomesControllerTest < ActionDispatch::IntegrationTest
    test "index" do
      get dashboard_home_url
      assert_response :success
    end
  end
end
