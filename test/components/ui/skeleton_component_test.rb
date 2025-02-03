require "test_helper"

module UI
  module Skeleton
    class ComponentTest < ViewComponent::TestCase
      def test_renders_the_component
        render_inline(UI::Skeleton::Component.new(class: "w-8 h-8"))

        assert_selector "span"
      end

      def test_renders_with_rounded_false
        render_inline(UI::Skeleton::Component.new(rounded: false, class: "w-8 h-8"))

        assert_selector "span"
        assert_no_selector ".rounded-full"
      end
    end
  end
end
