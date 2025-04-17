module Chats
  module InboxPanel
    class ChatListComponent < ApplicationComponent
      style do
        base do
          %w[
            divide-y divide-zinc-200/80 dark:divide-zinc-700
          ]
        end
      end

      renders_many :items, Chats::InboxPanel::ChatItemComponent

      def initialize(**attrs)
        super(**attrs)
      end

      def default_attrs
        {
          class: style
        }
      end
    end
  end
end
