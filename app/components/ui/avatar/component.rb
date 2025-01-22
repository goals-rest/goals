module UI
  module Avatar
    class Component < ApplicationComponent
      renders_one :placeholder

      style do
        base do
          %w[
            rounded-full select-none pointer-events-none shrink-0 object-cover
          ]
        end

        variants {
          size {
            xs { "size-6" }
            sm { "size-10" }
            base { "size-12" }
            lg { "size-14" }
            xl { "size-16" }
          }
        }

        defaults { { size: :base } }
      end

      attr_reader :src, :size

      def initialize(src: nil, size: nil, **user_attrs)
        @src = src
        @size = size

        super(**user_attrs)
      end

      def default_attrs
        {
          class: style(size:)
        }
      end

      private
      def placeholder_src
        asset_url("avatar_placeholder.png")
      end
    end
  end
end
