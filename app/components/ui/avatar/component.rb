module UI
  module Avatar
    class Component < ApplicationComponent
      style do
        base do
          %w[
            relative rounded-full md:w-10 md:h-10 size-12 flex items-center
            justify-center
          ]

          variants {
            size {
              xs { "size-6" }
              sm { "size-10" }
              base { "size-12" }
              lg { "size-14" }
            }
          }

          defaults { { size: :base } }
        end
      end

      attr_reader :src, :alt, :size

      def initialize(src: nil, alt: nil, size: nil, **user_attrs)
        @src = src
        @alt = alt
        @size = size

        super(**user_attrs)
      end

      def default_attrs
        {
          class: style(size:)
        }
      end
    end
  end
end
