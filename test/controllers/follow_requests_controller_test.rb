require "test_helper"

class FollowRequestsControllerTest < ActionDispatch::IntegrationTest
  test "the truth" do
    user = create(:user)

    sign_in user

    get follow_requests_url

    assert_response :success
  end
end
