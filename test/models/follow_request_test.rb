require "test_helper"

class FollowRequestTest < ActiveSupport::TestCase
  should belong_to(:requester)
  should belong_to(:followee)

  test "an user cannot follow themselves" do
    user = create(:user)
    request = build(:follow_request, requester_id: user.id, followee_id: user.id)

    assert_not request.valid?
  end

  test "accept! creates a follow" do
    user1 = create(:user)
    user2 = create(:user)
    request = create(:follow_request, requester_id: user1.id, followee_id: user2.id)

    assert_difference "Follow.count", +1 do
      request.accept!
    end

    follow = Follow.last

    assert_equal user1.id, follow.follower_id
    assert_equal user2.id, follow.followee_id
  end

  test "accept! destroys the follow request" do
    user1 = create(:user)
    user2 = create(:user)
    request = create(:follow_request, requester_id: user1.id, followee_id: user2.id)

    assert_difference "FollowRequest.count", -1 do
      request.accept!
    end
  end
end
