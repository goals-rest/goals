module UI
  module Card
    class MediaComponent < ApplicationComponent
      style :wrapper do
        base do
          %w[
            relative px-3 pt-3
          ]
        end
      end

      style do
        base do
          %w[
            rounded h-[174px] w-full object-cover object-center dark:border 
            dark:border-zinc-600/80 border-transparent
          ]
        end
      end

      attr_reader :src, :wrapper_attrs

      def initialize(src: nil, wrapper_attrs: {}, **user_attrs)
        @src = src
        @wrapper_attrs = AttributeMerger.new(default_wrapper_attrs, wrapper_attrs).merge

        super(**user_attrs)
      end

      def default_attrs
        {
          class: style
        }
      end

      def default_wrapper_attrs
        {
          class: style(:wrapper)
        }
      end
    end
  end
end
