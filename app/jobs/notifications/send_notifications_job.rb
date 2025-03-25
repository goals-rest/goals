module Notifications
  class SendNotificationsJob < ApplicationJob
    queue_as :default

    def perform(notification)
      notification.recipients.find_each do |recipient|
        SendNotificationJob.perform_later(notification, recipient)
      end
    end
  end
end
