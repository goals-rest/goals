require "test_helper"

module Notifications
  class PushTest < ActiveSupport::TestCase
    include ActiveJob::TestHelper
    test "enqueues job" do
      notifiable = create(:notification_like)

      Notifications::Push.new(notifiable:).call

      assert_enqueued_jobs 1 do
        ::Notifications::SendNotificationsJob.perform_later
      end
    end

    test "creates a new notification" do
      notifiable = create(:notification_comment)

      perform_enqueued_jobs do
        assert_difference "UserNotification.count", +1 do
          Notifications::Push.new(notifiable:).call
        end
      end
    end

    test "when save fails" do
      notifiable = create(:notification_like)

      Notification.any_instance.stubs(:save).returns(false)

      assert_no_enqueued_jobs do
        Notifications::Push.new(notifiable: notifiable).call
      end
    end
  end
end
