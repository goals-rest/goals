module UI
  module Button
    class Component < ApplicationComponent
      style do base { %w[btn gap-2] }
        variants {
          color {
            primary { %w[btn-primary] }
            secondary { %w[btn-secondary] }
            dark { %w[btn-dark] }
            light { %w[btn-light] }
            white { %w[btn-white] }
            transparent { %w[btn-transparent] }
            link { %w[btn-link] }
          }

          size {
            lg { %w[btn-lg] }
            sm { %w[btn-sm] }
            base { [] }
          }
        }

        defaults { { color: :primary, size: :base } }
      end

      renders_one :leading_icon, Icon::Component
      renders_one :trailing_icon, Icon::Component

      attr_reader :builder, :color, :size

      def initialize(builder: :button, color: nil, size: nil, **user_attrs)
        @builder = builder
        @color = color
        @size = size

        super(**user_attrs)
      end

      private

      def default_attrs
        { class: style(color:, size:) }
      end
    end
  end
end
