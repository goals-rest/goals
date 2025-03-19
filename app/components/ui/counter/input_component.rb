module UI
  module Counter
    class InputComponent < ApplicationComponent
      style do
        base do
          %(
            w-12 border-0 focus:border-0 focus:outline-hidden focus:ring-0
            focus:shadow-none text-center bg-transparent
          )
        end
      end

      def initialize(**attrs)
        super(**attrs)
      end

      def call
        tag.input(type: :text, **attrs)
      end

      def default_attrs
        {
          class: style,
          data: {
            counter_input_target: "value"
          }
        }
      end
    end
  end
end
