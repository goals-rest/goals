module UI
  module Carousel
    class Component < ApplicationComponent
      style do
        base do
          %w[
            relative overflow-hidden
          ]
        end
      end

      renders_one :viewport, UI::Carousel::ViewportComponent
      renders_one :next_button, UI::Carousel::NextButtonComponent
      renders_one :previous_button, UI::Carousel::PreviousButtonComponent
      renders_many :indicators, UI::Carousel::IndicatorComponent

      attr_reader :options

      def initialize(options: {}, **user_attrs)
        @options = options

        super(**user_attrs)
      end

      def default_attrs
        {
          class: style,
          data: {
            controller: "carousel",
            carousel_options_value: options.to_json
          }
        }
      end
    end
  end
end
