module UI
  module Modal
    class HeaderTitleComponent < ApplicationComponent
      style do
        base do
          %w[
            text-2xl font-semibold font-heading text-zinc-900
            dark:text-zinc-100 tracking-tight
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
