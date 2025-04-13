require "test_helper"

class NotificationNotifierTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  test "enqueues a notification for a like event" do
    entry_like = create(:entry_like)
    notification = NotificationFactory.new.create_like_notification(entry_like:)
    notifier = NotificationNotifier.new(notification_factory: NotificationFactory.new)

    assert_enqueued_with(job: ::Notifications::SendNotificationsJob) do
      notifier.notify_like(entry_like:)
    end
  end

  test "creates a notification for a like event" do
    entry_like = create(:entry_like)
    notification = NotificationFactory.new.create_like_notification(entry_like:)
    notifier = NotificationNotifier.new(notification_factory: NotificationFactory.new)

    assert_difference("Notification.count", 1) do
      notifier.notify_like(entry_like:)
    end

    assert_equal "Notification::Like", notification.notifiable_type
  end

  test "enqueues a notification for a comment event" do
    entry = create(:entry, :post)
    notification = NotificationFactory.new.create_comment_notification(entry:)
    notifier = NotificationNotifier.new(notification_factory: NotificationFactory.new)

    assert_enqueued_with(job: ::Notifications::SendNotificationsJob) do
      notifier.notify_comment(entry:)
    end
  end

  test "creates a notification for a comment event" do
    entry = create(:entry, :post)
    notification = NotificationFactory.new.create_comment_notification(entry:)
    notifier = NotificationNotifier.new(notification_factory: NotificationFactory.new)

    assert_difference("Notification.count", 1) do
      notifier.notify_comment(entry:)
    end

    assert_equal "Notification::Comment", notification.notifiable_type
  end
end
