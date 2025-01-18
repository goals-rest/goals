require "test_helper"

module UI
  module Card
    class ComponentTest < ViewComponent::TestCase
      def test_renders_the_component
        render_inline(UI::Card::Component.new) do |card|
          [
            card.render(UI::Card::MediaComponent.new(src: "http://example.com/image.png")),
            card.render(UI::Card::HeaderComponent.new) do |header|
              header.with_title.with_content("Card Title")
              header.with_subtitle.with_content("Card Subtitle")
            end,
            card.render(UI::Card::BodyComponent.new.with_content("Card Body")),
            "Content"
          ].join("\n").html_safe
        end

        assert_selector "img[src='http://example.com/image.png']"
        assert_text "Card Title"
        assert_text "Card Subtitle"
        assert_text "Card Body"
        assert_text "Content"
      end
    end
  end
end
