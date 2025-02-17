require "test_helper"

module LoadMoreButton
  class ComponentTest < ViewComponent::TestCase
    test "renders the component" do
      render_inline(LoadMoreButton::Component.new(href: "/")) { "Some text" }

      assert_selector "a[href='/']"
      assert_text "Some text"
    end
  end
end
