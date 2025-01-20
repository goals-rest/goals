require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    user = create(:user)

    sign_in user

    get home_url
    assert_response :success
  end
end
