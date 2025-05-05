module UI
  module Timeline
    class ItemComponent < ApplicationComponent
      style do
        base do
          %w[
            mb-10 ms-6 last:mb-0
          ]
        end
      end

      renders_one :badge, BadgeComponent
      renders_one :body, BodyComponent

      private
      def default_attrs
        {
          class: style
        }
      end
    end
  end
end
