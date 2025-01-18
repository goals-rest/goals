module UI
  module Card
    class Preview < ViewComponent::Preview
      def playground
        render UI::Card::Component.new do |card|
          "Card content"
        end
      end
    end
  end
end
