module Notifications
  module Types
    class NotificationFollowComponent < ApplicationComponent
      style :link do
        base do
          %w[
            underline text-primary-600 hover:text-primary-700
            dark:text-primary-500 dark:hover:text-primary-400
          ]
        end
      end

      def initialize(record:, **user_attrs)
        @record = record
        @user = record.follower
        super(**user_attrs)
      end

      private

      attr_reader :record, :user
    end
  end
end
