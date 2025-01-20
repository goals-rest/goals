module UI
  module Breadcrumb
    class Component < ApplicationComponent
      style do
        base { %w[my-6 font-medium flex text-zinc-500 text-sm] }
      end

      style :ol do
        base { %w[flex flex-wrap items-center space-x-3 list-none m-0 p-0] }
      end

      renders_many :items, UI::Breadcrumb::ItemComponent

      def initialize(**user_attrs)
        super(**user_attrs)
      end

      def default_attrs
        {
          aria: { label: "breadcrumb" },
          class: style
        }
      end
    end
  end
end
