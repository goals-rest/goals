module UI
  module Card
    class HeaderComponent < ApplicationComponent
      renders_one :title, HeaderTitleComponent
      renders_one :subtitle, HeaderSubtitleComponent

      style do
        base do
          %w[
            px-3 pt-3
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
