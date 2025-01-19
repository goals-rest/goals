module UI
  module Badge
    class Preview < ViewComponent::Preview
      # @param variant select { choices: [ default, pill, outline ] }
      # @param color select { choices: [ gray, red, orange, yellow, green, blue, indigo, purple, pink, white] }
      def playground(variant: :default, color: :gray)
        render UI::Badge::Component.new(variant:, color:) do |badge|
          badge.with_dismiss_button(color:)

          "Badge"
        end
      end
    end
  end
end
