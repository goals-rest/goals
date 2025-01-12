module UI
  module Header
    class Preview < ViewComponent::Preview
      def playground
        render UI::Header::Component.new do |header|
          header.with_logo.with_content("Logo")

          header.with_link(href: "http://example.com").with_content("Painel")
          header.with_link.with_content("Desafios")

          header.with_item do
            header.render UI::Button::Component.new(size: :sm) do |button|
              button.with_leading_icon("plus-circle")

              "Criar objetivo"
            end
          end
        end
      end
    end
  end
end
