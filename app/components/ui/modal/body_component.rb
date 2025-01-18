module UI
  module Modal
    class BodyComponent < ApplicationComponent
      style do
        base do
          %w[
            px-8 pt-4 prose prose-zinc dark:prose-invert
          ]
        end
      end

      def initialize(**user_attrs)
        super(**user_attrs)
      end

      def call
        tag.h3(content, **attrs)
      end

      def default_attrs
        {
          class: style

        }
      end
    end
  end
end
