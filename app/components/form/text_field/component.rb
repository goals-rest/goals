module Form
  module TextField
    class Component < ApplicationComponent
      style do
        base do
          %w[
            form-input
          ]
        end

        variants {
          invalid {
            yes { "form-input-error" }
          }
        }
      end

      attr_reader :type, :invalid

      def initialize(type: :text, invalid: false, **user_attrs)
        @type = type
        @invalid = invalid

        super(**user_attrs)
      end

      def invalid?
        invalid
      end

      def default_attrs
        {
          type:,
          class: style(invalid: invalid?)
        }
      end
    end
  end
end
