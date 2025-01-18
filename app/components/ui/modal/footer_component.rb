module UI
  module Modal
    class FooterComponent < ApplicationComponent
      style do
        base do
          %w[
            px-8 pt-4 pb-8
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
