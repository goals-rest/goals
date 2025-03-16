module Notifications
  module Types
    class NotificationLikeComponent < ApplicationComponent
      def initialize(record:, **user_attrs)
        @record = record
        @user = record.user
        super(**user_attrs)
      end

      private

      attr_reader :record, :user

      def entry_type
        record.entry.entryable_name
      end
    end
  end
end
