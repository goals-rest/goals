require "test_helper"

class Profiles::FollowersControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    user = create(:user)

    sign_in user

    get profile_followers_url(user.username)

    assert_response :success
  end

  test "list followers if visiting another user's followers" do
    user1 = create(:user)
    user2 = create(:user)

    sign_in user1

    get profile_followers_url(user2.username)

    assert_response :success
  end

  test "list followers if there is no active session" do
    user = create(:user)

    get profile_followers_url(user.username)

    assert_response :success
  end

  test "unfollows user if current user is the same as user" do
    user1 = create(:user)
    user2 = create(:user)
    follow = create(:follow, follower_id: user2.id, followee_id: user1.id)

    sign_in user1

    assert_difference "Follow.count", -1 do
      delete profile_follower_url(user1.username, user2.id)
    end

    assert_response :redirect
  end

  test "does not unfollow if current user is not the same as user" do
    user1 = create(:user)
    user2 = create(:user)
    follow = create(:follow, follower_id: user2.id, followee_id: user1.id)

    sign_in user2

    assert_no_difference "Follow.count" do
      delete profile_follower_url(user1.username, user2.id)
    end

    assert_response :forbidden
  end

  test "redirects back to the current user's profile if the follow is not found" do
    user1 = create(:user)
    user2 = create(:user)

    sign_in user1

    assert_no_difference "Follow.count" do
      delete profile_follower_url(user1.username, user2.id)
    end

    assert_response :redirect
    assert_redirected_to profile_url(user1.username)
  end
end
