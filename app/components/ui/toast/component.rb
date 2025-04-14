module UI
  module Toast
    class Component < ApplicationComponent
      renders_one :title
      renders_one :description
      renders_one :icon, UI::Icon::Component

      style do
        base do
          %w[
            pointer-events-auto w-full overflow-hidden rounded-md
            bg-white shadow-lg ring-1 ring-black ring-opacity-5
            dark:bg-zinc-950 dark:border dark:border-zinc-700/80
          ]
        end
      end

      style :wrapper do
        base do
          %w[
            pointer-events-none fixed flex items-center px-4
            py-6 sm:p-6 w-full left-0 right-0 z-[100]
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

      attr_reader :color, :placement, :wrapper_attrs

      def initialize(placement: :top_right, color: :success, wrapper_attrs: {}, **user_attrs)
        @color = color
        @placement = placement
        @wrapper_attrs = AttributeMerger.merge(default_wrapper_attrs, wrapper_attrs)

        super(**user_attrs)
      end

      def default_attrs
        {
          class: style
        }
      end

      def default_wrapper_attrs
        {
          aria_live: "assertive",
          class: style(:wrapper, placement:, color:),
          data: {
            controller: "railsui-toast",
            railsui_toast_trigger_on_load_value: true
          }
        }
      end
    end
  end
end
