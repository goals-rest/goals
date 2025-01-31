require "test_helper"

class Profiles::FollowRequestsControllerTest < ActionDispatch::IntegrationTest
  test "creates a follow request" do
    user1 = create(:user)
    user2 = create(:user)

    sign_in user1

    assert_difference "FollowRequest.count", +1 do
      post profile_follow_request_path(user2.username)
    end

    assert_response :redirect
  end

  test "cancels a follow request" do
    user1 = create(:user)
    user2 = create(:user)
    user2.follow_requests.create(requester: user1)

    sign_in user1

    assert_difference "FollowRequest.count", -1 do
      delete profile_follow_request_path(user2.username)
    end

    assert_response :redirect
  end

  test "returns a not found response if the follow request does not exist" do
    user = create(:user)

    sign_in user

    delete profile_follow_request_path(user.username)

    assert_response :not_found
  end

  test "can only cancel a owned follow request" do
    user1 = create(:user)
    user2 = create(:user)
    user3 = create(:user)
    user3.follow_requests.create(requester: user2)

    sign_in user1

    delete profile_follow_request_path(user3.username)

    assert_response :not_found
  end
end
