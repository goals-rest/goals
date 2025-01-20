module UI
  module Breadcrumb
    class LinkComponent < ApplicationComponent
      style do
        variants {
          active {
            yes { %w[text-primary-500 dark:text-primary-500] }
            no { %w[hover:underline hover:text-zinc-600 dark:hover:text-zinc-400] }
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
        link_to(content, href, **attrs)
      end

      def default_attrs
        attrs = { class: style(active:) }
        attrs[:data] = { aria: { current: "page" } } if active

        attrs
      end
    end
  end
end
