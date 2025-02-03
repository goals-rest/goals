module UI
  module Skeleton
    class Component < ApplicationComponent
      style do
        base do
          %w[
            inline-flex animate-pulse bg-zinc-200
            dark:bg-zinc-700 text-zinc-200 dark:text-zinc-700 leading-none
          ]
        end

        variants {
          rounded {
            yes { "rounded-full" }
          }
        }
      end

      attr_reader :rounded

      def initialize(rounded: true, **user_attrs)
        @rounded = rounded

        super(**user_attrs)
      end

      def call
        tag.span(content, **attrs)
      end

      def rounded?
        @rounded
      end

      private
      def default_attrs
        {
          class: style(rounded: rounded?),
          tabindex: -1,
          inert: true
        }
      end
    end
  end
end
