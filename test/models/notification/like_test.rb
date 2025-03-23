require "test_helper"

class Notification::LikeTest < ActiveSupport::TestCase
  should belong_to(:entry_like)
  should have_one(:notification)

  test "#recipients returns a list of recipients" do
    like = create(:entry_like)
    notification_like = create(:notification_like, entry_like: like)
    recipient = like.entry.owner

    assert_equal [ recipient ], notification_like.recipients
  end
end
