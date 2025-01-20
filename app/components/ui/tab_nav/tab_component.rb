module UI
  module TabNav
    class TabComponent < ApplicationComponent
      renders_one :title, ApplicationComponent
      renders_one :icon, ->(name, **user_attrs) do
        UI::Icon::Component.new(name, class: "size-5", **user_attrs)
      end

      style do
        base do
          %w[
            py-2 px-4 border-b flex items-center space-x-3 bg-white
            whitespace-nowrap rounded-t
          ]
        end

        variants {
          active {
            yes {
              %w[
                border-primary-500 text-primary-500 dark:bg-primary-500
                dark:text-white dark:border-primary-600
              ]
            }

            no {
              %w[
                dark:border-zinc-600 dark:bg-transparent
              ]
            }
          }
        }
      end

      attr_reader :as, :active

      def initialize(as: :a, active: false, **user_attrs)
        @as = as
        @active = active

        super(**user_attrs)
      end

      def active?
        active
      end

      private
      def default_attrs
        {
          class: style(active: active?)
        }
      end
    end
  end
end
