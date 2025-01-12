require "test_helper"

module UI
  module Header
    class ComponentTest < ViewComponent::TestCase
      def test_renders_header_with_links_and_button
        render_inline(UI::Header::Component.new) do |header|
          header.with_logo.with_content("Logo")

          header.with_link(href: "https://example.com").with_content("Painel")
          header.with_link.with_content("Desafios")

          header.with_item do
            header.render UI::Button::Component.new(size: :sm) do |button|
              button.with_leading_icon("plus-circle")
              "Criar objetivo"
            end
          end
        end

        assert_text "Logo"
        assert_selector("a[href='https://example.com']", text: "Painel")
        assert_selector("a", text: "Desafios")
        assert_selector("button", text: "Criar objetivo")
      end
    end
  end
end
