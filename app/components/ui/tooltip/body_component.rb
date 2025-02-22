module UI
  module Tooltip
    class BodyComponent < ApplicationComponent
      style do
        base do
          %(
            bg-zinc-900 text-white absolute top-0 left-0 w-max px-3
            py-2 rounded text-sm dark:bg-zinc-700 invisible opacity-0
            transition-opacity duration-300 z-10
          )
        end
      end

      def initialize(**attrs)
        super(**attrs)
      end

      def default_attrs
        {
          class: style(:body),
          data: {
            tooltip_target: "content"
          }
        }
      end
    end
  end
end
