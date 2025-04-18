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
      "Notifications::Types::#{notification.notifiable_name.classify}Component".constantize
    end

    def record
      case notification.notifiable
      in Notification::Like => notifiable then notifiable.entry_like
      in Notification::Comment => notifiable then notifiable.entry.comment
      in Notification::Follow => notifiable then notifiable.follow
      end
    end
  end
end
