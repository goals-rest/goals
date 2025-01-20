module UI
  module TabNav
    class Preview < ViewComponent::Preview
      # @param as select { choices: [ a, div, button ] }
      # @param active toggle
      def playground(as: :a, active: true)
        render(UI::TabNav::Component.new) do |tab_nav|
          tab_nav.with_tab(as:, href: "#", active:) do |tab|
            tab.with_title.with_content("Activity")
            tab.with_icon("chat-bubble-oval-left-ellipsis")
          end

          tab_nav.with_tab(as:, href: "#") do |tab|
            tab.with_title.with_content("Account")
            tab.with_icon("user-circle")
          end
        end
      end
    end
  end
end
