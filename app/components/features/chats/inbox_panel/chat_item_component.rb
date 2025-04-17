module Chats
  module InboxPanel
    class ChatItemComponent < ApplicationComponent
      style do
        base do
          %w[
            py-2
          ]
        end
      end

      style :link do
        base do
          %w[
            flex items-start space-x-4 font-heading p-2 relative rounded-lg 
            hover:bg-zinc-50 dark:hover:bg-zinc-800 transition ease-in-out 
            duration-200
          ]
        end

        variants {
          active {
            yes { "bg-zinc-100/80 dark:bg-zinc-800/80" }
          }
        }
      end

      attr_reader :active, :new

      def initialize(active: false, new: false, **attrs)
        @active = active
        @new = new
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
