module UI
  module Button
    class Component < ApplicationComponent
      style :default do base { %w[btn gap-2] }
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
            sm { %w[btn-sm] }
            base { [] }
            lg { %w[btn-lg] }
          }
        }

        defaults { { color: :primary, size: :base } }
      end

      style :square do base { %w[btn gap-2] }
        base do
          %w[
            rounded-lg inline-flex items-center justify-center border
            focus:ring-4 transition ease-in-out duration-200 group",
          ]
        end

        variants {
          color {
            transparent do
              %w[
                bg-transparent hover:bg-zinc-50 border-transparent
                focus:border-zinc-300/80 focus:bg-white focus:ring-zinc-300/20
                dark:hover:bg-zinc-700 dark:focus:bg-zinc-700
                dark:focus:border-zinc-500 dark:focus:ring-zinc-600/70
              ]
            end
          }

          size {
            base { %w[px-2 py-1 ] }
          }
        }

        defaults { { color: :transparent, size: :base } }
      end

      style :rounded do
        base {
          %w[
            rounded-full transition-colors ease-in-out duration-300
            disabled:opacity-50 disabled:pointer-events-none
            disabled:cursor-not-allowed inline-flex items-center justify-center gap-2
          ]
        }

        variants {
          color {
            primary {
              %w[btn-primary]
            }
            secondary { %w[btn-secondary] }
            dark { %w[btn-dark] }
            light { %w[btn-light] }
            white { %w[btn-white] }
            transparent { %w[btn-transparent] }
            link { %w[btn-link] }
          }

          size {
            sm { %w[size-7] }
            base { %w[size-12] }
            lg { %w[size-[3.5rem]] }
          }
        }

        defaults { { color: :primary, size: :base } }
      end

      style :rounded_outlined do
        base {
          %w[
            rounded-full transition-colors ease-in-out duration-300
            disabled:opacity-50 disabled:pointer-events-none
            disabled:cursor-not-allowed inline-flex items-center justify-center gap-2
          ]
        }

        variants {
          color {
            primary {
              %w[
                border-primary-300 border flex items-center justify-center
                focus:border-primary-400 focus:ring-4 focus:ring-primary-200/80
                hover:border-primary-300/90 dark:border-primary-600
                dark:focus:ring-primary-700 dark:focus:border-primary-300/90
              ]
            }
            secondary {
              %w[
                border-secondary-300 border flex items-center justify-center
                focus:border-secondary-400 focus:ring-4 focus:ring-secondary-200/80
                hover:border-secondary-300/90 dark:border-secondary-600
                dark:focus:ring-secondary-700 dark:focus:border-secondary-300/90
              ]
            }
            dark {
              %w[
                border-zinc-300 border flex items-center justify-center
                focus:border-zinc-400 focus:ring-4 focus:ring-zinc-200/80
                hover:border-zinc-300/90 dark:border-zinc-600
                dark:focus:ring-zinc-700 dark:focus:border-zinc-300/90
              ]
            }
          }

          size {
            sm { %w[size-7] }
            base { %w[size-12] }
            lg { %w[size-[3.5rem]] }
          }
        }

        defaults { { color: :primary, size: :base } }
      end

      renders_one :leading_icon, Icon::Component
      renders_one :trailing_icon, Icon::Component

      attr_reader :builder, :color, :size, :variant

      def initialize(builder: :button, variant: :default, color: nil, size: nil, **user_attrs)
        @builder = builder
        @color = color
        @size = size
        @variant = variant

        super(**user_attrs)
      end

      private

      def default_attrs
        { class: style(variant, color:, size:) }
      end
    end
  end
end
