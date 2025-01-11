require "test_helper"

module UI
  module Button
    class ComponentTest < ViewComponent::TestCase
      def test_renders_with_default_attributes
        render_inline(UI::Button::Component.new)

        assert_selector "button.btn.btn-primary", count: 1
      end

      def test_renders_with_custom_color
        render_inline(UI::Button::Component.new(color: :secondary))

        assert_selector "button.btn.btn-secondary", count: 1
      end

      def test_renders_with_custom_size
        render_inline(UI::Button::Component.new(size: :lg))

        assert_selector "button.btn.btn-primary.btn-lg", count: 1
      end

      def test_renders_with_both_custom_color_and_size
        render_inline(UI::Button::Component.new(color: :dark, size: :sm))

        assert_selector "button.btn.btn-dark.btn-sm", count: 1
      end

      def test_renders_with_custom_tag
        render_inline(UI::Button::Component.new(builder: :a, color: :light))

        assert_selector "a.btn.btn-light", count: 1
      end

      def test_renders_with_additional_attributes
        render_inline(UI::Button::Component.new(color: :white, size: :lg, id: "custom-id", data: { action: "click->example#action" }))

        assert_selector "button.btn.btn-white.btn-lg#custom-id[data-action='click->example#action']", count: 1
      end

      def test_default_classes_remain_when_unexpected_values_provided
        render_inline(UI::Button::Component.new(color: :nonexistent, size: :nonexistent))

        assert_selector "button.btn", count: 1
        refute_selector "button.btn-nonexistent"
      end

      def test_renders_with_leading_icon
        render_inline(UI::Button::Component.new) do |component|
          component.with_trailing_icon(:plus)
        end

        assert_selector "svg"
      end

      def test_renders_with_trailing_icon
        render_inline(UI::Button::Component.new) do |component|
          component.with_trailing_icon(:plus)
        end

        assert_selector "svg"
      end
    end
  end
end
