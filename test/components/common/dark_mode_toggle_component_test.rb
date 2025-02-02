require "test_helper"

module DarkModeToggle
  class ComponentTest < ViewComponent::TestCase
    test "renders the component" do
      render_inline(DarkModeToggle::Component.new) do |toggle|
        toggle.with_light_mode_icon("sun")
        toggle.with_dark_mode_icon("moon")
      end

      assert_selector "button"
      assert_selector "svg", visible: false, count: 2
    end
  end
end
