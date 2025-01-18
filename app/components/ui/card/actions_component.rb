module UI
  module Card
    class ActionsComponent < ApplicationComponent
      style do
        base do
          %w[
            px-3 pt-6 pb-3
          ]
        end
      end

      def initialize(**user_attrs)
        super(**user_attrs)
      end

      def call
        tag.div(content, **attrs)
      end

      def default_attrs
        {
          class: style
        }
      end
    end
  end
end
