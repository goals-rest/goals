module UI
  module Card
    class HeaderTitleComponent < ApplicationComponent
      style do
        base do
          %w[
            text-lg font-normal text-zinc-900 dark:text-zinc-100 font-heading
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
