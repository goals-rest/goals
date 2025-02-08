module UI
  module Carousel
    class PreviousButtonComponent < ApplicationComponent
      style do
        base do
          %w[
            absolute top-1/2 left-4 -translate-y-1/2 hidden
          ]
        end
      end

      def initialize(**user_attrs)
        super(**user_attrs)
      end

      def default_attrs
        {
          class: style,
          data: {
            carousel_target: "previousButton"
          }
        }
      end

      private
      def button_attrs
        {
          variant: :rounded,
          size: :sm,
          color: :light,
          data: {
            action: "click->carousel#previous"
          }
        }
      end
    end
  end
end
