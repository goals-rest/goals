require "test_helper"

class NotificationFactoryTest < ActiveSupport::TestCase
  test "builds a notification for a like event" do
    entry_like = create(:entry_like)
    notification = NotificationFactory.new.create_like_notification(entry_like:)

    assert_equal "Notification::Like", notification.notifiable_type
  end

  test "builds a notification for a comment event" do
    entry = create(:entry, :post)
    notification = NotificationFactory.new.create_comment_notification(entry:)

    assert_equal "Notification::Comment", notification.notifiable_type
  end
end
