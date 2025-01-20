require "test_helper"

module UI
  module Breadcrumb
    class ComponentTest < ViewComponent::TestCase
      test "renders the component" do
        render_inline(UI::Breadcrumb::Component.new) do |breadcrumb|
          breadcrumb.with_item(href: "#").with_content("Goals")
          breadcrumb.with_separator
          breadcrumb.with_item(href: "#").with_content("New goal")
        end

        assert_selector "a[href='#']", text: "Goals"
        assert_selector "span", text: "/"
        assert_selector "a[href='#']", text: "New goal"
      end
    end
  end
end
