module Chats
  module InboxPanel
    class Component < ApplicationComponent
      style do
        base do
          %w[
            lg:w-[360px] w-full lg:h-[calc(100vh-74px)] p-4 lg:border-r 
            lg:border-zinc-300/80 overflow-y-auto overflow-x-hidden 
            md:block hidden lg:pb-0 pb-16 dark:lg:border-zinc-700
          ]
        end
      end

      renders_one :search_section, Chats::InboxPanel::SearchSectionComponent
      renders_one :chat_list, Chats::InboxPanel::ChatListComponent

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
