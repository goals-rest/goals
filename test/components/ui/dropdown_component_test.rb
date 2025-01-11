require "test_helper"

module UI
  module Dropdown
    class ComponentTest < ViewComponent::TestCase
      def test_renders_with_default_alignment
        render_inline(UI::Dropdown::Component.new) do |component|
          component.with_trigger { "Trigger Content" }
          component.with_item { "Item Content" }
        end

        assert_selector(".absolute.left-0.top-14")
      end

      def test_renders_with_custom_alignment
        render_inline(UI::Dropdown::Component.new(alignment: :right)) do |component|
          component.with_trigger { "Trigger Content" }
          component.with_item { "Item Content" }
        end

        assert_selector(".absolute.right-0")
        assert_selector(".origin-top-right")
      end

      def test_renders_multiple_items_and_dividers
        render_inline(UI::Dropdown::Component.new) do |component|
          component.with_trigger { "UI::Dropdown Button" }
          component.with_item { "Inbox" }
          component.with_divider
          component.with_item(href: "#") { "Share" }
          component.with_item(href: "#") { "Export" }
          component.with_divider
          component.with_item(href: "#") { "Delete" }
        end

        assert_text("UI::Dropdown Button")
        assert_text("Inbox")
        assert_text("Share")
        assert_text("Export")
        assert_text("Delete")
        assert_selector("div[role='none']", count: 2)
      end
    end
  end
end
