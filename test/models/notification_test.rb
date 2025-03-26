require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  should belong_to(:notifiable)

  should have_many(:user_notifications).dependent(:destroy)

  test "#deliver_later enqueues the SendNotificationsJob" do
    notification = build_stubbed(:notification, :like)

    notification.deliver_later
    assert_enqueued_jobs 1 do
      ::Notifications::SendNotificationsJob.perform_later(notification)
    end
  end
end
