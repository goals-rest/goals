module UI
  module Card
    class Preview < ViewComponent::Preview
      def playground
        render UI::Card::Component.new do |card|
          safe_join([
            card.render(UI::Card::MediaComponent.new(src: "https://picsum.photos/600/600")),
            card.render(UI::Card::HeaderComponent.new) do |header|
              header.with_title.with_content("Read 10 books in 2025")
              header.with_subtitle.with_content("Expanding My World, One Book at a Time")
            end
          ])
        end
      end
    end
  end
end
