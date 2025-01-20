module UI
  module EmptyState
    class Component < ApplicationComponent
      renders_one :icon, UI::Icon::Component
      renders_one :title, ApplicationComponent
      renders_one :description, ApplicationComponent
      renders_one :actions

      style do
        base do
          %w[
            text-center flex flex-col items-center justify-center space-y-2 py-6 md:py-16
          ]
        end
      end

      def initialize(**user_attrs)
        super(**user_attrs)
      end

      def default_attrs
        {
          class: style
        }
      end
    end
  end
end
