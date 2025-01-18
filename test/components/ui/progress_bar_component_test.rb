require "test_helper"

module UI
  module ProgressBar
    class ComponentTest < ViewComponent::TestCase
      def test_renders_the_component
        render_inline(UI::ProgressBar::Component.new(progress: 0.5))

        assert_selector "div", count: 2
        assert_selector "div[style='width: 50.0%']"
      end
    end
  end
end
