module UI
  module Flash
    class Component < ApplicationComponent
      style do
        base do
          %w[
            text-white text-center p-4
          ]
        end

        variants {
          type {
            notice { "bg-secondary-600" }
            alert { "bg-primary-500" }
          }
        }

        defaults { { type: :notice } }
      end

      attr_reader :type

      def initialize(type: nil, auto_hide: false, **user_attrs)
        @type = type
        @auto_hide = auto_hide

        super(**user_attrs)
      end

      def default_attrs
        {
          role: :alert,
          class: style(type:),
          data: {
            controller: auto_hide? ? "flash" : ""
          }
        }
      end

      def auto_hide?
        @auto_hide
      end
    end
  end
end
