module Chats
  module InboxPanel
    class SearchSectionComponent < ApplicationComponent
      include FormsHelper

      style do
        base do
          %w[
            flex items-center space-x-2
          ]
        end
      end

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
