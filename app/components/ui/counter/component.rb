module UI
  module Counter
    class Component < ApplicationComponent
      style do
        base do
          %(
            flex items-center space-x-1
          )
        end
      end

      renders_one :decrement_button, DecrementButtonComponent
      renders_one :increment_button, IncrementButtonComponent
      renders_one :input, InputComponent

      def initialize(**attrs)
        super(**attrs)
      end

      def default_attrs
        {
          class: style,
          data: {
            controller: "counter-input"
          }
        }
      end
    end
  end
end
