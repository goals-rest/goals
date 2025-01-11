module UI
  module Dropdown
    class Preview < ViewComponent::Preview
      # @param alignment select { choices: [ left, right ] } }
      def playground(alignment: :left)
        render(UI::Dropdown::Component.new(alignment:, class: "md:w-[200px] w-full")) do |dropdown|
          dropdown.with_trigger do
            dropdown.render UI::Button::Component.new.with_content("Dropdown")
          end

          dropdown.with_item.with_content("Inbox")
          dropdown.with_divider
          dropdown.with_item(href: "#").with_content("Share")
          dropdown.with_item(href: "#").with_content("Export")
          dropdown.with_divider
          dropdown.with_item(href: "#").with_content("Delete")
        end
      end
    end
  end
end
