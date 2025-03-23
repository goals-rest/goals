module UI
  module Counter
    class ButtonComponent < ApplicationComponent
      style do
        base do
          %(
            btn btn-white rounded-full w-8 h-8 flex items-center
            justify-center p-0 cursor-pointer shrink-0 shadow-none
          )
        end
      end

      def initialize(**attrs)
        super(**attrs)
      end

      def call
        tag.button(content, type: :button, **attrs)
      end

      def default_attrs
        {
          class: style
        }
      end
    end
  end
end
