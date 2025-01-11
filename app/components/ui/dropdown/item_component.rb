module UI
  module Dropdown
    class ItemComponent < ApplicationComponent
      attr_reader :href

      style do
        base do
          %w[
            px-4 py-1.5 hover:text-zinc-950 block dark:hover:text-white 
            cursor-pointer
          ]
        end
      end

      attr_reader :href

      def initialize(href: nil, **user_attrs)
        @href = href
        super(**user_attrs)
      end

      def call
        content_tag(html_tag, content, **attrs)
      end

      private

      def default_attrs
        { 
          class: style,
          href: href
        }.compact
      end

      def html_tag
        return :a if href.present?

        :div
      end
    end
  end
end
