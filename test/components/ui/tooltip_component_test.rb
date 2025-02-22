require "test_helper"

module UI
  module Tooltip
    class ComponentTest < ViewComponent::TestCase
      def test_renders_the_component
        render_inline(UI::Tooltip::Component.new) do |tooltip|
          tooltip.with_trigger.with_content("Trigger")
          tooltip.with_body.with_content("Tooltip content.")
        end

        assert_text "Trigger"
        assert_text "Tooltip content."
      end
    end
  end
end
