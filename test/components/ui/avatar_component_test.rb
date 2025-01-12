require "test_helper"

module UI
  module Avatar
    class ComponentTest < ViewComponent::TestCase
      test "renders with default size" do
        render_inline(UI::Avatar::Component.new(
          src: "https://example.com/avatar.png",
          alt: "Default Avatar"
        ))

        assert_selector ".size-12"
        assert_selector "img"
      end

      test "renders with an image and custom size" do
        render_inline(UI::Avatar::Component.new(
          src: "https://example.com/avatar.png",
          alt: "Custom Avatar",
          size: :lg
        ))

        assert_selector ".size-14"
        assert_selector "img[src='https://example.com/avatar.png'][alt='Custom Avatar']"
      end

      test "renders with the correct size variant classes" do
        render_inline(UI::Avatar::Component.new(
          src: "https://example.com/avatar.png",
          size: :xs
        ))

        assert_selector "div.size-6"
      end
    end
  end
end
