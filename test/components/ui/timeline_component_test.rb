require "test_helper"

module UI
  module Timeline
    class ComponentTest < ViewComponent::TestCase
      def test_renders_the_component
        render_inline(UI::Timeline::Component.new) do |timeline|
          timeline.with_item do |item|
            item.with_badge(class: "bg-primary-100 dark:bg-primary-900") do |badge|
              badge.with_icon("check-circle", class: "size-4 text-primary-800 dark:text-primary-300")
            end
            item.with_body.with_content("Timeline Item")
          end
        end

        assert_selector "svg"
        assert_text "Timeline Item"
      end
    end
  end
end
