module UI
  module Counter
    class IncrementButtonComponent < ApplicationComponent
      def initialize(**attrs)
        super(**attrs)
      end

      def default_attrs
        {
          data: {
            action: "click->counter-input#increment"
          }
        }
      end
    end
  end
end
