module UI
  module Card
    class Component < ApplicationComponent
      style do
        base do
          %w[
            border border-zinc-300/90 shadow-sm shadow-zinc-300/20 rounded-lg
            dark:shadow-zinc-950/50 dark:bg-zinc-800/90
            dark:border-zinc-600/80 dark:focus:ring-zinc-600/30
            dark:focus:border-zinc-600
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
