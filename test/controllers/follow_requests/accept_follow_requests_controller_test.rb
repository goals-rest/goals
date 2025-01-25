require "test_helper"

class FollowRequests::AcceptFollowRequestsControllerTest < ActionDispatch::IntegrationTest
  test "creates a new follow if the follow request is accepted" do
    user1 = create(:user)
    user2 = create(:user)
    follow_request = create(:follow_request, requester: user1, followee: user2)

    sign_in user2

    assert_difference "Follow.count", +1 do
      post follow_request_accept_follow_requests_path(follow_request)
    end

    assert_response :redirect
  end

  test "returns a not found response if the follow request is not found" do
    user = create(:user)

    sign_in user

    post follow_request_accept_follow_requests_path(follow_request_id: 1)

    assert_response :not_found
  end

  test "returns a not found response if current user does not own the follow request" do
    user1 = create(:user)
    user2 = create(:user)
    user3 = create(:user)
    follow_request = create(:follow_request, requester: user1, followee: user2)

    sign_in user3

    post follow_request_accept_follow_requests_path(follow_request)

    assert_response :not_found
  end
end
