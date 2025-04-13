module Notifications
  class ToggleComponent < ApplicationComponent
    style :unread_indicator do
      base do
        %w[w-2 h-2 bg-red-500 rounded-full hover:animate-pulse absolute top-0
          right-0 z-20 dark:bg-primary-500/95
        ]
      end
    end

    def initialize(user_notifications: [], **user_attrs)
      @user_notifications = user_notifications
      super(**user_attrs)
    end

    private

    attr_reader :user_notifications

    def unread_notifications?
      user_notifications.unread.any?
    end
  end
end
