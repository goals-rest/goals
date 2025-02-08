module UI
  module Carousel
    class ViewportComponent < ApplicationComponent
      style do
        base do
          %w[
            flex
          ]
        end
      end

      renders_many :slides, UI::Carousel::SlideComponent

      def initialize(**user_attrs)
        super(**user_attrs)
      end

      def default_attrs
        {
          class: style
        }
      end
    end
  end
end
