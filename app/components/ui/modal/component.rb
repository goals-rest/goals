module UI
  module Modal
    class Component < ApplicationComponent
      renders_one :trigger, ApplicationComponent
      renders_one :close_button

      style do
        base do
          %w[
            relative hidden rounded-xl mx-auto shadow-xl bg-white m-1
            origin-bottom text-center dark:bg-zinc-700 dark:text-zinc-200
          ]
        end
      end

      attr_reader :open, :static

      def initialize(open: false, static: false, **user_attrs)
        @open = open
        @static = static

        super(**user_attrs)
      end

      def static?
        static
      end

      def default_attrs
        {
          class: style,
          data: {
            modal_target: "content",
            transition_enter_active: "transition ease-out duration-300",
            transition_enter_from: "transform opacity-0 scale-95",
            transition_enter_to: "transform opacity-100 scale-100",
            transition_leave_active: "transition ease-in duration-300",
            transition_leave_from: "transform opacity-100 scale-100",
            transition_leave_to: "transform opacity-0 scale-95"
          }
        }
      end
    end
  end
end
