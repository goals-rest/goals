module UI
  module Carousel
    class IndicatorComponent < ApplicationComponent
      style do
        base do
          %w[
            w-2 h-2 rounded-full bg-white/50 data-[active='true']:bg-white
          ]
        end
      end

      attr_reader :slide

      def initialize(slide:, **user_attrs)
        @slide = slide

        super(**user_attrs)
      end

      def call
        tag.div(**attrs)
      end

      def default_attrs
        {
          class: style,
          data: {
            carousel_target: "indicator",
            active: false,
            slide:
          }
        }
      end
    end
  end
end
