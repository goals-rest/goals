module UI
  module Breadcrumb
    class SeparatorComponent < ApplicationComponent
      def initialize(**user_attrs)
        super(**user_attrs)
      end

      def call
        tag.div(**attrs) do
          tag.span(class: "text-zinc-300 dark:text-zinc-500") { "/" }
        end
      end
    end
  end
end
