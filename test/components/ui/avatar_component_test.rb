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

      test "renders with the placeholder" do
        render_inline(UI::Avatar::Component.new) do |avatar|
          avatar.with_placeholder
        end

        assert_selector "svg"
      end

      test "hides the placeholder when a src is present" do
        render_inline(UI::Avatar::Component.new(src: "https://example.com/avatar.png")) do |avatar|
          avatar.with_placeholder
        end

        assert_no_selector "svg"
      end
    end
  end
end
