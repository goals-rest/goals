require "test_helper"

class FollowTest < ActiveSupport::TestCase
  should belong_to(:follower)
  should belong_to(:followee)

  test "an user cannot follow themselves" do
    user = create(:user)
    follow = user.follows.build(followee_id: user.id)

    assert_not follow.valid?
  end
end
