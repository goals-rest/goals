require "test_helper"

module UI
  module Typography
    class ComponentTest < ViewComponent::TestCase
      test "renders" do
        render_inline(UI::Typography::Component.new(as: :h1, variant: :h1, color: :text_primary)
          .with_content("A typography component"))

        assert_selector "h1", text: "A typography component"
      end
    end
  end
end
