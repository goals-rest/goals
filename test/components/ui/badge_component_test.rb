require "test_helper"

module UI
  module Badge
    class ComponentTest < ViewComponent::TestCase
      test "renders the component" do
        render_inline(UI::Badge::Component.new) do |badge|
          badge.with_dismiss_button

          "Badge"
        end

        assert_text "Badge"
        assert_selector "button"
      end

      test "renders the dismiss button with a different html tag" do
        render_inline(UI::Badge::Component.new) do |badge|
          badge.with_dismiss_button(as: :a)

          "Badge"
        end

        assert_text "Badge"
        assert_selector "a"
      end
    end
  end
end
