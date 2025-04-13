require "test_helper"

class UserNotificationTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:notification)

  test "#unread returns all the unread notifications" do
    notification_a = create(:user_notification, :read)
    notification_b = create(:user_notification, read_at: nil)
    notification_c = create(:user_notification, read_at: nil)

    assert_equal UserNotification.unread.to_a, [ notification_b, notification_c ]
  end

  test "#notification_center returns all the notifications in descending order" do
    notification_a = create(:user_notification, :read)
    notification_b = create(:user_notification, read_at: nil)
    notification_c = create(:user_notification, read_at: nil)

    assert_equal UserNotification.notification_center.to_a, [ notification_c, notification_b, notification_a ]
  end
end
