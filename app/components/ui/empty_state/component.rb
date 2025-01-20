module UI
  module EmptyState
    class Component < ApplicationComponent
      renders_one :icon, UI::Icon::Component
      renders_one :title, ApplicationComponent
      renders_one :description, ApplicationComponent
      renders_one :actions

      style do
        base do
          %w[
            text-center flex flex-col items-center justify-center space-y-2
          ]
        end

        variants {
          narrow {
            yes { "py-6 md:py-8" }
            no { "py-6 md:py-16" }
          }
        }

        defaults { { narrow: false } }
      end

      attr_reader :narrow

      def initialize(narrow: false, **user_attrs)
        @narrow = narrow

        super(**user_attrs)
      end

      def narrow?
        narrow
      end

      def default_attrs
        {
          class: style(narrow: narrow?)
        }
      end
    end
  end
end
