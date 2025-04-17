require "test_helper"

class Notification::CommentTest < ActiveSupport::TestCase
  should belong_to(:entry)
  should have_one(:notification)

  test "#recipients returns a list of recipients" do
    entry_comment = create(:entry, :comment)
    notification_comment = create(:notification_comment, entry: entry_comment)
    recipient = entry_comment.comment.parent.owner

    assert_equal [ recipient ], notification_comment.recipients
  end
end
