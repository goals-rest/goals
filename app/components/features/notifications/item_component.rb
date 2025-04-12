module Notifications
  class ItemComponent < ApplicationComponent
    with_collection_parameter :user_notification

    def initialize(user_notification:, **user_attrs)
      @user_notification = user_notification
      @notification = @user_notification.notification
      super(**user_attrs)
    end

    private

    attr_reader :notification

    def component_type
      "Notifications::Types::#{notifiable_type.classify}Component".constantize
    end

    def record
      case notification.notifiable
      in Notification::Like => notification then notification.entry_like
      in Notification::Comment => notification then notification.entry.comment
      end
    end

    def notifiable_type
      notification.notifiable_name
    end
  end
end
