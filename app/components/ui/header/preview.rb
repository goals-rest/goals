module UI
  module Header
    class Preview < ViewComponent::Preview
      def playground
        render UI::Header::Component.new do |header|
          header.with_logo.with_content("Logo")

          header.with_link(href: "http://example.com").with_content("Painel")
          header.with_link.with_content("Desafios")

          header.with_item do
            header.render UI::Button::Component.new(
              variant: :rounded_outlined, 
              color: :dark,
              class: "md:size-10"
            ) do |button|
              header.render UI::Avatar::Component.new(
                src: "https://i.pravatar.cc/300",
              class: "md:size-10"
              )
            end
          end
        end
      end
    end
  end
end
