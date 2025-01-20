require "test_helper"

module UI
  module EmtpyState
    class ComponentTest < ViewComponent::TestCase
      test "renders the component" do
        render_inline (UI::EmptyState::Component.new) do |empty_state|
          empty_state.with_icon("document", class: "size-8 font-semibold font-heading text-zinc-900 dark:text-zinc-100")
          empty_state.with_title.with_content("No goals")
          empty_state.with_description.with_content("No goals found")
          empty_state.with_actions do
            empty_state.render UI::Button::Component.new do |button|
              button.with_leading_icon("plus-circle")

              "Create goal"
            end
          end
        end

        assert_text "No goals"
        assert_text "No goals found"
        assert_selector "svg", count: 2
        assert_selector "button"
      end
    end
  end
end
