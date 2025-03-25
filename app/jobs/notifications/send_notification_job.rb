module Notifications
  class SendNotificationJob < ApplicationJob
    queue_as :default

    def perform(notification, recipient)
      UserNotification.create(notification: notification, user: recipient)
    end
  end
end
