module UI
  module Card
    class Preview < ViewComponent::Preview
      def playground
        render UI::Card::Component.new do |card|
          card.render(UI::Card::MediaComponent.new(src: "https://picsum.photos/600/600"))
        end
      end
    end
  end
end
