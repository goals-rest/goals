module UI
  module Breadcrumb
    class ItemComponent < ApplicationComponent
      style do
        variants {
          first {
            no { %w[flex space-x-3] }
          }
        }
      end

      renders_one :separator, UI::Breadcrumb::SeparatorComponent
      renders_one :link, UI::Breadcrumb::LinkComponent

      attr_reader :first

      def initialize(first: false, **user_attrs)
        @first = first
        super(**user_attrs)
      end

      def call
        tag.li(**attrs) do
          concat(separator.call) if separator?
          concat(link.call) if link?
        end
      end

      def default_attrs
        {
          class: style(first:)
        }
      end
    end
  end
end
