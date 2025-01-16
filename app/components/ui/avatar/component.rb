module UI
  module Avatar
    class Component < ApplicationComponent
      renders_one :placeholder

      style do
        base do
          %w[
            relative rounded-full flex items-center
            justify-center
          ]
        end

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

      style :icon do
        base do
          %w[
            text-zinc-500
          ]
        end

        variants {
          size {
            xs { "w-4 h-4" }
            sm { "w-6 h-6" }
            base { "w-8 h-8" }
            lg { "w-10 h-10" }
          }
        }
      end

      attr_reader :src, :alt, :size, :icon_attrs

      def initialize(src: nil, alt: nil, size: nil, icon_attrs: {}, **user_attrs)
        @src = src
        @alt = alt
        @size = size
        @icon_attrs = AttributeMerger.new(default_icon_attrs, icon_attrs).merge

        super(**user_attrs)
      end

      def default_attrs
        {
          class: style(size:)
        }
      end

      private
      def src?
        src.present?
      end

      def default_icon_attrs
        {
          variant: :solid,
          class: style(:icon, size:)
        }
      end
    end
  end
end
