module Notifications
  class Push < ApplicationOperation
    def initialize(notifiable:)
      @notifiable = notifiable
    end

    def call
      notification = Notification.new(notifiable: @notifiable)

      ::Notifications::SendNotificationsJob.perform_later(notification) if notification.save
    end
  end
end
