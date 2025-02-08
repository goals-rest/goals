require "test_helper"

module LikeButton
  class ComponentTest < ViewComponent::TestCase
    test "renders the component" do
      render_inline(LikeButton::Component.new)

      assert_selector "button"
      assert_no_selector ".text-primary-600"
    end

    test "renders the component with a different color when 'liked' is true" do
      render_inline(LikeButton::Component.new(liked: true))

      assert_selector ".text-primary-600"
    end
  end
end
