module UI
  module Timeline
    class Component < ApplicationComponent
      style do
        base do
          %w[
            relative border-s border-gray-200 dark:border-gray-700
          ]
        end
      end

      renders_many :items, ItemComponent

      private
      def default_attrs
        {
          class: style
        }
      end
    end
  end
end
