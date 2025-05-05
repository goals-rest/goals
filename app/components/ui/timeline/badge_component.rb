module UI
  module Timeline
    class BadgeComponent < ApplicationComponent
      style do
        base do
          %w[
            absolute flex items-center justify-center w-6 h-6 rounded-full
            -start-3 ring-8 ring-white dark:ring-gray-900
          ]
        end
      end

      renders_one :icon, UI::Icon::Component

      private
      def default_attrs
        {
          class: style
        }
      end
    end
  end
end
