require "test_helper"

class FollowRequestsControllerTest < ActionDispatch::IntegrationTest
  test "new" do
    user = create(:user)

    sign_in user

    get follow_requests_url

    assert_response :success
  end

  test "rejects a follow_request" do
    user1 = create(:user)
    user2 = create(:user)
    follow_request = create(:follow_request, requester: user1, followee: user2)

    sign_in user2

    assert_difference "FollowRequest.count", -1 do
      delete follow_request_path(follow_request)
    end

    assert_response :redirect
  end

  test "returns a not found response if the follow request is not found" do
    user = create(:user)

    sign_in user

    delete follow_request_path(id: 1)

    assert_response :not_found
  end
end
