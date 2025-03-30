require "test_helper"

class Notification::CommentTest < ActiveSupport::TestCase
  should belong_to(:entry)
  should have_one(:notification)

  test "#recipients returns a list of recipients" do
    comment = create(:entry, :comment)
    notification_comment = create(:notification_comment, entry: comment)
    recipient = comment.owner

    assert_equal [ recipient ], notification_comment.recipients
  end
end
