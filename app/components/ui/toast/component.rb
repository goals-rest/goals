module UI
  module Toast
    class Component < ApplicationComponent
      renders_one :title
      renders_one :description
      renders_one :icon, UI::Icon::Component

      style do
        base do
          %w[
            pointer-events-none absolute flex items-center px-4
            py-6 sm:p-6 w-full left-0 right-0
          ]
        end

        variants {
          placement {
            top_right {
              "justify-end top-0 animate-toast-from-right"
            }

            bottom_right {
              "justify-end top-0 animate-toast-from-right"
            }

            bottom_left {
              "bottom-0 animate-toast-from-left"
            }

            top_left {
              "bottom-0 animate-toast-from-left"
            }
          }
        }
      end

      attr_reader :color, :placement

      def initialize(placement: :top_right, color: :success, **user_attrs)
        @color = color
        @placement = placement

        super(**user_attrs)
      end

      def default_attrs
        {
          aria_live: "assertive",
          class: style(placement:, color:),
          data: {
            controller: "railsui-toast",
            railsui_toast_trigger_on_load_value: true
          }
        }
      end
    end
  end
end
