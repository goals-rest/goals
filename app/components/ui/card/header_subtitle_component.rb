module UI
  module Card
    class HeaderSubtitleComponent < ApplicationComponent
      style do
        base do
          %w[
            font-heading text-sm text-zinc-500 font-normal dark:text-zinc-400
          ]
        end
      end

      def initialize(**user_attrs)
        super(**user_attrs)
      end

      def call
        tag.h4(content, **attrs)
      end

      def default_attrs
        {
          class: style
        }
      end
    end
  end
end
