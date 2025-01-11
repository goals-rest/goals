require "test_helper"

module UI
  module Icon
    class ComponentTest < ViewComponent::TestCase
      def test_renders_default_icon
        render_inline(UI::Icon::Component.new("user"))

        assert_selector("svg")
        assert_selector(".text-primary")
        assert_selector(".w-5.h-5")
      end

      def test_renders_with_custom_color_and_size
        render_inline(UI::Icon::Component.new("user", color: :secondary, size: :lg))

        assert_selector(".text-secondary")
        assert_selector(".w-6.h-6")
      end

      def test_renders_with_variant
        render_inline(UI::Icon::Component.new("user", variant: :solid))

        assert_selector("svg")
        assert_selector("[variant='solid']")
      end

      def test_raises_error_for_invalid_variant
        assert_raises ArgumentError do
          UI::Icon::Component.new("user", variant: :invalid)
        end
      end

      def test_applies_default_styles
        component = UI::Icon::Component.new("user")

        assert_includes component.send(:default_attrs)[:class], "text-primary"
        assert_includes component.send(:default_attrs)[:class], "w-5 h-5"
      end

      def test_renders_with_all_valid_variants
        UI::Icon::Component::VARIANTS.each do |variant|
          render_inline(UI::Icon::Component.new("user", variant:))
          assert_selector("svg")
        end
      end
    end
  end
end
