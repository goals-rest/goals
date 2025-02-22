module UI
  module Tooltip
    class TriggerComponent < ApplicationComponent
      style do
        base do
          %(
            cursor-pointer
          )
        end
      end

      def initialize(**attrs)
        super(**attrs)
      end

      def call
        tag.div(content, **attrs)
      end

      def default_attrs
        {
          class: style,
          data: {
            tooltip_target: "trigger"
          }
        }
      end
    end
  end
end
