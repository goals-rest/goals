module Mentions
  module Mention
    class Component < ApplicationComponent
      style do
        base do
          %w[
            btn-link
          ]
        end
      end

      def initialize(mention:, **attrs)
        @mention = mention
        super(**attrs)
      end

      def call
        tag.a(href: @mention.url, **attrs) { @mention.mentionee.handle }
      end

      private
      def default_attrs
        {
          class: style
        }
      end
    end
  end
end
