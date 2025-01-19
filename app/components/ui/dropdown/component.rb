module UI
  module Dropdown
    class Component < ApplicationComponent
      renders_one :trigger
      renders_many :items, types: {
        item: { renders: Dropdown::ItemComponent, as: :item },
        divider: { renders: Dropdown::DividerComponent, as: :divider }
      }

      style do
        base {
          %w[
            hidden transition transform bg-white rounded-xl shadow-xl
            shadow-zinc-900/10 border border-zinc-200 md:w-[200px] w-[320px] z-50
            py-2 dark:bg-zinc-900 dark:shadow-zinc-900/50
            dark:border-zinc-600/80 md:text-[15px] text-base text-zinc-600
            dark:text-zinc-200 font-heading
          ]
        }

        variants {
          alignment {
            left { "origin-top-left absolute left-0 top-14" }
            right { "origin-top-right absolute right-0 top-14" }
          }
        }

        defaults { { alignment: :left } }
      end

      attr_reader :alignment

      def initialize(alignment: nil, **user_attrs)
        @alignment = alignment

        super(**user_attrs)
      end

      private

      def default_attrs
        { class: style(alignment:) }
      end
    end
  end
end
