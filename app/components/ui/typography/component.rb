module UI
  module Typography
    class Component < ApplicationComponent
      VARIANTS = %i[
        h1 h2 h3 h4 h5 h6 subtitle1 subtitle2 body1 body2 caption
      ].freeze

      COLORS = %i[
        primary
        secondary
        dark
        light
        text_primary
        text_secondary
      ].freeze

      style do
        variants {
          variant {
            h1 { %w[h1] }
            h2 { %w[h2] }
            h3 { %w[h3] }
            h4 { %w[h4] }
            h5 { %w[h5] }
            h6 { %w[h6] }
            subtitle1 { %w[text-base font-heading font-light tracking-normal] }
            subtitle2 { %w[text-sm font-heading font-light tracking-normal] }
            body1 { %w[text-base font-normal] }
            body2 { %w[text-sm font-normal] }
            caption { %w[text-xs font-normal] }
          }

          color {
            primary { %w[text-primary-500] }
            secondary { %w[text-secondary-500] }
            dark { %w[text-zinc-800 dark:text-zinc-700] }
            light { %w[text-zinc-100/80 ] }
            text_primary { %w[text-zinc-900 dark:text-zinc-100] }
            text_secondary { %w[text-zinc-700 dark:text-zinc-300] }
          }

          no_wrap {
            yes { %w[whitespace-nowrap] }
          }
        }

        defaults { { variant: :body1, color: :primary } }
      end

      attr_reader :as, :variant, :color, :no_wrap

      def initialize(as: :span, variant: :body1, color: :text_primary, no_wrap: false, **user_attrs)
        raise ArgumentError, "Invalid variant: #{variant}" unless VARIANTS.include?(variant)
        raise ArgumentError, "Invalid color: #{color}" unless COLORS.include?(color)

        @as = as
        @variant = variant
        @color = color
        @no_wrap = no_wrap

        super(**user_attrs)
      end

      def call
        content_tag(as, content, **default_attrs)
      end

      def default_attrs
        {
          class: style(variant:, color:, no_wrap:)
        }
      end
    end
  end
end
