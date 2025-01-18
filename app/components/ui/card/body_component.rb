module UI
  module Card
    class BodyComponent < ApplicationComponent
      style do
        base do
          %w[
            px-3 pt-2 prose prose-zinc dark:prose-invert
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
