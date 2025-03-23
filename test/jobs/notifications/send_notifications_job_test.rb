require "test_helper"

module Notifications
  class SendNotificationsJobTest < ActiveSupport::TestCase
    include ActiveJob::TestHelper

    test "enqueues the job" do
      like = create(:entry_like)
      notification_like = create(:notification_like, entry_like: like)
      notification = create(:notification, notifiable: notification_like)

      assert_enqueued_jobs 1, queue: "default" do
        SendNotificationsJob.perform_later(notification)
      end
    end

    test "sends the notifications" do
      like = create(:entry_like)
      notification_like = create(:notification_like, entry_like: like)
      notification = create(:notification, notifiable: notification_like)
      entry_owner = like.entry.owner

      perform_enqueued_jobs do
        SendNotificationsJob.perform_later(notification)
      end

      assert_equal 1, entry_owner.reload.user_notifications.count
    end
  end
end
