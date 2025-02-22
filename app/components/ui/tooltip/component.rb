module UI
  module Tooltip
    class Component < ApplicationComponent
      PLACEMENTS = %i[top right bottom left].freeze

      style do
        base do
          %(
            inline-block
          )
        end
      end

      renders_one :trigger, TriggerComponent
      renders_one :body, BodyComponent

      attr_reader :placement, :trigger_attrs, :body_attrs

      def initialize(placement: :top, **attrs)
        @placement = placement

        super(**attrs)
      end

      def default_attrs
        {
          class: style,
          data: {
            controller: "tooltip",
            tooltip_placement_value: placement
          }
        }
      end

      private
      def default_body_attrs
        {
          class: style(:body),
          data: {
            tooltip_target: "body"
          }
        }
      end
    end
  end
end
