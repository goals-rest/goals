module UI
  module Header
    class LinkComponent < ApplicationComponent
      attr_reader :href

      def initialize(href: nil, **user_attrs)
        @href = href

        super(**user_attrs)
      end

      def default_attrs
        {
          class: "rui-nav-link"
        }
      end

      private
      def active?
        return false if href.blank?

        current_page?(href)
      end

      def classes
        class_names(attrs[:class], ("rui-nav-link-active" if active?))
      end
    end
  end
end
