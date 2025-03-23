require "test_helper"

module Notifications
  class SendNotificationJobTest < ActiveSupport::TestCase
    include ActiveJob::TestHelper

    test "enqueues the job" do
      like = create(:entry_like)
      notification_like = create(:notification_like, entry_like: like)
      notification = create(:notification, notifiable: notification_like)
      recipient = like.entry.owner

      assert_enqueued_jobs 1, queue: "default" do
        SendNotificationJob.perform_later(notification, recipient)
      end
    end

    test "sends the notification" do
      like = create(:entry_like)
      notification_like = create(:notification_like, entry_like: like)
      notification = create(:notification, notifiable: notification_like)
      recipient = like.entry.owner

      perform_enqueued_jobs do
        SendNotificationJob.perform_later(notification, recipient)
      end

      assert_equal 1, recipient.reload.user_notifications.count
    end
  end
end
