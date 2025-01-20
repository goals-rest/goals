require "test_helper"

module UI
  module TabNav
    class ComponentTest < ViewComponent::TestCase
      def test_renders_the_component
        render_inline(UI::TabNav::Component.new) do |tab_nav|
          tab_nav.with_tab(href: "http://example.com/activities", active: true) do |tab|
            tab.with_title.with_content("Activity")
            tab.with_icon("chat-bubble-oval-left-ellipsis")
          end

          tab_nav.with_tab(href: "#") do |tab|
            tab.with_title.with_content("Account")
            tab.with_icon("user-circle")
          end
        end

        assert_text "Activity"
        assert_text "Account"
        assert_selector "svg", count: 2
        assert_selector ".border-primary-500", count: 1
        assert_selector "a[href='http://example.com/activities']"
      end

      def test_renders_with_different_html_tag
        render_inline(UI::TabNav::Component.new) do |tab_nav|
          tab_nav.with_tab(as: :button) do |tab|
            tab.with_title.with_content("Activity")
            tab.with_icon("chat-bubble-oval-left-ellipsis")
          end
        end

        assert_selector "button"
      end
    end
  end
end
