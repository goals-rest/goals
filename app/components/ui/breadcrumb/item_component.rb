module UI
  module Breadcrumb
    class ItemComponent < ApplicationComponent
      style do
        variants {
          active {
            yes { %w[text-zinc-700 dark:text-zinc-200] }
            no { %w[text-primary-500 dark:text-primary-500] }
          }
        }
      end

      attr_reader :active, :href

      def initialize(active: false, href: "#", **user_attrs)
        @active = active
        @href = href
        super(**user_attrs)
      end

      def call
        if active
          tag.div(content, **attrs)
        else
          link_to(content, href, **attrs)
        end
      end

      def default_attrs
        attrs = { class: style(active:) }
        attrs[:data] = { aria: { current: "page" } } if active

        attrs
      end
    end
  end
end
