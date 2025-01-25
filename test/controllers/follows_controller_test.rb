require "test_helper"

class FollowsControllerTest < ActionDispatch::IntegrationTest
  test "creates a follow" do
    user1 = create(:user)
    user2 = create(:user)

    sign_in user1

    assert_difference "Follow.count", +1 do
      post follows_url, params: { follow: { followee_id: user2.id } }
    end

    follow = Follow.last

    assert_response :redirect
    assert_equal follow.follower_id, user1.id
    assert_equal follow.followee_id, user2.id
  end

  test "redirects to root_path when followee is not found" do
    user1 = create(:user)

    sign_in user1

    post follows_url, params: { follow: { followee_id: 100 } }

    assert_response :redirect
    assert_redirected_to root_url
  end

  test "redirects back to the followee profile" do
    user1 = create(:user)
    user2 = create(:user)

    sign_in user1

    post follows_url, params: { follow: { followee_id: user2.id } }

    assert_response :redirect
    assert_redirected_to profile_url(username: user2.username)
  end

  test "does not allow a user to follow themselves" do
    user1 = create(:user)

    sign_in user1

    assert_no_difference "Follow.count" do
      post follows_url, params: { follow: { followee_id: user1.id } }
    end
  end

  test "unfollows user" do
    user1 = create(:user)
    user2 = create(:user)
    follow = create(:follow, follower_id: user1.id, followee_id: user2.id)

    sign_in user1

    assert_difference "Follow.count", -1 do
      delete follow_url(follow)
    end

    assert_response :redirect
  end

  test "returns an not found response when the user tries to destroy a follow that does not exist" do
    user1 = create(:user)

    sign_in user1

    delete follows_url(id: 1)

    assert_response :not_found
  end
end
