require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get home_url
    assert_response :success
  end
end
