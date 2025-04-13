require "test_helper"

class Notification::FollowTest < ActiveSupport::TestCase
  should belong_to(:follow)
  should have_one(:notification)

  test "#recipients returns a list of recipients" do
    follow = create(:follow)
    notification_like = create(:notification_follow, follow: follow)
    recipient = follow.followee

    assert_equal [ recipient ], notification_like.recipients
  end
end
