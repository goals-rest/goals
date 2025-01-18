module Common
  module DarkModeToggle
    class Component < ApplicationComponent
      renders_one :light_mode_icon, UI::Icon::Component
      renders_one :dark_mode_icon, UI::Icon::Component

      def initialize(**user_attrs)
        super(**user_attrs)
      end

      def default_attrs
        {
          data: {
            controller: "dark-mode-toggle",
            action: "dark-mode-toggle#toggle"
          }
        }
      end
    end
  end
end
