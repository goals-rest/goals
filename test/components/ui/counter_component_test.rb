require "test_helper"

module UI
  module Counter
    class ComponentTest < ViewComponent::TestCase
      def test_renders_the_component
        render_inline(UI::Counter::Component.new) do |counter|
          counter.with_decrement_button
          counter.with_increment_button
          counter.with_input(value: 10)
        end

        assert_selector("input[value='10']")
      end
    end
  end
end
