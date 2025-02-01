module UI
  module Card
    class BodyComponent < ApplicationComponent
      style do
        base do
          %w[
            px-3 pt-2 leading-7 text-zinc-900 dark:text-zinc-100
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
