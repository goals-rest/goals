module UI
  module Icon
    class Component < ApplicationComponent
      VARIANTS = %i[outline solid micro mini].freeze

      style do
        variants do
          color {
            primary { "text-primary" }
            secondary { "text-secondary" }
            dark { "text-dark" }
            light { "text-light" }
            white { "text-white" }
            transparent { "text-transparent" }
            link { "text-link" }
          }

          size {
            xs { "w-3 h-3" }
            sm { "w-4 h-4" }
            base { "w-5 h-5" }
            lg { "w-6 h-6" }
          }
        end

        defaults { { color: :primary, size: :base } }
      end

      attr_reader :name, :variant, :color, :size

      def initialize(name, variant: :outline, color: nil, size: nil, **user_attrs)
        @name = name
        @color = color
        @size = size
        @variant = variant

        raise ArgumentError, "Invalid variant: #{variant}" unless VARIANTS.include?(variant)

        super(**user_attrs)
      end

      def call
        icon name, variant:, **attrs
      end

      private
      def default_attrs
        {
          class: style(color:, size:)
        }
      end
    end
  end
end
