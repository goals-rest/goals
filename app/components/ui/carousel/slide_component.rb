module UI
  module Carousel
    class SlideComponent < ApplicationComponent
      style do
        base do
          %w[
            min-w-0 grow-0 shrink-0 basis-full
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
