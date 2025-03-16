module Notifications
  class ItemComponent < ApplicationComponent
    with_collection_parameter :user_notification

    def initialize(user_notification:, **user_attrs)
      @user_notification = user_notification
      @notification = @user_notification.notification
      @notifiable = @notification.notifiable
      super(**user_attrs)
    end

    private

    attr_reader :notification, :notifiable

    def component_type
      "Notifications::Types::#{notifiable_type}Component".constantize
    end

    def record
      record = { notification_like: notifiable.entry_like }
      record[notifiable_type.param_key.to_sym]
    end

    def notifiable_type
      notifiable.model_name
    end
  end
end
