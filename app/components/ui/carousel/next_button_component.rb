module UI
  module Carousel
    class NextButtonComponent < ApplicationComponent
      style do
        base do
          %w[
            absolute top-1/2 right-4 -translate-y-1/2 hidden
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
            carousel_target: "nextButton"
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
            action: "click->carousel#next"
          }
        }
      end
    end
  end
end
