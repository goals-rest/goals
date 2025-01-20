module UI
  module TabNav
    class Component < ApplicationComponent
      renders_many :tabs, UI::TabNav::TabComponent

      style do
        base do
          %w[
            pb-4
          ]
        end
      end

      def initialize(**user_attrs)
        super(**user_attrs)
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
