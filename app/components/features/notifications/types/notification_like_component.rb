module Notifications
  module Types
    class NotificationLikeComponent < ApplicationComponent
      style :entry_link do
        base do
          %w[
            underline text-primary-600 hover:text-primary-700
            dark:text-primary-500 dark:hover:text-primary-400
          ]
        end
      end

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

      def entry_path
        polymorphic_path(record.entry.entryable)
      end

     def entry_link
       link_to(
         t(".entry_#{entry_type}"),
         entry_path,
         class: style(:entry_link),
         data: {
           turbo_stream: true
         }
       )
     end
    end
  end
end
