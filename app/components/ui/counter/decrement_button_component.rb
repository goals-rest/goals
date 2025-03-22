module UI
  module Counter
    class DecrementButtonComponent < ApplicationComponent
      def initialize(**attrs)
        super(**attrs)
      end

      def default_attrs
        {
          disabled: true,
          data: {
            action: "click->counter-input#decrement",
            counter_input_target: "decrementBtn"
          }
        }
      end
    end
  end
end
