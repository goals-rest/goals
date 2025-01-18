module UI
  module Modal
    class HeaderComponent < ApplicationComponent
      style do
        base do
          %w[
            px-8 pt-8
          ]
        end
      end

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
