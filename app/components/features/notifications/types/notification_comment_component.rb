module Notifications
  module Types
    class NotificationCommentComponent < ApplicationComponent
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
        @user = record.owner
        @post = record.parent.post
        super(**user_attrs)
      end

      private

      attr_reader :record, :user, :post
    end
  end
end
