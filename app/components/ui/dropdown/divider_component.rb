module UI
  module Dropdown
    class DividerComponent < ApplicationComponent
      def call
        tag.div class: "py-1", role: :none, **attrs do
          tag.div(class: "border-t border-zinc-300/80 dark:border-zinc-700/80") end
      end
    end
  end
end
